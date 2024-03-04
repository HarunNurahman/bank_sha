import 'package:bank_sha/pages/widgets/custom-button.dart';
import 'package:bank_sha/pages/widgets/custom-textfield.dart';
import 'package:bank_sha/shared/styles.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightBackgroundColor,
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
            'Join Us to Unlock\nYour Growth',
            style: blackTextStyle.copyWith(
              fontSize: 20,
              fontWeight: semiBold,
            ),
          ),
          const SizedBox(height: 30),
          // Text form field
          Container(
            padding: const EdgeInsets.all(22),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: whiteColor,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomTextField(text: 'Full Name'),
                // Email input
                const CustomTextField(
                  text: 'Email Address',
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 16),
                // Password input
                const CustomTextField(
                  text: 'Password',
                  obscureText: true,
                ),
                const SizedBox(height: 30),
                // Continue button
                CustomButton(
                  text: 'Continue',
                  ontap: () => Navigator.pushNamed(context, '/sign-up-profile'),
                ),
              ],
            ),
          ),
          const SizedBox(height: 15),
          // Sign in
          Center(
            child: CustomTextButton(
              text: 'Sign In',
              ontap: () => Navigator.pushNamed(context, '/sign-in'),
            ),
          ),
          const SizedBox(height: 15),
        ],
      ),
    );
  }
}
