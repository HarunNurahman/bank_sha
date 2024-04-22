import 'dart:convert';
import 'dart:io';

import 'package:bank_sha/models/sign-up_model.dart';
import 'package:bank_sha/pages/sign-up-verify_page.dart';
import 'package:bank_sha/pages/widgets/custom-button.dart';
import 'package:bank_sha/pages/widgets/custom-textfield.dart';
import 'package:bank_sha/shared/shared_method.dart';
import 'package:bank_sha/shared/styles.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class SignUpProfilePage extends StatefulWidget {
  final SignUpModel data;
  const SignUpProfilePage({super.key, required this.data});

  @override
  State<SignUpProfilePage> createState() => _SignUpProfilePageState();
}

class _SignUpProfilePageState extends State<SignUpProfilePage> {
  TextEditingController pinController = TextEditingController();
  XFile? selectImage;

  bool validate() {
    if (pinController.text.isEmpty || pinController.text.length < 6) {
      return false;
    }

    return true;
  }

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
            'Join Us to Unlock\nYour Growth',
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
                  'Harun Nurahman',
                  style: blackTextStyle.copyWith(
                    fontSize: 18,
                    fontWeight: medium,
                  ),
                ),
                const SizedBox(height: 30),
                // PIN input
                CustomTextField(
                  text: 'Set PIN (6 Digits Number)',
                  controller: pinController,
                  obscureText: true,
                  keyboardType: TextInputType.number,
                  maxLength: 6,
                ),
                const SizedBox(height: 30),
                // Continue button
                CustomButton(
                  text: 'Continue',
                  ontap: () {
                    if (validate()) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SignUpVerifyPage(
                            data: widget.data.copyWith(
                              pin: pinController.text,
                              profilePicture: selectImage == null
                                  ? null
                                  : 'data:image/png;base64,${base64Encode(
                                      File(selectImage!.path).readAsBytesSync(),
                                    )}',
                            ),
                          ),
                        ),
                      );
                    } else {
                      showCustomSnackBar(context, 'PIN Harus 6 Digit');
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
