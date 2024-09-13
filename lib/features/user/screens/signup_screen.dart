import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:meal_ai/config/theme/brut_colors.dart';
import 'package:meal_ai/core/styles/sizes.dart';
import 'package:meal_ai/core/styles/text_styles.dart';
import 'package:meal_ai/core/texts.dart';
import 'package:meal_ai/core/widgets/buttons.dart';
import 'package:meal_ai/features/user/provider/auth_provider.dart';
import 'package:meal_ai/features/user/widgets/input_field.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignupPage extends ConsumerStatefulWidget {
  static const String name = 'signup-screen';

  SignupPage({super.key});

  @override
  ConsumerState<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends ConsumerState<SignupPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordConfirmController = TextEditingController();

  bool hasUppercase = false;
  bool hasLowercase = false;
  bool hasDigit = false;
  bool hasMinLength = false;
  bool hasSpecialChar = false;
  double strength = 0;
  Color color = Colors.red;
  String strengthName = '';

  @override
  void initState() {
    super.initState();
    _passwordController.addListener(() {
      _checkPasswordStrength(_passwordController.text);
    });
  }

  void _checkPasswordStrength(String password) {
    setState(() {
      hasUppercase = password.contains(RegExp(r'[A-Z]'));
      hasLowercase = password.contains(RegExp(r'[a-z]'));
      hasDigit = password.contains(RegExp(r'[0-9]'));
      hasMinLength = password.length >= 8;
      hasSpecialChar = password.contains(RegExp(r'[&*_%\$#@!~]'));
      strength = _getPasswordStrengthValue();
      color = _getPasswordStrengthColor();
      strengthName = strength > 0.8 ? 'Strong' : strength > 0.6 ? 'Good' : strength > 0.4 ? 'Weak' : strength > 0.2 ? 'Very Weak' : '';
    });
  }

  double _getPasswordStrengthValue() {
    int strengthCount = 0;
    if (hasUppercase) strengthCount++;
    if (hasLowercase) strengthCount++;
    if (hasDigit) strengthCount++;
    if (hasMinLength) strengthCount++;
    if (hasSpecialChar) strengthCount++;
    return strengthCount / 5;
  }

  Color _getPasswordStrengthColor() {
    if (strength < 0.2) {
      return Colors.black;
    } else if (strength < 0.4) {
      return Colors.red;
    } else if (strength < 0.6) {
      return Colors.orange;
    } else if (strength < 0.8) {
      return Colors.lightGreen;
    } else {
      return Colors.green;
    }
}

  void showSnackbar(BuildContext context, String text) {
    final snackBar = SnackBar(
      content: Text(text),
      duration: const Duration(seconds: 5),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

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
                  BrutInputField(label: tEmail, controller: _emailController,),
                  const SizedBox(height: PaddingSizes.md,),
                  BrutInputField(label: tPassword, obscureText: true, controller: _passwordController,),
                  const SizedBox(height: PaddingSizes.md,),
                  BrutInputField(label: tConfirmPassword, obscureText: true, controller: _passwordConfirmController,),
                ],
              ),
              const SizedBox(height: PaddingSizes.md,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  LinearProgressIndicator(value: strength, color: color,minHeight: 3, backgroundColor: Colors.grey[300],),
                  Row(
                    children: [
                      Text('Password strength: '),
                      Text(strengthName, style: TextStyle(color: color,fontWeight: FontWeight.w500),),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(hasUppercase ? Icons.check : Icons.close, color: hasUppercase ? Colors.green : black1),
                      const SizedBox(width: 8),
                      Text('Uppercase Letter'),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(hasLowercase ? Icons.check : Icons.close, color: hasLowercase ? Colors.green : black1),
                      const SizedBox(width: 8),
                      Text('Lowercase Letter'),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(hasDigit ? Icons.check : Icons.close, color: hasDigit ? Colors.green : black1),
                      const SizedBox(width: 8),
                      Text('Digit'),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(hasMinLength ? Icons.check : Icons.close, color: hasMinLength ? Colors.green : black1),
                      const SizedBox(width: 8),
                      Text('Minimum 8 Characters'),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(hasSpecialChar ? Icons.check : Icons.close, color: hasSpecialChar ? Colors.green : black1),
                      const SizedBox(width: 8),
                      Text('Special Character'),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: PaddingSizes.md,),
              BrutButton(
                text: tSingUp,
                onPressed: () async {
                  final email = _emailController.text;
                  final password = _passwordController.text;
                  final passwordConfirm = _passwordConfirmController.text;
                  if (password != passwordConfirm) {
                    showSnackbar(context, tPasswordNotMatch);
                    return;
                  } else {
                    ref.read(userControllerProvider.notifier)
                        .signup(email: email, password: password)
                        .then((res) => {
                      res.fold(
                            (l) => showSnackbar(context, l),
                            (r) => context.go('/home'),
                      )
                    });
                  }
                },
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
    super.dispose();
  }
}

