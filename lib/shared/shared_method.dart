import 'package:another_flushbar/flushbar.dart';
import 'package:bank_sha/shared/styles.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:image_picker/image_picker.dart';

// Custom SnackBar
void showCustomSnackBar(BuildContext context, String message) {
  Flushbar(
    message: message,
    flushbarPosition: FlushbarPosition.TOP,
    backgroundColor: redColor,
    duration: const Duration(seconds: 3),
  ).show(context);
}

// Format Currency Function
String formatCurrency(num number) {
  return NumberFormat.currency(
    locale: 'id',
    symbol: 'Rp ',
    decimalDigits: 0,
  ).format(number);
}

// Image Picker Function
Future<XFile?> imagePicker() async {
  XFile? selectedImage = await ImagePicker().pickImage(
    source: ImageSource.gallery,
  );
  return selectedImage;
}
