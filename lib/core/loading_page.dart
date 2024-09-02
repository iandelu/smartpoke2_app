import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:meal_ai/features/user/service/auth_state_user_service.dart';

class LoadingPage extends ConsumerStatefulWidget {
  const LoadingPage({Key? key}) : super(key: key);
  static const String name = 'loading-page';
  @override
  _LoadingPageState createState() => _LoadingPageState();
}

class _LoadingPageState extends ConsumerState<LoadingPage> {
  @override
  void initState() {
    super.initState();
    _checkAuthState();
  }

  void _checkAuthState() async {
    final authState = ref.read(authStateProvider);
    final user = authState?.user;

    await Future.delayed(const Duration(seconds: 1));

    if (user != null) {
      context.go('/session');
    } else {
      context.go('/home');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset('images/Savor.png'), // Cambia 'logo.png' por el logo de tu aplicación
      ),
    );
  }
}
