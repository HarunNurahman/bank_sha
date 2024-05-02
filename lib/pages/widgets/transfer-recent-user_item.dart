import 'package:bank_sha/models/user_model.dart';
import 'package:bank_sha/shared/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TransferRecentUserItem extends StatelessWidget {
  final UserModel user;
  final VoidCallback? onTap;
  const TransferRecentUserItem({
    super.key,
    required this.user,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 18),
        padding: const EdgeInsets.all(22),
        decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            // Image profile
            Container(
              height: 45,
              width: 45,
              margin: const EdgeInsets.only(right: 14),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: user.profilePicture == null
                      ? const AssetImage('assets/images/img_profile.png')
                      : NetworkImage(user.profilePicture!) as ImageProvider,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            // Name and username
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    user.name.toString(),
                    style: blackTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: medium,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 2),
                  Text(
                    '@${user.username}',
                    style: grayTextStyle.copyWith(fontSize: 12),
                  )
                ],
              ),
            ),
            // Verified Status
            if (user.verified == 1)
              Row(
                children: [
                  Icon(
                    Icons.check_circle,
                    size: 14,
                    color: greenColor,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    'Verified',
                    style: greenTextStyle.copyWith(
                      fontSize: 11,
                      fontWeight: medium,
                    ),
                  ),
                ],
              )
          ],
        ),
      ),
    );
  }
}
