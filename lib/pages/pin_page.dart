import 'package:bank_sha/bloc/auth/auth_bloc.dart';
import 'package:bank_sha/pages/widgets/custom-button.dart';
import 'package:bank_sha/shared/shared_method.dart';
import 'package:bank_sha/shared/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PinPage extends StatefulWidget {
  const PinPage({super.key});

  @override
  State<PinPage> createState() => _PinPageState();
}

class _PinPageState extends State<PinPage> {
  final TextEditingController pinController = TextEditingController();
  String pin = '';
  bool isError = false;

  // Add number to pin
  addPin(String number) {
    if (pinController.text.length < 6) {
      setState(() {
        pinController.text = pinController.text + number;
      });
    }

    if (pinController.text.length == 6) {
      if (pinController.text == pin) {
        Navigator.pop(context, true);
      } else {
        setState(() {
          isError = true;
        });
        showCustomSnackBar(
          context,
          'PIN yang anda masukan salah. Silahkan coba lagi!',
        );
      }
    }
  }

  // Delete number from pin
  deletePin() {
    if (pinController.text.isNotEmpty) {
      setState(() {
        isError = false;
        pinController.text = pinController.text.substring(
          0,
          pinController.text.length - 1,
        );
      });
    }
  }

  @override
  void initState() {
    final authState = context.read<AuthBloc>().state;

    if (authState is AuthSuccess) {
      pin = authState.user.pin!;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkBackgroundColor,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 58),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Enter Your PIN',
                style: whiteTextStyle.copyWith(
                  fontSize: 20,
                  fontWeight: semiBold,
                ),
              ),
              const SizedBox(height: 72),
              // Pin input form
              SizedBox(
                width: 220,
                child: TextFormField(
                  controller: pinController,
                  readOnly: true,
                  obscureText: true,
                  obscuringCharacter: '*',
                  cursorColor: grayColor,
                  keyboardType: TextInputType.number,
                  maxLength: 6,
                  style: whiteTextStyle.copyWith(
                    fontSize: 36,
                    fontWeight: medium,
                    letterSpacing: 16,
                    color: isError ? redColor : whiteColor,
                  ),
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    counterText: '',
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: grayColor),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: grayColor),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 70),
              Wrap(
                spacing: 40,
                runSpacing: 40,
                children: [
                  CustomPinButton(
                    number: '1',
                    onTap: () => addPin('1'),
                  ),
                  CustomPinButton(
                    number: '2',
                    onTap: () => addPin('2'),
                  ),
                  CustomPinButton(
                    number: '3',
                    onTap: () => addPin('3'),
                  ),
                  CustomPinButton(
                    number: '4',
                    onTap: () => addPin('4'),
                  ),
                  CustomPinButton(
                    number: '5',
                    onTap: () => addPin('5'),
                  ),
                  CustomPinButton(
                    number: '6',
                    onTap: () => addPin('6'),
                  ),
                  CustomPinButton(
                    number: '7',
                    onTap: () => addPin('7'),
                  ),
                  CustomPinButton(
                    number: '8',
                    onTap: () => addPin('8'),
                  ),
                  CustomPinButton(
                    number: '9',
                    onTap: () => addPin('9'),
                  ),
                  // Empty for space
                  const SizedBox(height: 60, width: 60),
                  CustomPinButton(
                    number: '0',
                    onTap: () => addPin('0'),
                  ),
                  // Delete button
                  GestureDetector(
                    onTap: () => deletePin(),
                    child: Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: navyColor,
                      ),
                      child: Center(
                        child: Icon(
                          Icons.arrow_back_rounded,
                          color: whiteColor,
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
