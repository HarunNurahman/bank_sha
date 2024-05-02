import 'package:bank_sha/models/user_model.dart';
import 'package:bank_sha/shared/styles.dart';
import 'package:flutter/material.dart';

class TransferSearchResultItem extends StatelessWidget {
  final UserModel user;
  final bool isSelected;
  const TransferSearchResultItem({
    super.key,
    required this.user,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 175,
      width: 155,
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
        children: [
          // Profile image
          Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: user.profilePicture == null
                    ? const AssetImage('assets/images/img_profile.png')
                    : NetworkImage(user.profilePicture!) as ImageProvider,
                fit: BoxFit.cover,
              ),
            ),
            // Verified status
            child: user.verified == 1
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
            user.name.toString(),
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
            '@${user.username}}',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: grayTextStyle.copyWith(fontSize: 12),
          ),
        ],
      ),
    );
  }
}
