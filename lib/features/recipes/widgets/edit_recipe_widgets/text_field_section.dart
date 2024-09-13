import 'package:flutter/material.dart';
import 'package:meal_ai/config/theme/brut_colors.dart';
import 'package:meal_ai/config/theme/brut_shadows.dart';
import 'package:meal_ai/core/styles/text_styles.dart';

class TextFieldSection extends StatefulWidget {
  final String label;
  final TextEditingController controller;
  final int maxLines;

  TextFieldSection({
    required this.label,
    required this.controller,
    this.maxLines = 1,
  });

  @override
  _TextFieldSectionState createState() => _TextFieldSectionState();
}

class _TextFieldSectionState extends State<TextFieldSection> {
  bool _isFocused = false;
  int _currentLineCount = 0;

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(_updateLineCount);
  }

  void _updateLineCount() {
    final lines = '\n'.allMatches(widget.controller.text).length + 1;
    setState(() {
      _currentLineCount = lines;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
            widget.label,
            style: headline5),
        const SizedBox(height: 8),
        Focus(
          onFocusChange: (hasFocus) {
            setState(() {
              _isFocused = hasFocus;
            });
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            decoration: BoxDecoration(
              color: _isFocused ? Colors.white : cream2,
              borderRadius: BorderRadius.circular(10),
              boxShadow: _isFocused
                  ? [shadowBigBrut] : [],
              border: Border.all(
                  color: _isFocused ? Colors.black : Colors.grey.shade400,
                  width: _isFocused ? 2.0 : 0
              ),
            ),
            child: Column(
              children: [
                TextField(
                  controller: widget.controller,
                  maxLines: widget.maxLines,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    contentPadding:
                    EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  ),
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                if (widget.maxLines > 1)
                  Padding(
                    padding: const EdgeInsets.only(
                        right: 16.0, bottom: 8.0, top: 4.0),
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: Text(
                        '${widget.maxLines - _currentLineCount} lines remaining',
                        style: TextStyle(
                          color: _isFocused ? black1 : Colors.grey,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    widget.controller.removeListener(_updateLineCount);
    super.dispose();
  }
}
