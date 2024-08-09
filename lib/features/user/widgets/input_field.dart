import 'package:flutter/material.dart';
import 'package:meal_ai/core/styles/text_styles.dart';

class BrutRoundedInputField extends StatelessWidget {
  final String label;
  final bool obscureText;
  final TextEditingController controller;

  const BrutRoundedInputField({
    Key? key,
    required this.label,
    this.obscureText = false, required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          label,
          style: headline5,
        ),
        const SizedBox(height: 5),
        TextField(
          controller: controller,
          obscureText: obscureText,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(
                vertical: 0, horizontal: 10),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.shade400)),
            border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.shade400)),
          ),
        ),
      ],
    );
  }
}

class BrutRoundedPasswordInputField extends StatefulWidget {
  final String label;
  final bool obscureText;
  final TextEditingController controller;

  const BrutRoundedPasswordInputField({
    Key? key,
    required this.label,
    this.obscureText = false, required this.controller,
  }) : super(key: key);

  @override
  _BrutRoundedPasswordInputFieldState createState() => _BrutRoundedPasswordInputFieldState();
}

class _BrutRoundedPasswordInputFieldState extends State<BrutRoundedPasswordInputField> {
  late bool _obscureText;
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.obscureText;
    _controller = widget.controller;
  }

  void _toggleVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          widget.label,
          style: headline5,
        ),
        const SizedBox(height: 5),
        TextField(
          controller: _controller,
          obscureText: _obscureText,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
            enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey.shade400)),
            border: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey.shade400)),
            // Agregar el ícono de ojo aquí
            suffixIcon: widget.obscureText
                ? IconButton(
              icon: Icon(
                // Cambiar el ícono según el estado de _obscureText
                _obscureText ? Icons.visibility_off : Icons.visibility,
              ),
              onPressed: _toggleVisibility,
            )
                : null,
          ),
        ),
      ],
    );
  }
}

