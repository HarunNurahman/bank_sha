import 'package:bank_sha/shared/styles.dart';
import 'package:flutter/material.dart';

class DataProviderItem extends StatelessWidget {
  final String imgUrl;
  final String name;
  final bool isSelected;

  const DataProviderItem({
    super.key,
    required this.imgUrl,
    required this.name,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: isSelected ? cyanColor : whiteColor,
          width: 2,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(imgUrl, height: 30),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                name,
                style: blackTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: medium,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                'Available',
                style: grayTextStyle.copyWith(fontSize: 12),
              ),
            ],
          )
        ],
      ),
    );
  }
}
