import 'package:bank_sha/models/mobile-operator_model.dart';
import 'package:bank_sha/shared/styles.dart';
import 'package:flutter/material.dart';

class DataProviderItem extends StatelessWidget {
  final MobileOperatorModel mobileOperator;
  final bool isSelected;

  const DataProviderItem({
    super.key,
    required this.mobileOperator,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 18),
      padding: const EdgeInsets.all(22),
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.network(mobileOperator.thumbnail.toString(), height: 30),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                mobileOperator.name.toString(),
                style: blackTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: medium,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                mobileOperator.status.toString(),
                style: grayTextStyle.copyWith(fontSize: 12),
              ),
            ],
          )
        ],
      ),
    );
  }
}
