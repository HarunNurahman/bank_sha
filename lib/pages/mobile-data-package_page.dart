import 'package:bank_sha/bloc/auth/auth_bloc.dart';
import 'package:bank_sha/bloc/data_plan/data_plan_bloc.dart';
import 'package:bank_sha/models/mobile-data-package_model.dart';
import 'package:bank_sha/models/mobile-data-plan_model.dart';
import 'package:bank_sha/models/mobile-operator_model.dart';
import 'package:bank_sha/pages/widgets/custom-button.dart';
import 'package:bank_sha/pages/widgets/custom-textfield.dart';
import 'package:bank_sha/pages/widgets/data-package_item.dart';
import 'package:bank_sha/shared/shared_method.dart';
import 'package:bank_sha/shared/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MobileDataPackagePage extends StatefulWidget {
  final MobileOperatorModel mobileOperator;
  const MobileDataPackagePage({super.key, required this.mobileOperator});

  @override
  State<MobileDataPackagePage> createState() => _MobileDataPackagePageState();
}

class _MobileDataPackagePageState extends State<MobileDataPackagePage> {
  final phoneNumberController = TextEditingController(text: '+62');
  MobileDataPlanModel? selectedPlan;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DataPlanBloc(),
      child: BlocConsumer<DataPlanBloc, DataPlanState>(
        listener: (context, state) {
          if (state is DataPlanFailed) {
            showCustomSnackBar(context, state.errorMessage);
          }

          if (state is DataPlanSuccess) {
            context.read<AuthBloc>().add(
                  AuthUpdateBalance(
                    selectedPlan!.price! * -1,
                  ),
                );

            Navigator.pushNamedAndRemoveUntil(
              context,
              '/mobile-data-success',
              (route) => false,
            );
          }
        },
        builder: (context, state) {
          if (state is DataPlanLoading) {
            return Scaffold(
                body: Center(
              child: CircularProgressIndicator(
                color: blueColor,
              ),
            ));
          }
          return Scaffold(
            appBar: AppBar(
              title: const Text('Paket Data'),
            ),
            body: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              children: [
                const SizedBox(height: 30),
                // phoneNumberInput(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Phone Number',
                      style: blackTextStyle.copyWith(
                        fontSize: 16,
                        fontWeight: semiBold,
                      ),
                    ),
                    const SizedBox(height: 14),
                    CustomTextField(
                      text: '+62',
                      controller: phoneNumberController,
                      isShowTitle: false,
                      keyboardType: TextInputType.number,
                      maxLength: 13,
                    ),
                  ],
                ),
                const SizedBox(height: 40),
                // selectPackage(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Select Package',
                      style: blackTextStyle.copyWith(
                        fontSize: 16,
                        fontWeight: semiBold,
                      ),
                    ),
                    const SizedBox(height: 14),
                    Wrap(
                      spacing: 15,
                      runSpacing: 15,
                      children: widget.mobileOperator.dataPlan!
                          .map(
                            (plan) => GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedPlan = plan;
                                });
                              },
                              child: DataPackageItem(
                                dataPlan: plan,
                                isSelected: plan.id == selectedPlan?.id,
                              ),
                            ),
                          )
                          .toList(),
                    )
                  ],
                ),
              ],
            ),
            // Continue button
            bottomNavigationBar:
                (selectedPlan != null && phoneNumberController.text.isNotEmpty)
                    ? Padding(
                        padding: const EdgeInsets.all(24.0),
                        child: CustomButton(
                          text: 'Continue',
                          ontap: () async {
                            if (await Navigator.pushNamed(context, '/pin') ==
                                true) {
                              final authState = context.read<AuthBloc>().state;
                              String pin = '';
                              if (authState is AuthSuccess) {
                                pin = authState.user.pin!;
                              }
                              context.read<DataPlanBloc>().add(
                                    PostDataPlan(
                                      MobileDataPackageModel(
                                        id: selectedPlan?.id,
                                        phoneNumber: phoneNumberController.text,
                                        pin: pin,
                                      ),
                                    ),
                                  );
                            }
                          },
                        ),
                      )
                    : null,
          );
        },
      ),
    );
  }

  Widget phoneNumberInput() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Phone Number',
          style: blackTextStyle.copyWith(
            fontSize: 16,
            fontWeight: semiBold,
          ),
        ),
        const SizedBox(height: 14),
        CustomTextField(
          text: '+62',
          controller: phoneNumberController,
          isShowTitle: false,
          keyboardType: TextInputType.number,
        ),
      ],
    );
  }

  Widget selectPackage() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Select Package',
          style: blackTextStyle.copyWith(
            fontSize: 16,
            fontWeight: semiBold,
          ),
        ),
        const SizedBox(height: 14),
        BlocConsumer<DataPlanBloc, DataPlanState>(
          listener: (context, state) {
            if (state is DataPlanFailed) {
              showCustomSnackBar(context, state.errorMessage);
            }

            if (state is DataPlanSuccess) {
              context.read<AuthBloc>().add(
                    AuthUpdateBalance(
                      selectedPlan!.price! * -1,
                    ),
                  );

              Navigator.pushNamedAndRemoveUntil(
                context,
                '/mobile-data-success',
                (route) => false,
              );
            }
          },
          builder: (context, state) {
            return Wrap(
              spacing: 15,
              runSpacing: 15,
              children: widget.mobileOperator.dataPlan!
                  .map(
                    (plan) => GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedPlan = plan;
                        });
                      },
                      child: DataPackageItem(
                        dataPlan: plan,
                        isSelected: plan.id == selectedPlan?.id,
                      ),
                    ),
                  )
                  .toList(),
            );
          },
        )
      ],
    );
  }
}
