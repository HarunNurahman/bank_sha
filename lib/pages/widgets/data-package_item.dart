import 'package:bank_sha/models/mobile-data-plan_model.dart';
import 'package:bank_sha/shared/shared_method.dart';
import 'package:bank_sha/shared/styles.dart';
import 'package:flutter/material.dart';

class DataPackageItem extends StatelessWidget {
  final MobileDataPlanModel dataPlan;
  final bool isSelected;
  const DataPackageItem({
    super.key,
    required this.dataPlan,
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
            dataPlan.name.toString(),
            style: blackTextStyle.copyWith(
              fontSize: 28,
              fontWeight: medium,
            ),
            maxLines: 1,
          ),
          const SizedBox(height: 2),
          // Username
          Text(
            formatCurrency(dataPlan.price ?? 0),
            style: grayTextStyle.copyWith(fontSize: 12),
            maxLines: 1,
          ),
        ],
      ),
    );
  }
}
