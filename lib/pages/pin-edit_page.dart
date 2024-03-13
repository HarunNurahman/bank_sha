import 'package:bank_sha/pages/widgets/custom-button.dart';
import 'package:bank_sha/pages/widgets/custom-textfield.dart';
import 'package:bank_sha/shared/styles.dart';
import 'package:flutter/material.dart';

class EditPinPage extends StatelessWidget {
  const EditPinPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit PIN'),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        children: [
          // Text form field
          Container(
            margin: const EdgeInsets.only(top: 30),
            padding: const EdgeInsets.all(22),
            decoration: BoxDecoration(
              color: whiteColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Old PIN
                const CustomTextField(
                  text: 'Old PIN',
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 16),
                // New PIN
                const CustomTextField(
                  text: 'New PIN',
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 30),
                // Update button
                CustomButton(
                  text: 'Update PIN',
                  ontap: () => Navigator.pushNamedAndRemoveUntil(
                    context,
                    '/edit-profile-success',
                    (route) => false,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
