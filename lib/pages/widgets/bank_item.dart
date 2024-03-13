import 'package:bank_sha/shared/styles.dart';
import 'package:flutter/material.dart';

class BankItem extends StatelessWidget {
  final String imgUrl;
  final String title;
  final VoidCallback? onTap;
  final bool isSelected;
  const BankItem({
    super.key,
    required this.imgUrl,
    required this.title,
    this.onTap,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        margin: const EdgeInsets.only(bottom: 18),
        padding: const EdgeInsets.all(22),
        decoration: BoxDecoration(
          color: whiteColor,
          border: Border.all(
            width: 2,
            color: isSelected ? blueColor : whiteColor,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(imgUrl, height: 30),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  title,
                  style: blackTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: medium,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  '1-3 min(s)',
                  style: grayTextStyle.copyWith(fontSize: 12),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
