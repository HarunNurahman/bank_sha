import 'package:bank_sha/bloc/auth/auth_bloc.dart';
import 'package:bank_sha/models/sign-in_model.dart';
import 'package:bank_sha/pages/widgets/custom-button.dart';
import 'package:bank_sha/pages/widgets/custom-textfield.dart';
import 'package:bank_sha/shared/shared_method.dart';
import 'package:bank_sha/shared/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool validate() {
    if (emailController.text.isEmpty || passwordController.text.isEmpty) {
      return false;
    }

    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthFailed) {
            showCustomSnackBar(context, state.errorMessage);
          }

          if (state is AuthSuccess) {
            Navigator.pushNamedAndRemoveUntil(
              context,
              '/home',
              (route) => false,
            );
          }
        },
        builder: (context, state) {
          if (state is AuthLoading) {
            return Center(
              child: CircularProgressIndicator(
                color: blueColor,
              ),
            );
          }
          return ListView(
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
                    CustomTextField(
                      text: 'Email Address',
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                    ),
                    const SizedBox(height: 16),
                    // Password input
                    CustomTextField(
                      text: 'Password',
                      controller: passwordController,
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
                      ontap: () {
                        if (validate()) {
                          context.read<AuthBloc>().add(
                                AuthSignIn(
                                  SignInModel(
                                    email: emailController.text,
                                    password: passwordController.text,
                                  ),
                                ),
                              );
                        } else {
                          showCustomSnackBar(
                            context,
                            'Semua Field Harus Diisi!',
                          );
                        }
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              // Sign up
              Center(
                child: CustomTextButton(
                  text: 'Create New Account',
                  ontap: () => Navigator.pushNamed(context, '/sign-up'),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
