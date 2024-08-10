
import 'package:flutter/material.dart';
import 'package:meal_ai/core/styles/sizes.dart';
import 'package:meal_ai/core/styles/text_styles.dart';
import 'package:meal_ai/core/texts.dart';
import 'package:meal_ai/core/widgets/buttons.dart';
import 'package:meal_ai/features/user/widgets/input_field.dart';

class SignupPage extends StatelessWidget {

  static const String name = 'singup-screen';
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordConfirmController = TextEditingController();

  SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        elevation: 0,
        title: const Text(tSingUp, style: headline6,),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          height: MediaQuery.of(context).size.height - 50,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Column(
                children: <Widget>[
                  const Text(tSingUpHeader, style: headline1,),
                  Text(tSingUpSubHeader, style: Theme.of(context).textTheme.titleSmall, textAlign: TextAlign.center,),
                ],
              ),
              Column(
                children: <Widget>[
                  BrutRoundedInputField(label: tEmail, controller: _emailController,),
                  const SizedBox(height: PaddingSizes.md,),
                  BrutRoundedPasswordInputField(label: tPassword, obscureText: true, controller: _passwordController,),
                  const SizedBox(height: PaddingSizes.md,),
                  BrutRoundedPasswordInputField(label: tConfirmPassword, obscureText: true, controller: _passwordConfirmController,),
                ],
              ),
              const SizedBox(height: PaddingSizes.md,),
              BrutButton(
                  text: tSingUp,
                  onPressed: () => {},
                  color: Colors.greenAccent,
                  textStyle: headline6,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(tAskForAlreadyAccount),
                  TextButton(onPressed: () {}, child: Text(tLogin, style: Theme.of(context).textTheme.titleSmall,),)
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _passwordConfirmController.dispose();
  }
}
