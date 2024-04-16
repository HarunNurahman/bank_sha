import 'package:bank_sha/pages/widgets/custom-button.dart';
import 'package:bank_sha/pages/widgets/custom-textfield.dart';
import 'package:bank_sha/pages/widgets/data-package_item.dart';
import 'package:bank_sha/shared/styles.dart';
import 'package:flutter/material.dart';

class MobileDataPackagePage extends StatelessWidget {
  const MobileDataPackagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Paket Data'),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        children: [
          const SizedBox(height: 30),
          phoneNumberInput(),
          const SizedBox(height: 40),
          selectPackage(),
        ],
      ),
      // Continue button
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(24.0),
        child: CustomButton(
          text: 'Continue',
          ontap: () async {
            if (await Navigator.pushNamed(context, '/pin') == true) {
              Navigator.pushNamedAndRemoveUntil(
                context,
                '/mobile-data-success',
                (route) => false,
              );
            }
          },
        ),
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
        const CustomTextField(
          text: '+62',
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
        Wrap(
          spacing: 15,
          runSpacing: 15,
          children: [
            DataPackageItem(dataAmount: 10, price: 218000, isSelected: true),
            DataPackageItem(dataAmount: 25, price: 420000),
            DataPackageItem(dataAmount: 50, price: 2500000),
            DataPackageItem(dataAmount: 90, price: 5000000),
          ],
        )
      ],
    );
  }
}
