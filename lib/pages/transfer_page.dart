import 'package:bank_sha/pages/widgets/custom-textfield.dart';
import 'package:bank_sha/pages/widgets/transfer-recent-user_item.dart';
import 'package:bank_sha/shared/styles.dart';
import 'package:flutter/material.dart';

class TransferPage extends StatelessWidget {
  const TransferPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transfer'),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        children: [
          // Search bar
          searchBar(),
          // Recent user
          recentUser(),
        ],
      ),
    );
  }

  Widget searchBar() {
    return Container(
      margin: const EdgeInsets.only(top: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Search',
            style: blackTextStyle.copyWith(
              fontSize: 16,
              fontWeight: semiBold,
            ),
          ),
          const SizedBox(height: 14),
          const CustomTextField(text: 'by username', isShowTitle: false),
        ],
      ),
    );
  }

  Widget recentUser() {
    return Container(
      margin: const EdgeInsets.only(top: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Recent User(s)',
            style: blackTextStyle.copyWith(
              fontSize: 16,
              fontWeight: semiBold,
            ),
          ),
          const SizedBox(height: 14),
          TransferRecentUserItem(
            imgUrl: 'assets/images/img_friend-1.png',
            name: 'Yonna Jie',
            username: 'yoenna',
            isVerified: true,
            onTap: () {},
          ),
          TransferRecentUserItem(
            imgUrl: 'assets/images/img_friend-2.png',
            name: 'Jane Hi',
            username: 'jhiane',
            onTap: () {},
          ),
          TransferRecentUserItem(
            imgUrl: 'assets/images/img_friend-3.png',
            name: 'Masayoshi',
            username: 'shogunmasayoshi',
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
