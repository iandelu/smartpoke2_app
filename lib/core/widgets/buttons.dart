import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meal_ai/config/theme/brut_colors.dart';
import 'package:meal_ai/config/theme/brut_shadows.dart';
import 'package:meal_ai/config/theme/brut_theme.dart';
import 'package:meal_ai/core/styles/sizes.dart';
import 'package:meal_ai/core/styles/text_styles.dart';


class BrutButton extends StatelessWidget {
  final String text;
  final double height;
  final double width;
  final VoidCallback onPressed;
  final Color color;
  final Color borderColor;
  final Color disabledColor;
  final Color textColor;
  final double borderRadius;
  final bool isEnabled;
  final double elevation;
  final double disabledElevation;
  final BoxShadow boxShadow;
  final TextStyle textStyle;



  const BrutButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.color = accentTeal1,
    this.borderColor = black1,
    this.disabledColor = black3,
    this.textColor = white,
    this.borderRadius = 4.0,
    this.isEnabled = true,
    this.elevation = 2.0,
    this.disabledElevation = 0.0,
    this.boxShadow = shadowBigBrut,
    this.textStyle = sRegular,
    this.width = double.infinity,
    this.height = 60,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    boxShadow ?? shadowMediumBrut;
    return Container(
      width: double.infinity,
      height: height,
      decoration: BoxDecoration(
        color: white,
        borderRadius: BorderRadius.circular(BorderRadiusSizes.md),
        border: Border.all( color: borderColor, width: 2,),
        boxShadow: [boxShadow],
      ),

      child: MaterialButton(
        onPressed: onPressed,
        color: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(BorderRadiusSizes.md),
        ),
        elevation: 0.0,
        child: Text(text, style: textStyle),
      ),
    );
  }
}


class BrutIconButton extends StatefulWidget {
  final Color buttonColor;
  final BoxShadow boxShadow;
  final IconData iconData;
  final double iconSize;
  final double width;
  final double height;
  final bool rounded;
  final bool isClickable;
  final VoidCallback? onPressed;
  final Color iconColor;

  const BrutIconButton({
    Key? key,
    required this.iconData,
    this.onPressed,
    this.buttonColor = accentTeal1,
    this.boxShadow = shadowMediumBrut,
    this.iconSize = 30.0,
    this.width = 40,
    this.height = 40,
    this.rounded = true,
    this.isClickable = true,
    this.iconColor = black1
  }) : super(key: key);

  @override
  _BrutIconButtonState createState() => _BrutIconButtonState();
}

class _BrutIconButtonState extends State<BrutIconButton> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 100),
      lowerBound: 0.8,
      upperBound: 1.0,
    );
    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 0.8,
    ).animate(_animationController);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _onTapDown(TapDownDetails details) {
    if (widget.isClickable) {
      _animationController.forward();
    }
  }

  void _onTapUp(TapUpDetails details) {
    if (widget.isClickable) {
      _animationController.reverse();
      widget.onPressed;
    }
  }

  @override
  Widget build(BuildContext context) {
    widget.boxShadow ?? shadowBigBrut;

    //Control if is rounded or rectanguled
    BoxShape shape = BoxShape.circle;
    if(!widget.rounded) {
      shape = BoxShape.rectangle;
    }
    return GestureDetector(
      onTapDown: widget.isClickable ? _onTapDown : null,
      onTapUp: widget.isClickable ? _onTapUp : null,
      onTap: widget.isClickable ? widget.onPressed: null,

      child: AnimatedBuilder(
        animation: _animationController,
        builder: (context, child) {
          return Transform.scale(
            scale: _scaleAnimation.value,
            child: Container(
              width: widget.width,
              height: widget.height,
              decoration: BoxDecoration(
                border: brutBorderNormal,
                color: widget.buttonColor,
                shape: shape,
                boxShadow: [widget.boxShadow],
              ),
              child: Icon(
                widget.iconData,
                size: widget.iconSize,
                color: widget.iconColor,
              ),
            ),
          );
        },
      ),
    );
  }
}

class IconAndTextWidget extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color iconColor;
  final bool rounded;

  const IconAndTextWidget({super.key,
    required this.icon,
    required this.text,
    required this.iconColor,
    this.rounded = true

  });


  @override
  Widget build(BuildContext context) {
    return Row(

      children: [
        BrutIconButton(iconData: icon, isClickable: false, rounded: true, buttonColor: iconColor, width: 30, height: 30,iconSize: 20,),
        const SizedBox(width: PaddingSizes.xs),
        Text(text, style: Theme.of(context).textTheme.bodyMedium,),
        const SizedBox(width: PaddingSizes.sm),
      ],
    );
  }
}



