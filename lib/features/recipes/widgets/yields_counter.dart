import 'package:flutter/material.dart';
import 'package:meal_ai/config/theme/brut_colors.dart';
import 'package:meal_ai/config/theme/brut_shadows.dart';
import 'package:meal_ai/core/styles/sizes.dart';
import 'package:meal_ai/core/styles/text_styles.dart';

class YieldsCounter extends StatefulWidget {
  final int count;
  final Color buttonColor;
  final Function(int) onCountChanged;

  const YieldsCounter({Key? key, required this.count, required this.onCountChanged, required this.buttonColor}) : super(key: key);

  @override
  _YieldsCounterState createState() => _YieldsCounterState();
}

class _YieldsCounterState extends State<YieldsCounter> {

  late int _currentCount;
  late Function _counterCallback;


  @override
  void initState() {
    _currentCount = widget.count ?? 1;
    _counterCallback = widget.onCountChanged ?? (int number) {};
    super.initState();
  }


  void _increment() {
    setState(() {
      _currentCount++;
      _counterCallback(_currentCount);
    });
  }

  void _dicrement() {
    setState(() {
      if (_currentCount > 1) {
        _currentCount--;
        _counterCallback(_currentCount);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      child: Container(
        height: 40,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(BorderRadiusSizes.lg),
            color: accentCoral1,
            boxShadow: const [shadowSmallBrut]
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            IconButton(
              onPressed: _dicrement,
              icon: Icon(Icons.remove, color: Theme.of(context).colorScheme.onSurface, size: 25,),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 7.0),
              child: Text('$_currentCount',
                  style: headline6
              ),
            ),
            IconButton(
              onPressed: _increment,
              icon: Icon(Icons.add, color: Theme.of(context).colorScheme.onSurface, size: 25,),
            ),
          ],
        ),
      ),
    );
  }
}