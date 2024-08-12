import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:meal_ai/core/styles/sizes.dart';
import 'package:meal_ai/core/styles/text_styles.dart';
import 'package:meal_ai/core/texts.dart';
import 'package:meal_ai/core/widgets/buttons.dart';
import 'package:meal_ai/features/user/provider/auth_provider.dart';
import 'package:meal_ai/features/user/widgets/input_field.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginPage extends ConsumerWidget {
  static const String name = 'login_page';
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  LoginPage({super.key});

  void showSnackbar(BuildContext context, String text) {
    final snackBar = SnackBar(
      content: Text(text),
      duration: const Duration(seconds: 5),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        elevation: 0,
        title: const Text(tLogin, style: headline6,),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          height: MediaQuery.of(context).size.height - 50,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              const Text(tLoginHeader, style: headline1,),
              Column(
                children: <Widget>[
                  BrutRoundedInputField(label: tEmail, controller: _emailController,),
                  BrutRoundedPasswordInputField(label: tPassword, obscureText: true, controller: _passwordController,),
                ],
              ),
              const SizedBox(height: PaddingSizes.md,),
              BrutButton(
                text: tLogin,
                onPressed: () async {
                  final email = _emailController.text;
                  final password = _passwordController.text;
                  ref.read(userControllerProvider.notifier)
                      .login(email: email, password: password)
                      .then((res) => {
                    res.fold(
                          (l) => showSnackbar(context, l),
                          (r) => context.go('/home'),
                    )
                  });
                },
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
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
  }
}