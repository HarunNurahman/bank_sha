import 'package:bank_sha/shared/styles.dart';
import 'package:flutter/material.dart';

class ServiceItem extends StatelessWidget {
  final String iconUrl;
  final String title;
  final VoidCallback? onTap;
  const ServiceItem({
    super.key,
    required this.iconUrl,
    required this.title,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
            margin: const EdgeInsets.only(bottom: 8),
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              color: whiteColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Center(
              child: Image.asset(iconUrl, width: 26),
            ),
          ),
        ),
        Text(
          title,
          style: blackTextStyle.copyWith(fontWeight: medium),
        )
      ],
    );
  }
}
