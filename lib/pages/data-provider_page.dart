import 'package:bank_sha/pages/widgets/data-provider_item.dart';
import 'package:bank_sha/shared/styles.dart';
import 'package:flutter/material.dart';

class MobileDataPage extends StatelessWidget {
  const MobileDataPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Beli Data'),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        children: [
          const SizedBox(height: 30),
          walletInformation(),
          const SizedBox(height: 40),
          selecProvider(),
        ],
      ),
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
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Card number
                Text(
                  '8008 2208 1996',
                  style: blackTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: medium,
                  ),
                ),
                const SizedBox(height: 2),
                // Card balance
                Text(
                  'Balance: Rp 180.000.000',
                  style: grayTextStyle.copyWith(fontSize: 12),
                ),
              ],
            )
          ],
        )
      ],
    );
  }

  Widget selecProvider() {
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
        const DataProviderItem(
          imgUrl: 'assets/images/img_provider_telkomsel.png',
          name: 'Telkomsel',
          isSelected: true,
        ),
      ],
    );
  }
}
