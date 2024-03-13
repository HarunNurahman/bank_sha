import 'package:bank_sha/pages/widgets/bank_item.dart';
import 'package:bank_sha/pages/widgets/custom-button.dart';
import 'package:bank_sha/shared/styles.dart';
import 'package:flutter/material.dart';

class TopupPage extends StatelessWidget {
  const TopupPage({super.key});

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
          Row(
            children: [
              Image.asset('assets/images/img_wallet.png', width: 80),
              const SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Card number
                  Text(
                    '8008 2208 1996 0907',
                    style: blackTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: medium,
                    ),
                  ),
                  const SizedBox(height: 2),
                  // Card owner
                  Text(
                    'Harun Nurahman',
                    style: grayTextStyle.copyWith(fontSize: 12),
                  )
                ],
              )
            ],
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
          const BankItem(
            imgUrl: 'assets/images/img_bank_bca.png',
            title: 'Bank BCA',
            isSelected: true,
          ),
          const BankItem(
            imgUrl: 'assets/images/img_bank_bni.png',
            title: 'Bank BNI',
          ),
          const BankItem(
            imgUrl: 'assets/images/img_bank_mandiri.png',
            title: 'Bank Mandiri',
          ),
          const BankItem(
            imgUrl: 'assets/images/img_bank_ocbc.png',
            title: 'Bank OCBC',
          ),
        ],
      ),
      // Continue button
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(24.0),
        child: CustomButton(
          text: 'Continue',
          ontap: () => Navigator.pushNamed(context, '/topup-amount'),
        ),
      ),
    );
  }
}
