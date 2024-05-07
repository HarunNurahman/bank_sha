import 'package:bank_sha/bloc/auth/auth_bloc.dart';
import 'package:bank_sha/bloc/mobile_operator/mobile_operator_bloc.dart';
import 'package:bank_sha/models/mobile-operator_model.dart';
import 'package:bank_sha/pages/mobile-data-package_page.dart';
import 'package:bank_sha/pages/widgets/custom-button.dart';
import 'package:bank_sha/pages/widgets/data-provider_item.dart';
import 'package:bank_sha/shared/shared_method.dart';
import 'package:bank_sha/shared/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MobileDataPage extends StatefulWidget {
  const MobileDataPage({super.key});

  @override
  State<MobileDataPage> createState() => _MobileDataPageState();
}

class _MobileDataPageState extends State<MobileDataPage> {
  MobileOperatorModel? selectedOperator;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Beli Data'),
      ),
      body: BlocProvider(
        create: (context) => MobileOperatorBloc()..add(GetMobileOperator()),
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          children: [
            const SizedBox(height: 30),
            walletInformation(),
            const SizedBox(height: 40),
            selectProvider(),
          ],
        ),
      ),
      // Continue button
      bottomNavigationBar: selectedOperator != null
          ? Padding(
              padding: const EdgeInsets.all(24.0),
              child: CustomButton(
                text: 'Continue',
                ontap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MobileDataPackagePage(
                        mobileOperator: selectedOperator!,
                      ),
                    ),
                  );
                },
              ),
            )
          : null,
    );
  }

  Widget walletInformation() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'From Wallet',
          style: blackTextStyle.copyWith(
            fontSize: 16,
            fontWeight: semiBold,
          ),
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            // Wallet icons
            Image.asset('assets/images/img_card.png', width: 80),
            const SizedBox(width: 16),
            // Card information
            BlocBuilder<AuthBloc, AuthState>(
              builder: (context, state) {
                if (state is AuthSuccess) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Card number
                      Text(
                        state.user.cardNumber!.replaceAllMapped(
                          RegExp(r".{4}"),
                          (match) => "${match.group(0)} ",
                        ),
                        style: blackTextStyle.copyWith(
                          fontSize: 16,
                          fontWeight: medium,
                        ),
                      ),
                      const SizedBox(height: 2),
                      // Card balance
                      Text(
                        'Balance: ${formatCurrency(state.user.balance!)}',
                        style: grayTextStyle.copyWith(fontSize: 12),
                      ),
                    ],
                  );
                }
                return Container();
              },
            )
          ],
        )
      ],
    );
  }

  Widget selectProvider() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Select Provider',
          style: blackTextStyle.copyWith(
            fontSize: 16,
            fontWeight: semiBold,
          ),
        ),
        const SizedBox(height: 14),
        BlocProvider(
          create: (context) => MobileOperatorBloc()..add(GetMobileOperator()),
          child: BlocBuilder<MobileOperatorBloc, MobileOperatorState>(
            builder: (context, state) {
              if (state is MobileOperatorSuccesss) {
                return Column(
                  children: state.mobileOperators
                      .map(
                        (operator) => GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedOperator = operator;
                            });
                          },
                          child: DataProviderItem(
                            mobileOperator: operator,
                            isSelected: operator.id == selectedOperator?.id,
                          ),
                        ),
                      )
                      .toList(),
                );
              }
              return Center(
                child: CircularProgressIndicator(
                  color: blueColor,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
