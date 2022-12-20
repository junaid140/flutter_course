import 'package:flutter/material.dart';
import 'package:onboarding_intro_screen/onboarding_screen.dart';
class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:OnBoardingScreen(
          leftIcon: Icons.arrow_back_ios,
          iconColor: Colors.red,
          rightIcon: Icons.arrow_forward_ios,
          showIndicator: true,
          showPrevNextButton: true,
          pages: [
        OnBoardingModel(
          title: "sdhsj",
          body: "Screen 1",
          image: Image.asset("assets/images/img.png"),

        ),
        OnBoardingModel(
          title: "sdhsj",
          image: Image.asset("assets/images/img.png"),

          body: "Screen 2",
        ),
        OnBoardingModel(
          title: "sdhsj",
          image: Image.asset("assets/images/img.png"),

          body: "Screen 3",
        ),
        OnBoardingModel(
          title: "sdhsj",
          image: Image.asset("assets/images/img.png"),

          body: "Screen 4",
        ),
      ], onSkip: (){

      })

    );
  }
}
