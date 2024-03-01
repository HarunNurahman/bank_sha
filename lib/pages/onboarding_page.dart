import 'package:bank_sha/pages/widgets/custom-button.dart';
import 'package:bank_sha/shared/styles.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  int currentIndex = 0;
  CarouselController carouselController = CarouselController();

  List<String> title = [
    'Grow Your\nFinancial Today',
    'Build From\nZero to Freedom',
    'Start Together',
  ];

  List<String> desc = [
    'Our system is helping you to\nachieve a better goal',
    'We provide tips for you so that\nyou can adapt easier',
    'We will guide you to where\nyou wanted it too'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightBackgroundColor,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Image carousel
              CarouselSlider(
                carouselController: carouselController,
                items: [
                  Image.asset(
                    'assets/images/img_onboarding-1.png',
                  ),
                  Image.asset(
                    'assets/images/img_onboarding-2.png',
                  ),
                  Image.asset(
                    'assets/images/img_onboarding-3.png',
                  ),
                ],
                options: CarouselOptions(
                  height: 300,
                  viewportFraction: 1,
                  enableInfiniteScroll: false,
                  onPageChanged: (index, reason) {
                    setState(() {
                      currentIndex = index;
                    });
                  },
                ),
              ),
              const SizedBox(height: 80),
              // Content box
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 24),
                padding:
                    const EdgeInsets.symmetric(horizontal: 22, vertical: 24),
                decoration: BoxDecoration(
                  color: whiteColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    // Title
                    Text(
                      title[currentIndex],
                      textAlign: TextAlign.center,
                      style: blackTextStyle.copyWith(
                        fontSize: 20,
                        fontWeight: semiBold,
                      ),
                    ),
                    const SizedBox(height: 26),
                    // Description
                    Text(
                      desc[currentIndex],
                      textAlign: TextAlign.center,
                      style: grayTextStyle.copyWith(fontSize: 16),
                    ),
                    SizedBox(height: currentIndex == 2 ? 30 : 50),
                    // Button and dot indicator
                    currentIndex == 2
                        ? Column(
                            children: [
                              CustomButton(
                                text: 'Get Started',
                                ontap: () {},
                              ),
                              const SizedBox(height: 30),
                              CustomTextButton(
                                text: 'Sign In',
                                ontap: () {
                                  Navigator.pushNamed(context, '/sign-in');
                                },
                              )
                            ],
                          )
                        : Row(
                            children: [
                              // Dot indicator
                              Row(
                                children: [
                                  Container(
                                    width: 12,
                                    height: 12,
                                    margin: const EdgeInsets.only(right: 10),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: currentIndex == 0
                                          ? blueColor
                                          : lightGrayColor,
                                    ),
                                  ),
                                  Container(
                                    width: 12,
                                    height: 12,
                                    margin: const EdgeInsets.only(right: 10),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: currentIndex == 1
                                          ? blueColor
                                          : lightGrayColor,
                                    ),
                                  ),
                                  Container(
                                    width: 12,
                                    height: 12,
                                    margin: const EdgeInsets.only(right: 10),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: currentIndex == 2
                                          ? blueColor
                                          : lightGrayColor,
                                    ),
                                  )
                                ],
                              ),
                              const Spacer(),
                              // Button
                              CustomButton(
                                text: 'Continue',
                                ontap: () {
                                  carouselController.nextPage();
                                },
                                width: 150,
                              )
                            ],
                          )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
