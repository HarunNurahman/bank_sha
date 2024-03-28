import 'package:bank_sha/shared/styles.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String text;
  final TextInputType keyboardType;
  final TextEditingController? controller;
  final bool obscureText;
  final int maxLength;
  final bool isShowTitle;

  const CustomTextField({
    super.key,
    required this.text,
    this.keyboardType = TextInputType.text,
    this.controller,
    this.obscureText = false,
    this.maxLength = 256,
    this.isShowTitle = true,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (isShowTitle)
          Text(
            text,
            style: blackTextStyle.copyWith(fontWeight: medium),
          ),
        if (isShowTitle) const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          keyboardType: keyboardType,
          obscureText: obscureText,
          maxLength: maxLength,
          style: blackTextStyle.copyWith(
            fontSize: 14,
            fontWeight: medium,
          ),
          decoration: InputDecoration(
            hintText: !isShowTitle ? text : null, 
            counterText: '',
            contentPadding: const EdgeInsets.all(12),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: BorderSide(
                color: grayColor,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: BorderSide(
                color: blueColor,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: BorderSide(
                color: redColor,
              ),
            ),
          ),
        )
      ],
    );
  }
}
