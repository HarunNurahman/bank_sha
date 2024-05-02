import 'package:bank_sha/bloc/user/user_bloc.dart';
import 'package:bank_sha/models/user_model.dart';
import 'package:bank_sha/pages/widgets/custom-button.dart';
import 'package:bank_sha/pages/widgets/custom-textfield.dart';
import 'package:bank_sha/pages/widgets/transfer-recent-user_item.dart';
import 'package:bank_sha/pages/widgets/transfer-search-result_item.dart';
import 'package:bank_sha/shared/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TransferPage extends StatefulWidget {
  const TransferPage({super.key});

  @override
  State<TransferPage> createState() => _TransferPageState();
}

class _TransferPageState extends State<TransferPage> {
  TextEditingController usernameController = TextEditingController();
  UserModel? selectedUser;
  late UserBloc userBloc;

  @override
  void initState() {
    userBloc = context.read<UserBloc>()..add(GetRecentUser());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transfer'),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        children: [
          searchBar(),
          usernameController.text.isEmpty ? recentUser() : searchResult(),
        ],
      ),
      // Continue button
      bottomNavigationBar: selectedUser != null
          ? Padding(
              padding: const EdgeInsets.all(24.0),
              child: CustomButton(
                text: 'Continue',
                ontap: () => Navigator.pushNamed(context, '/transfer-amount'),
              ),
            )
          : null,
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
          CustomTextField(
            text: 'by username',
            controller: usernameController,
            isShowTitle: false,
            onFieldSubmitted: (value) {
              if (value.isNotEmpty) {
                userBloc.add(GetUserByUsername(usernameController.text));
              } else {
                selectedUser = null;
                userBloc.add(GetRecentUser());
              }

              setState(() {});
            },
          ),
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
          BlocBuilder<UserBloc, UserState>(
            builder: (context, state) {
              if (state is UserSuccess) {
                return Column(
                  children: state.users
                      .map((user) => TransferRecentUserItem(user: user))
                      .toList(),
                );
              }
              return Center(
                child: CircularProgressIndicator(
                  color: blueColor,
                ),
              );
            },
          )
        ],
      ),
    );
  }

  Widget searchResult() {
    return Container(
      margin: const EdgeInsets.only(top: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Result',
            style: blackTextStyle.copyWith(
              fontSize: 16,
              fontWeight: semiBold,
            ),
          ),
          const SizedBox(height: 14),
          BlocBuilder<UserBloc, UserState>(
            builder: (context, state) {
              if (state is UserSuccess) {
                return Wrap(
                  spacing: 24,
                  runSpacing: 17,
                  children: state.users
                      .map(
                        (user) => GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedUser = user;
                            });
                          },
                          child: TransferSearchResultItem(
                            user: user,
                            isSelected: user.id == selectedUser?.id,
                          ),
                        ),
                      )
                      .toList(),
                );
              }
              return Center(
                child: CircularProgressIndicator(
                  color: blueColor,
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
