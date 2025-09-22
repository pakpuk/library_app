import 'package:flutter/material.dart';
import 'package:library_app/common/colors_extensions.dart';
import 'package:library_app/common_widget/roung_butoon.dart';
import 'package:library_app/view/home/home_guest_view.dart';
import 'package:library_app/view/login/sign_in_view.dart';

class WelcomeView extends StatefulWidget {
  const WelcomeView({super.key});

  @override
  State<WelcomeView> createState() => _WelcomeViewState();
}

class _WelcomeViewState extends State<WelcomeView> {
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(children: [
        Image.asset(
          "lib/assets/img/welcome_bg.png",
          width: media.width,
          height: media.height,
          fit: BoxFit.cover,
        ),
        SafeArea(
            child: Container(
          width: media.width,
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            children: [
              SizedBox(
                height: media.width * 0.25,
              ),
              Text(
                "Books For\nEvery Taste.",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: TColor.primary,
                    fontSize: 35,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: media.width * 0.28,
              ),
              RoundButton(
                title: "Sign in",
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SignInView()));
                },
              ),
              const SizedBox(
                height: 20,
              ),
              RoundButton(
                title: "Enter as a Guest",
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HomeguestView()));
                },
              ),
            ],
          ),
        ))
      ]),
    );
  }
}
