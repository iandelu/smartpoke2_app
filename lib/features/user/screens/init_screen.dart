import 'package:flutter/material.dart';
import 'package:meal_ai/config/theme/brut_colors.dart';
import 'package:meal_ai/core/styles/sizes.dart';
import 'package:meal_ai/core/styles/text_styles.dart';
import 'package:meal_ai/core/texts.dart';
import 'package:meal_ai/core/widgets/buttons.dart';
import 'package:meal_ai/features/user/screens/login_screen.dart';
import 'package:meal_ai/features/user/screens/signup_screen.dart';

class InitialPage extends StatelessWidget {
  const InitialPage({Key? key}) : super(key: key);

  static const String name = 'init_page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 60),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const WelcomeTextWidget(
                title: "Welcome",
                subTitle:
                "Automatic identity verification which enables you to verify your identity",
              ),
              Column(
                children: <Widget>[
                  BrutButton(
                    text: tLogin,
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => LoginPage()));
                    },
                    color: Theme.of(context).colorScheme.surface,
                    textStyle: headline5,
                  ),
                  const SizedBox(height: 20),
                  BrutButton(
                    text: tSingUp,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SignupPage()));
                    },
                    color: Theme.of(context).colorScheme.primary,
                    textStyle: headline5,
                  ),
                  const SizedBox(height: PaddingSizes.md),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      BrutIconButton(
                        icon: Icon(Icons.apple),
                        buttonColor: Colors.white,
                        rounded: false,
                        height: 60,
                        width: 60,
                      ),
                      BrutIconButton(
                        icon: Icon(Icons.facebook, color: Colors.white,),
                        buttonColor: Colors.black,
                        rounded: false,
                        height: 60,
                        width: 60,
                      ),
                      BrutIconButton(
                        icon: Icon(Icons.g_mobiledata),
                        buttonColor: accentCoral3,
                        rounded: false,
                        height: 60,
                        width: 60,
                      )
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class WelcomeTextWidget extends StatelessWidget {
  final String title;
  final String subTitle;

  const WelcomeTextWidget(
      {Key? key, required this.title, required this.subTitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
         Text(title, style: headline1,),
        const SizedBox(height: 20),
         Text(
          subTitle,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.titleSmall,
        ),
      ],
    );
  }
}
