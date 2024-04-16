import 'package:bank_sha/shared/styles.dart';
import 'package:flutter/material.dart';

class DataPackageItem extends StatelessWidget {
  final int dataAmount;
  final int price;
  final bool isSelected;
  const DataPackageItem({
    super.key,
    required this.dataAmount,
    required this.price,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: 160,
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(20),
        border: isSelected
            ? Border.all(
                color: cyanColor,
                width: 2,
              )
            : null,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Full name
          Text(
            '${dataAmount}GB',
            style: blackTextStyle.copyWith(
              fontSize: 28,
              fontWeight: medium,
            ),
            maxLines: 1,
          ),
          const SizedBox(height: 2),
          // Username
          Text(
            'Rp $price',
            style: grayTextStyle.copyWith(fontSize: 12),
            maxLines: 1,
          ),
        ],
      ),
    );
  }
}
