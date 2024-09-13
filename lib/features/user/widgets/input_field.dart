import 'package:flutter/material.dart';
import 'package:meal_ai/config/theme/brut_colors.dart';
import 'package:meal_ai/core/styles/text_styles.dart';

class BrutInputField extends StatefulWidget {
  final String label;
  final bool obscureText;
  final TextEditingController controller;
  final String? hintText;

  const BrutInputField({
    Key? key,
    required this.label,
    this.obscureText = false, required this.controller, this.hintText,
  }) : super(key: key);

  @override
  _BrutInputFieldState createState() => _BrutInputFieldState();
}

class _BrutInputFieldState extends State<BrutInputField> {
  late bool _obscureText;
  late TextEditingController _controller;
  final FocusNode _focusNode = FocusNode();
  bool _isFocused = false;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.obscureText;
    _controller = widget.controller;
    _focusNode.addListener(() {
      setState(() {
        _isFocused = _focusNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
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
          focusNode: _focusNode,
          cursorColor: Colors.black,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(
                color: _isFocused ? Colors.black : Colors.grey.shade400,
                width: _isFocused ? 2.0 : 0,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(color: Colors.black, width: 2.0),
            ),
            filled: true,
            fillColor: _isFocused ? Colors.white : cream2,
            hintText: widget.hintText ?? '',
            hintStyle: TextStyle(color: Colors.grey.shade600),
            suffixIcon: widget.obscureText
                ? IconButton(
              icon: Icon(
                _obscureText ? Icons.visibility_off : Icons.visibility,
              ),
              onPressed: _toggleVisibility,
            ) : null,
          ),
        ),
      ],
    );
  }
}