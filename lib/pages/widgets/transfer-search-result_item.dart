import 'package:bank_sha/shared/styles.dart';
import 'package:flutter/material.dart';

class TransferSearchResultItem extends StatelessWidget {
  final String imgUrl;
  final String name;
  final String username;
  final bool isVerified;
  final bool isSelected;
  const TransferSearchResultItem({
    super.key,
    required this.imgUrl,
    required this.name,
    required this.username,
    this.isVerified = false,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: isSelected ? blueColor : whiteColor,
          width: 2,
        ),
      ),
      child: Column(
        children: [
          // Profile image
          Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage(imgUrl),
                fit: BoxFit.cover,
              ),
            ),
            // Verified status
            child: isVerified
                ? Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      width: 18,
                      height: 18,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: whiteColor,
                      ),
                      child: Center(
                        child: Icon(
                          Icons.check_circle,
                          color: greenColor,
                          size: 16,
                        ),
                      ),
                    ),
                  )
                : null,
          ),
          const SizedBox(height: 13),
          // Full name
          Text(
            name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: blackTextStyle.copyWith(
              fontSize: 16,
              fontWeight: medium,
            ),
          ),
          const SizedBox(height: 2),
          // Username
          Text(
            '@$username',
            style: grayTextStyle.copyWith(fontSize: 12),
          ),
        ],
      ),
    );
  }
}
