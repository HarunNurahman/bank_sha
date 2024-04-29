import 'package:bank_sha/bloc/auth/auth_bloc.dart';
import 'package:bank_sha/bloc/topup/topup_bloc.dart';
import 'package:bank_sha/models/topup_model.dart';
import 'package:bank_sha/pages/widgets/custom-button.dart';
import 'package:bank_sha/shared/shared_method.dart';
import 'package:bank_sha/shared/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

class TopupAmountPage extends StatefulWidget {
  final TopUpModel data;
  const TopupAmountPage({super.key, required this.data});

  @override
  State<TopupAmountPage> createState() => _TopupAmountPageState();
}

class _TopupAmountPageState extends State<TopupAmountPage> {
  final TextEditingController amountController =
      TextEditingController(text: '0');

  // Add number to pin
  addAmount(String number) {
    if (amountController.text == '0') {
      amountController.text = '';
    }
    setState(() {
      amountController.text = amountController.text + number;
    });
  }

  // Delete number from pin
  deleteAmount() {
    if (amountController.text.isNotEmpty) {
      setState(() {
        amountController.text = amountController.text.substring(
          0,
          amountController.text.length - 1,
        );

        if (amountController.text == '') {
          amountController.text = '0';
        }
      });
    }
  }

  @override
  void initState() {
    amountController.addListener(() {
      final text = amountController.text;

      amountController.value = amountController.value.copyWith(
        text: NumberFormat.currency(
          locale: 'id',
          decimalDigits: 0,
          symbol: '',
        ).format(
          int.parse(
            text == '' ? '0' : text.replaceAll('.', ''),
          ),
        ),
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkBackgroundColor,
      body: BlocProvider(
        create: (context) => TopupBloc(),
        child: BlocConsumer<TopupBloc, TopupState>(
          listener: (context, state) async {
            if (state is TopupFailed) {
              showCustomSnackBar(context, state.errorMessage);
            }

            if (state is TopupSuccess) {
              await launchUrl(Uri.parse(state.redirectUrl));

              context.read<AuthBloc>().add(
                    AuthUpdateBalance(
                      int.parse(
                        amountController.text.replaceAll('.', ''),
                      ),
                    ),
                  );

              Navigator.pushNamedAndRemoveUntil(
                context,
                '/topup-success',
                (route) => false,
              );
            }
          },
          builder: (context, state) {
            return ListView(
              padding: const EdgeInsets.symmetric(horizontal: 58),
              children: [
                Column(
                  children: [
                    const SizedBox(height: 36),
                    Text(
                      'Enter Amount',
                      style: whiteTextStyle.copyWith(
                        fontSize: 20,
                        fontWeight: semiBold,
                      ),
                    ),
                    const SizedBox(height: 50),
                    // Amount input form
                    Align(
                      child: SizedBox(
                        width: 260,
                        child: TextFormField(
                          controller: amountController,
                          readOnly: true,
                          cursorColor: grayColor,
                          keyboardType: TextInputType.number,
                          style: whiteTextStyle.copyWith(
                            fontSize: 36,
                            fontWeight: medium,
                          ),
                          decoration: InputDecoration(
                            prefixIcon: Text(
                              'Rp ',
                              style: whiteTextStyle.copyWith(
                                fontSize: 36,
                                fontWeight: medium,
                              ),
                            ),
                            counterText: '',
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: grayColor),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: grayColor),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 70),
                    Wrap(
                      spacing: 40,
                      runSpacing: 40,
                      children: [
                        CustomPinButton(
                            number: '1', onTap: () => addAmount('1')),
                        CustomPinButton(
                            number: '2', onTap: () => addAmount('2')),
                        CustomPinButton(
                            number: '3', onTap: () => addAmount('3')),
                        CustomPinButton(
                            number: '4', onTap: () => addAmount('4')),
                        CustomPinButton(
                            number: '5', onTap: () => addAmount('5')),
                        CustomPinButton(
                            number: '6', onTap: () => addAmount('6')),
                        CustomPinButton(
                            number: '7', onTap: () => addAmount('7')),
                        CustomPinButton(
                            number: '8', onTap: () => addAmount('8')),
                        CustomPinButton(
                            number: '9', onTap: () => addAmount('9')),
                        // Empty for space
                        const SizedBox(height: 60, width: 60),
                        CustomPinButton(
                            number: '0', onTap: () => addAmount('0')),
                        // Delete button
                        GestureDetector(
                          onTap: () => deleteAmount(),
                          child: Container(
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: navyColor,
                            ),
                            child: Center(
                              child: Icon(
                                Icons.arrow_back_rounded,
                                color: whiteColor,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 50),
                    // Checkout button
                    CustomButton(
                      text: 'Checkout Now',
                      ontap: () async {
                        if (await Navigator.pushNamed(context, '/pin') ==
                            true) {
                          final authState = context.read<AuthBloc>().state;
                          String pin = '';
                          if (authState is AuthSuccess) {
                            pin = authState.user.pin!;
                          }
                          context.read<TopupBloc>().add(
                                TopupPost(
                                  widget.data.copyWith(
                                    pin: pin,
                                    amount: amountController.text
                                        .replaceAll('.', ''),
                                  ),
                                ),
                              );
                        }
                      },
                    ),
                    const SizedBox(height: 40)
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
