import 'package:bank_sha/pages/widgets/custom-button.dart';
import 'package:bank_sha/pages/widgets/custom-textfield.dart';
import 'package:bank_sha/shared/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

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
            margin: const EdgeInsets.only(top: 100, bottom: 100),
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/app_logo_dark.png'),
              ),
            ),
          ),
          // Title
          Text(
            'Sign In &\nGrow Your Finance',
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
                const SizedBox(height: 8),
                // Forgot password
                Align(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    onTap: () {},
                    child: Text(
                      'Forgot Password',
                      style: blueTextStyle.copyWith(color: cyanColor),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                // Sign in button
                CustomButton(
                  text: 'Sign In',
                  ontap: () {},
                ),
              ],
            ),
          ),
          const SizedBox(height: 30),
          // Sign up
          Center(
            child: CustomTextButton(
              text: 'Create New Account',
              ontap: () {},
            ),
          )
        ],
      ),
    );
  }
}
