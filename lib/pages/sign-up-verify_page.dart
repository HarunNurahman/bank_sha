import 'package:bank_sha/pages/widgets/custom-button.dart';
import 'package:bank_sha/shared/styles.dart';
import 'package:flutter/material.dart';

class SignUpVerifyPage extends StatelessWidget {
  const SignUpVerifyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        children: [
          // App logo
          Container(
            width: 155,
            height: 50,
            margin: const EdgeInsets.only(top: 100, bottom: 80),
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/app_logo_dark.png'),
              ),
            ),
          ),
          // Title
          Text(
            'Verify Your\nAccount',
            style: blackTextStyle.copyWith(
              fontSize: 20,
              fontWeight: semiBold,
            ),
          ),
          const SizedBox(height: 30),
          // Content box
          Container(
            padding: const EdgeInsets.all(22),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: whiteColor,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Upload button
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    height: 120,
                    width: 120,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: lightGrayColor,
                    ),
                    child: Center(
                      child: Image.asset(
                        'assets/icons/ic_upload.png',
                        width: 32,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                // Full name
                Text(
                  'ID Card or Passport',
                  style: blackTextStyle.copyWith(
                    fontSize: 18,
                    fontWeight: medium,
                  ),
                ),
                const SizedBox(height: 50),
                // Continue button
                CustomButton(
                  text: 'Continue',
                  ontap: () => Navigator.pushNamed(context, '/sign-up-success'),
                ),
              ],
            ),
          ),
          const SizedBox(height: 30),
          Center(
            child: CustomTextButton(
              text: 'Skip For Now',
              ontap: () => Navigator.pushNamed(context, '/sign-up-success'),
            ),
          )
        ],
      ),
    );
  }
}
