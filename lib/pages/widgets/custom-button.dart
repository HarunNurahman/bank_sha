import 'package:bank_sha/shared/styles.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final double width;
  final double height;
  final VoidCallback? ontap;

  const CustomButton({
    super.key,
    required this.text,
    this.width = double.infinity,
    this.height = 50,
    this.ontap,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: ontap,
      style: ElevatedButton.styleFrom(
        backgroundColor: blueColor,
        elevation: 0,
        minimumSize: Size(width, height),
      ),
      child: Text(
        text,
        style: whiteTextStyle.copyWith(
          fontSize: 16,
          fontWeight: semiBold,
        ),
      ),
    );
  }
}

class CustomTextButton extends StatelessWidget {
  final String text;
  final VoidCallback? ontap;
  const CustomTextButton({
    super.key,
    required this.text,
    this.ontap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Text(
        text,
        style: grayTextStyle.copyWith(fontSize: 16),
      ),
    );
  }
}

class CustomPinButton extends StatelessWidget {
  final String number;
  final VoidCallback? onTap;
  const CustomPinButton({super.key, required this.number, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 60,
        width: 60,
        decoration: BoxDecoration(shape: BoxShape.circle, color: navyColor),
        child: Center(
          child: Text(
            number,
            style: whiteTextStyle.copyWith(fontSize: 22, fontWeight: semiBold),
          ),
        ),
      ),
    );
  }
}
