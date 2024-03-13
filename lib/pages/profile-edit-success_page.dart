import 'package:bank_sha/pages/widgets/custom-button.dart';
import 'package:bank_sha/shared/styles.dart';
import 'package:flutter/material.dart';

class ProfileEditSuccessPage extends StatelessWidget {
  const ProfileEditSuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Nice Update!',
              textAlign: TextAlign.center,
              style: blackTextStyle.copyWith(
                fontSize: 20,
                fontWeight: semiBold,
              ),
            ),
            const SizedBox(height: 26),
            Text(
              'Your data is safe with\nour system',
              textAlign: TextAlign.center,
              style: grayTextStyle.copyWith(
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 50),
            CustomButton(
              text: 'My Profile',
              ontap: () => Navigator.pushNamedAndRemoveUntil(
                context,
                '/profile',
                (route) => true,
              ),
              width: 180,
            ),
          ],
        ),
      ),
    );
  }
}
