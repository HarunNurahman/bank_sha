import 'package:bank_sha/bloc/auth/auth_bloc.dart';
import 'package:bank_sha/bloc/transaction/transaction_bloc.dart';
import 'package:bank_sha/bloc/user/user_bloc.dart';
import 'package:bank_sha/models/transfer_model.dart';
import 'package:bank_sha/pages/transfer-amount_page.dart';
import 'package:bank_sha/pages/widgets/blog_item.dart';
import 'package:bank_sha/pages/widgets/latest-transaction_item.dart';
import 'package:bank_sha/pages/widgets/service_item.dart';
import 'package:bank_sha/pages/widgets/user_item.dart';
import 'package:bank_sha/shared/shared_method.dart';
import 'package:bank_sha/shared/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          profileHeader(context),
          walletCard(),
          progressBar(),
          services(context),
          latestTransaction(),
          sendAgain(),
          appBlog(),
        ],
      ),
    );
  }

  Widget profileHeader(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state is AuthSuccess) {
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
                        text: state.user.username.toString(),
                        style: blackTextStyle.copyWith(
                          fontSize: 20,
                          fontWeight: semiBold,
                        ),
                      ),
                    ],
                  ),
                ),
                // Profile picture
                GestureDetector(
                  onTap: () => Navigator.pushNamed(context, '/profile'),
                  child: Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: state.user.profilePicture == null
                            ? AssetImage('assets/images/img_friend-4.png')
                            : NetworkImage(state.user.profilePicture!)
                                as ImageProvider,
                        fit: BoxFit.cover,
                      ),
                    ),
                    // Verified status
                    child: state.user.verified == 1
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
                )
              ],
            ),
          );
        }
        return Container();
      },
    );
  }

  Widget walletCard() {
    // Card background
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state is AuthSuccess) {
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
                  state.user.name!,
                  style: whiteTextStyle.copyWith(
                    fontSize: 18,
                    fontWeight: medium,
                  ),
                ),
                const SizedBox(height: 28),
                // Card number
                Text(
                  '**** **** **** ${state.user.cardNumber!.substring(12, 16)}',
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
                        text: formatCurrency(state.user.balance!),
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
        return Container();
      },
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
                      text: 'of ${formatCurrency(50000)}',
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

  Widget services(BuildContext context) {
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
                onTap: () => Navigator.pushNamed(context, '/topup'),
              ),
              ServiceItem(
                iconUrl: 'assets/icons/ic_send.png',
                title: 'Send',
                onTap: () => Navigator.pushNamed(context, '/transfer'),
              ),
              ServiceItem(
                iconUrl: 'assets/icons/ic_withdraw.png',
                title: 'Withdraw',
                onTap: () {},
              ),
              ServiceItem(
                iconUrl: 'assets/icons/ic_more.png',
                title: 'More',
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) => const TransactionDialog(),
                  );
                },
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
            child: BlocProvider(
              create: (context) => TransactionBloc()..add(GetTransaction()),
              child: BlocBuilder<TransactionBloc, TransactionState>(
                builder: (context, state) {
                  if (state is TransactionSuccess) {
                    return Column(
                      children: state.transactions
                          .map(
                            (transaction) => LatestTransactionItem(
                              transactionData: transaction,
                            ),
                          )
                          .toList(),
                    );
                  }
                  return Center(
                    child: CircularProgressIndicator(color: blueColor),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget sendAgain() {
    return Container(
      margin: const EdgeInsets.only(top: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Send Again',
            style: blackTextStyle.copyWith(
              fontSize: 16,
              fontWeight: semiBold,
            ),
          ),
          const SizedBox(height: 14),
          // Send again list
          BlocProvider(
            create: (context) => UserBloc()..add(GetRecentUser()),
            child: BlocBuilder<UserBloc, UserState>(
              builder: (context, state) {
                if (state is UserSuccess) {
                  return SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: state.users
                          .map(
                            (list) => GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => TransferAmountPage(
                                      data: TransferModel(
                                        sendTo: list.username,
                                      ),
                                    ),
                                  ),
                                );
                              },
                              child: UserItem(user: list),
                            ),
                          )
                          .toList(),
                    ),
                  );
                }
                return Center(
                  child: CircularProgressIndicator(color: blueColor),
                );
              },
            ),
          )
        ],
      ),
    );
  }

  Widget appBlog() {
    return Container(
      margin: const EdgeInsets.only(top: 30, bottom: 50),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Friendly Tips',
            style: blackTextStyle.copyWith(
              fontSize: 16,
              fontWeight: semiBold,
            ),
          ),
          const SizedBox(height: 14),
          const Wrap(
            spacing: 32,
            runSpacing: 17,
            children: [
              BlogItem(
                imgUrl: 'assets/images/img_tips-1.png',
                title: 'Best Tips for Using a Credit Card',
                url: 'https://buildwithangga.com/',
              ),
              BlogItem(
                imgUrl: 'assets/images/img_tips-2.png',
                title: 'Spot the Good Pie of Finance Model',
                url: '',
              ),
              BlogItem(
                imgUrl: 'assets/images/img_tips-3.png',
                title: 'Great Hack to Get Better Advices',
                url: '',
              ),
              BlogItem(
                imgUrl: 'assets/images/img_tips-4.png',
                title: 'Save More Penny Buy This Instead',
                url: '',
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class TransactionDialog extends StatelessWidget {
  const TransactionDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.zero,
      alignment: Alignment.bottomCenter,
      content: Container(
        height: 330,
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(30),
        decoration: BoxDecoration(
          color: lightBackgroundColor,
          borderRadius: BorderRadius.circular(40),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Do More With Us',
              style: blackTextStyle.copyWith(
                fontSize: 16,
                fontWeight: semiBold,
              ),
            ),
            const SizedBox(height: 13),
            Wrap(
              spacing: 28,
              runSpacing: 28,
              children: [
                ServiceItem(
                  iconUrl: 'assets/icons/ic_product_mobile-data.png',
                  title: 'Data',
                  onTap: () => Navigator.pushNamed(context, '/mobile-data'),
                ),
                ServiceItem(
                  iconUrl: 'assets/icons/ic_product_bill.png',
                  title: 'Bill',
                  onTap: () {},
                ),
                ServiceItem(
                  iconUrl: 'assets/icons/ic_product_entertainment.png',
                  title: 'Stream',
                  onTap: () {},
                ),
                ServiceItem(
                  iconUrl: 'assets/icons/ic_product_subscription.png',
                  title: 'Movie',
                  onTap: () {},
                ),
                ServiceItem(
                  iconUrl: 'assets/icons/ic_product_food-drink.png',
                  title: 'Food',
                  onTap: () {},
                ),
                ServiceItem(
                  iconUrl: 'assets/icons/ic_product_travel.png',
                  title: 'Travel',
                  onTap: () {},
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
