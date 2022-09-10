import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:introduction_screen/introduction_screen.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: IntroductionScreen(
      pages: [
        PageViewModel(
          title: 'Get VIP Number',
          body: 'Here we provider VIP Numbers at low cost ',
          image: Image.asset(
              "assets/how-to-check-if-my-old-phone-number-is-available1..jpeg"),
          decoration: PageDecoration(
            bodyTextStyle: TextStyle(fontSize: 23),
            titleTextStyle:
                TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            imagePadding: EdgeInsets.only(top: 15),
          ),
        ),
        PageViewModel(
            title: 'Simple UI',
            body: 'We have simple to use UI so that user experience increase',
            image: Image.asset("assets/undraw_Team_up_re_84ok.png"),
            decoration: PageDecoration(
              bodyTextStyle: TextStyle(fontSize: 23),
              titleTextStyle:
                  TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            )),
        PageViewModel(
          title: '100% Genuine App',
          body: 'We are Loyal and Honest to our customer ',
          image: Image.asset("assets/undraw_Agree_re_hor9.png"),
          decoration: PageDecoration(
            imagePadding: EdgeInsets.all(15),
            bodyTextStyle: TextStyle(fontSize: 23),
            titleTextStyle:
                TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
        ),
      ],
      showNextButton: false,
      showDoneButton: true,
      done: Text("Next"),
      onDone: () => context.go("/home"),
      showSkipButton: true,
      skip: Text('Skip'),
      onSkip: () => context.go('/home'),
    ));
  }
}
