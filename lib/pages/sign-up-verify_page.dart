import 'dart:convert';
import 'dart:io';

import 'package:bank_sha/bloc/auth/auth_bloc.dart';
import 'package:bank_sha/models/sign-up_model.dart';
import 'package:bank_sha/pages/widgets/custom-button.dart';
import 'package:bank_sha/shared/shared_method.dart';
import 'package:bank_sha/shared/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class SignUpVerifyPage extends StatefulWidget {
  final SignUpModel data;
  const SignUpVerifyPage({super.key, required this.data});

  @override
  State<SignUpVerifyPage> createState() => _SignUpVerifyPageState();
}

class _SignUpVerifyPageState extends State<SignUpVerifyPage> {
  XFile? selectImage;

  bool validate() {
    if (selectImage == null) {
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
                      onTap: () async {
                        final image = await imagePicker();
                        setState(() {
                          selectImage = image;
                        });
                      },
                      child: Container(
                        height: 120,
                        width: 120,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: lightGrayColor,
                          image: selectImage == null
                              ? null
                              : DecorationImage(
                                  image: FileImage(File(selectImage!.path)),
                                  fit: BoxFit.cover,
                                ),
                        ),
                        child: selectImage != null
                            ? null
                            : Center(
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
                      ontap: () async {
                        if (validate()) {
                          context.read<AuthBloc>().add(
                                AuthSignUp(
                                  widget.data.copyWith(
                                    ktp: selectImage == null
                                        ? null
                                        : 'data:image/png;base64,${base64Encode(
                                            File(selectImage!.path)
                                                .readAsBytesSync(),
                                          )}',
                                  ),
                                ),
                              );
                        } else {
                          showCustomSnackBar(
                            context,
                            'Silahkan Upload KTP Anda',
                          );
                        }
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              Center(
                child: CustomTextButton(
                    text: 'Skip For Now',
                    ontap: () {
                      context.read<AuthBloc>().add(AuthSignUp(widget.data));
                    }),
              )
            ],
          );
        },
      ),
    );
  }
}
