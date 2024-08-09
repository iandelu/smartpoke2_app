import 'package:flutter/material.dart';
import 'package:meal_ai/core/styles/sizes.dart';
import 'package:meal_ai/core/styles/text_styles.dart';
import 'package:meal_ai/core/texts.dart';
import 'package:meal_ai/core/widgets/buttons.dart';
import 'package:meal_ai/features/user/widgets/input_field.dart';

class LoginPage extends StatelessWidget {

  static const String name = 'login_page';
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        elevation: 0,
        title: const Text(tLogin, style: headline6,),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 80),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  const Text(tLoginText, style: headline1,),
                  const SizedBox(height: 40,),
                  Column(
                    children: <Widget>[
                      BrutRoundedInputField(label: tEmail,controller: _emailController, ),
                      BrutRoundedPasswordInputField(label: tPassword, obscureText: true, controller: _passwordController,),
                    ],
                  ),
                  const SizedBox(height: PaddingSizes.md,),
                  BrutButton(
                      text: tLogin,
                      onPressed: () => {},
                      color: Theme.of(context).colorScheme.primary,
                      textStyle: headline6,
                    ),
                  const SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text(tAskForAccount),
                      TextButton(onPressed: () {}, child: Text(tSingUp, style: Theme.of(context).textTheme.titleSmall),)
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
  }


}
