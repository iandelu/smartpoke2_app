import 'package:flutter/material.dart';
class ExpandableTextWidget extends StatefulWidget {
  final String text;
  final TextStyle? style;
  final int? maxLines;
  final TextAlign? textAlign;


  const ExpandableTextWidget({Key? key, required this.text, this.style, this.maxLines, this.textAlign}) : super(key: key);

  @override
  _ExpandableTextWidgetState createState() => _ExpandableTextWidgetState();
}

class _ExpandableTextWidgetState extends State<ExpandableTextWidget> {
  bool _isExpanded = false;
  TextStyle? _style;
  int? _maxLines;
  TextAlign? _textAlign;

  @override
  Widget build(BuildContext context) {
    _style = widget.style;
    _maxLines = widget.maxLines;
    _textAlign = widget.textAlign;
    return Container(
      padding: const EdgeInsets.all(2),
      child: GestureDetector(
        onTap: () {
          setState(() {
            _isExpanded = !_isExpanded;
          });
        },
        child: AnimatedCrossFade(
          firstChild: Text(
            widget.text,
            maxLines: _maxLines ?? 2,
            textAlign: _textAlign ?? TextAlign.start,
            overflow: TextOverflow.ellipsis,
            style: _style ?? Theme.of(context).textTheme.bodyMedium,
          ),
          secondChild: Text(
            widget.text,
            maxLines: 40,
            textAlign: _textAlign ?? TextAlign.start,
            style: _style ?? Theme.of(context).textTheme.bodyMedium,
          ),
          crossFadeState: _isExpanded ? CrossFadeState.showSecond : CrossFadeState.showFirst,
          duration: const Duration(milliseconds: 150),
        ),
      ),
    );
  }
}