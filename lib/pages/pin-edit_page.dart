import 'package:bank_sha/bloc/auth/auth_bloc.dart';
import 'package:bank_sha/pages/widgets/custom-button.dart';
import 'package:bank_sha/pages/widgets/custom-textfield.dart';
import 'package:bank_sha/shared/shared_method.dart';
import 'package:bank_sha/shared/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditPinPage extends StatefulWidget {
  const EditPinPage({super.key});

  @override
  State<EditPinPage> createState() => _EditPinPageState();
}

class _EditPinPageState extends State<EditPinPage> {
  TextEditingController oldPinController = TextEditingController();
  TextEditingController newPinController = TextEditingController();

  bool validate() {
    if (oldPinController.text.isEmpty || newPinController.text.isEmpty) {
      return false;
    }

    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit PIN'),
      ),
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthFailed) {
            showCustomSnackBar(context, state.errorMessage);
          }

          if (state is AuthSuccess) {
            Navigator.pushNamedAndRemoveUntil(
              context,
              '/edit-profile-success',
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
                    CustomTextField(
                      text: 'Old PIN',
                      controller: oldPinController,
                      obscureText: true,
                      maxLength: 6,
                      keyboardType: TextInputType.number,
                    ),
                    const SizedBox(height: 16),
                    // New PIN
                    CustomTextField(
                      text: 'New PIN',
                      controller: newPinController,
                      obscureText: true,
                      maxLength: 6,
                      keyboardType: TextInputType.number,
                    ),
                    const SizedBox(height: 30),
                    // Update button
                    CustomButton(
                      text: 'Update PIN',
                      ontap: () {
                        if (validate()) {
                          context.read<AuthBloc>().add(
                                AuthUpdatePin(
                                  oldPinController.text,
                                  newPinController.text,
                                ),
                              );
                        }
                      },
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
