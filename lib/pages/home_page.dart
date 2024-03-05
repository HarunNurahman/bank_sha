import 'package:bank_sha/pages/widgets/service_item.dart';
import 'package:bank_sha/shared/styles.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightBackgroundColor,
      // Bottom navigation bar
      bottomNavigationBar: BottomAppBar(
        color: whiteColor,
        shape: const CircularNotchedRectangle(),
        clipBehavior: Clip.antiAlias,
        notchMargin: 6,
        elevation: 0,
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          elevation: 0,
          backgroundColor: whiteColor,
          selectedItemColor: cyanColor,
          unselectedItemColor: blackColor,
          showUnselectedLabels: true,
          showSelectedLabels: true,
          selectedLabelStyle: blueTextStyle.copyWith(
              fontSize: 10, fontWeight: medium, color: cyanColor),
          unselectedLabelStyle:
              blackTextStyle.copyWith(fontSize: 10, fontWeight: medium),
          items: [
            BottomNavigationBarItem(
              label: 'Overview',
              icon: Image.asset(
                'assets/icons/ic_overview.png',
                width: 20,
                color: cyanColor,
              ),
            ),
            BottomNavigationBarItem(
              label: 'History',
              icon: Image.asset(
                'assets/icons/ic_history.png',
                width: 20,
              ),
            ),
            BottomNavigationBarItem(
              label: 'Statistic',
              icon: Image.asset(
                'assets/icons/ic_statistic.png',
                width: 20,
              ),
            ),
            BottomNavigationBarItem(
              label: 'Reward',
              icon: Image.asset(
                'assets/icons/ic_reward.png',
                width: 20,
              ),
            ),
          ],
        ),
      ),
      // Add transaction button
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: blueColor,
        shape: const CircleBorder(),
        child: Image.asset(
          'assets/icons/ic_add-transaction.png',
          width: 24,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        children: [
          profileHeader(),
          walletCard(),
          progressBar(),
          services(),
          latestTransaction(),
        ],
      ),
    );
  }

  Widget profileHeader() {
    return Container(
      margin: const EdgeInsets.only(top: 40),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Username
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: 'Howdy, \n',
                  style: grayTextStyle.copyWith(
                    fontSize: 16,
                    color: darkGrayColor,
                  ),
                ),
                TextSpan(
                  text: 'Harunamanya',
                  style: blackTextStyle.copyWith(
                    fontSize: 20,
                    fontWeight: semiBold,
                  ),
                ),
              ],
            ),
          ),
          // Profile picture
          Container(
            width: 60,
            height: 60,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage('assets/images/img_friend-4.png'),
                fit: BoxFit.cover,
              ),
            ),
            // Verified status
            child: Align(
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
            ),
          )
        ],
      ),
    );
  }

  Widget walletCard() {
    // Card background
    return Container(
      width: double.infinity,
      height: 220,
      margin: const EdgeInsets.only(top: 30),
      padding: const EdgeInsets.all(30),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(28),
        image: const DecorationImage(
          image: AssetImage('assets/images/img_card.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Card owner
          Text(
            'Harun Nurahman',
            style: whiteTextStyle.copyWith(
              fontSize: 18,
              fontWeight: medium,
            ),
          ),
          const SizedBox(height: 28),
          // Card number
          Text(
            '**** **** **** 1998',
            style: whiteTextStyle.copyWith(
              fontSize: 18,
              fontWeight: medium,
              letterSpacing: 6,
            ),
          ),
          const SizedBox(height: 25),
          // Card balance
          RichText(
            text: TextSpan(
              children: [
                const TextSpan(text: 'Balance\n'),
                TextSpan(
                  text: 'Rp 12.500',
                  style: whiteTextStyle.copyWith(
                    fontSize: 24,
                    fontWeight: semiBold,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget progressBar() {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      width: double.infinity,
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: whiteColor,
      ),
      child: Column(
        children: [
          // Level and percentage
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Level 1',
                style: blackTextStyle.copyWith(
                  fontWeight: medium,
                ),
              ),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: '55% ',
                      style: greenTextStyle.copyWith(fontWeight: semiBold),
                    ),
                    TextSpan(
                      text: 'of Rp 20.000',
                      style: blackTextStyle.copyWith(fontWeight: semiBold),
                    ),
                  ],
                ),
              )
            ],
          ),
          const SizedBox(height: 10),
          // Progress bar indicator
          ClipRRect(
            borderRadius: BorderRadius.circular(55),
            child: LinearProgressIndicator(
              minHeight: 5,
              backgroundColor: lightBackgroundColor,
              value: 0.55,
              valueColor: AlwaysStoppedAnimation(greenColor),
            ),
          )
        ],
      ),
    );
  }

  Widget services() {
    return Container(
      margin: const EdgeInsets.only(top: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Do Something',
            style: blackTextStyle.copyWith(
              fontSize: 16,
              fontWeight: semiBold,
            ),
          ),
          const SizedBox(height: 14),
          // Services list
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ServiceItem(
                iconUrl: 'assets/icons/ic_topup.png',
                title: 'Top Up',
                onTap: () {},
              ),
              ServiceItem(
                iconUrl: 'assets/icons/ic_send.png',
                title: 'Send',
                onTap: () {},
              ),
              ServiceItem(
                iconUrl: 'assets/icons/ic_withdraw.png',
                title: 'Withdraw',
                onTap: () {},
              ),
              ServiceItem(
                iconUrl: 'assets/icons/ic_more.png',
                title: 'More',
                onTap: () {},
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget latestTransaction() {
    return Container(
      margin: const EdgeInsets.only(top: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Latest Transaction',
            style: blackTextStyle.copyWith(
              fontSize: 16,
              fontWeight: semiBold,
            ),
          ),
          // Latest transaction list
          Container(
            width: double.infinity,
            margin: const EdgeInsets.only(top: 14),
            padding: const EdgeInsets.all(22),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: whiteColor,
            ),
          )
        ],
      ),
    );
  }
}
