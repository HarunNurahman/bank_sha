import 'package:bank_sha/pages/widgets/custom-button.dart';
import 'package:bank_sha/shared/styles.dart';
import 'package:flutter/material.dart';

class SignUpSuccessPage extends StatelessWidget {
  const SignUpSuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Akun Berhasil\nTerdaftar',
              textAlign: TextAlign.center,
              style: blackTextStyle.copyWith(
                fontSize: 20,
                fontWeight: semiBold,
              ),
            ),
            const SizedBox(height: 26),
            Text(
              'Grow your finance start\ntogether with us',
              textAlign: TextAlign.center,
              style: grayTextStyle.copyWith(
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 50),
            CustomButton(
              text: 'Get Started',
              ontap: () => Navigator.pushNamedAndRemoveUntil(
                context,
                '/home',
                (route) => false,
              ),
              width: 180,
            ),
          ],
        ),
      ),
    );
  }
}
