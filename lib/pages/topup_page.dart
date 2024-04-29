import 'package:bank_sha/bloc/auth/auth_bloc.dart';
import 'package:bank_sha/bloc/payment_method/payment_method_bloc.dart';
import 'package:bank_sha/models/payment-method_model.dart';
import 'package:bank_sha/models/topup_model.dart';
import 'package:bank_sha/pages/topup-amount_page.dart';
import 'package:bank_sha/pages/widgets/bank_item.dart';
import 'package:bank_sha/pages/widgets/custom-button.dart';
import 'package:bank_sha/shared/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TopupPage extends StatefulWidget {
  const TopupPage({super.key});

  @override
  State<TopupPage> createState() => _TopupPageState();
}

class _TopupPageState extends State<TopupPage> {
  PaymentMethodModel? selectedPaymentMethod;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Topup'),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        children: [
          const SizedBox(height: 30),
          // Header wallet
          Text(
            'Wallet',
            style: blackTextStyle.copyWith(
              fontSize: 16,
              fontWeight: semiBold,
            ),
          ),
          const SizedBox(height: 10),
          BlocBuilder<AuthBloc, AuthState>(
            builder: (context, state) {
              if (state is AuthSuccess) {
                return Row(
                  children: [
                    Image.asset('assets/images/img_wallet.png', width: 80),
                    const SizedBox(width: 16),
                    Column(
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
                        // Card owner
                        Text(
                          state.user.name!.toString(),
                          style: grayTextStyle.copyWith(fontSize: 12),
                        )
                      ],
                    )
                  ],
                );
              }
              return Container();
            },
          ),
          const SizedBox(height: 40),
          Text(
            'Select Bank',
            style: blackTextStyle.copyWith(
              fontSize: 16,
              fontWeight: semiBold,
            ),
          ),
          const SizedBox(height: 14),
          BlocProvider(
            create: (context) => PaymentMethodBloc()..add(PaymentMethodGet()),
            child: BlocBuilder<PaymentMethodBloc, PaymentMethodState>(
              builder: (context, state) {
                if (state is PaymentMethodSuccess) {
                  return Column(
                    children: state.paymentMethod.map((paymentMethod) {
                      return BankItem(
                        paymentMethod: paymentMethod,
                        isSelected:
                            paymentMethod.id == selectedPaymentMethod?.id,
                        onTap: () {
                          setState(() {
                            selectedPaymentMethod = paymentMethod;
                          });
                        },
                      );
                    }).toList(),
                  );
                }

                return Center(
                  child: CircularProgressIndicator(
                    color: blueColor,
                  ),
                );
              },
            ),
          )
        ],
      ),
      // Continue button
      bottomNavigationBar: selectedPaymentMethod != null
          ? Padding(
              padding: const EdgeInsets.all(24.0),
              child: CustomButton(
                text: 'Continue',
                ontap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TopupAmountPage(
                      data: TopUpModel(
                        paymentMethodCode: selectedPaymentMethod!.code,
                      ),
                    ),
                  ),
                ),
              ),
            )
          : null,
    );
  }
}
