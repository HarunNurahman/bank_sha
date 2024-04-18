import 'package:bank_sha/bloc/auth/auth_bloc.dart';
import 'package:bank_sha/pages/mobile-data-package_page.dart';
import 'package:bank_sha/pages/mobile-data-provider_page.dart';
import 'package:bank_sha/pages/home_page.dart';
import 'package:bank_sha/pages/mobile-data-success_page.dart';
import 'package:bank_sha/pages/onboarding_page.dart';
import 'package:bank_sha/pages/pin-edit_page.dart';
import 'package:bank_sha/pages/pin_page.dart';
import 'package:bank_sha/pages/profile-edit-success_page.dart';
import 'package:bank_sha/pages/profile-edit_page.dart';
import 'package:bank_sha/pages/profile_page.dart';
import 'package:bank_sha/pages/sign-in_page.dart';
import 'package:bank_sha/pages/sign-up-success_page.dart';
import 'package:bank_sha/pages/sign-up-verify_page.dart';
import 'package:bank_sha/pages/sign-up_page.dart';
import 'package:bank_sha/pages/splash_page.dart';
import 'package:bank_sha/pages/topup-amount_page.dart';
import 'package:bank_sha/pages/topup-success_page.dart';
import 'package:bank_sha/pages/topup_page.dart';
import 'package:bank_sha/pages/transfer-amount_page.dart';
import 'package:bank_sha/pages/transfer-success_page.dart';
import 'package:bank_sha/pages/transfer_page.dart';
import 'package:bank_sha/shared/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AuthBloc()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: lightBackgroundColor,
          appBarTheme: AppBarTheme(
            backgroundColor: lightBackgroundColor,
            elevation: 0,
            centerTitle: true,
            iconTheme: IconThemeData(color: blackColor),
            titleTextStyle: blackTextStyle.copyWith(
              fontSize: 20,
              fontWeight: semiBold,
            ),
          ),
        ),
        routes: {
          '/': (context) => const SplashPage(),
          '/onboarding': (context) => const OnboardingPage(),
          '/sign-in': (context) => const SignInPage(),
          '/sign-up': (context) => const SignUpPage(),
          '/sign-up-verify': (context) => const SignUpVerifyPage(),
          '/sign-up-success': (context) => const SignUpSuccessPage(),
          '/home': (context) => const HomePage(),
          '/profile': (context) => const ProfilePage(),
          '/edit-profile': (context) => const EditProfilePage(),
          '/edit-profile-success': (context) => const ProfileEditSuccessPage(),
          '/pin': (context) => const PinPage(),
          '/edit-pin': (context) => const EditPinPage(),
          '/topup': (context) => const TopupPage(),
          '/topup-amount': (context) => const TopupAmountPage(),
          '/topup-success': (context) => const TopupSuccessPage(),
          '/transfer': (context) => const TransferPage(),
          '/transfer-amount': (context) => const TransferAmountPage(),
          '/transfer-success': (context) => const TransferSuccessPage(),
          '/mobile-data': (context) => const MobileDataPage(),
          '/mobile-data-package': (context) => const MobileDataPackagePage(),
          '/mobile-data-success': (context) => const MobileDataSuccessPage(),
        },
      ),
    );
  }
}
