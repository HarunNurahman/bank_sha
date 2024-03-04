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
    );
  }
}
