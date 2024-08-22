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
    this.height = 50,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    boxShadow ?? shadowMediumBrut;
    return Container(
      width: double.infinity,
      height: height,
      decoration: BoxDecoration(
        color: white,
        borderRadius: BorderRadius.circular(BorderRadiusSizes.xxl),
        border: Border.all( color: borderColor, width: 2,),
        boxShadow: [boxShadow],
      ),

      child: MaterialButton(
        onPressed: onPressed,
        color: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(BorderRadiusSizes.xxl),
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
  final Icon icon;
  final double width;
  final double height;
  final bool rounded;
  final bool isClickable;
  final VoidCallback? onPressed;

  const BrutIconButton({
    Key? key,
    required this.icon,
    this.onPressed,
    this.buttonColor = accentTeal1,
    this.boxShadow = shadowMediumBrut,
    this.width = 40,
    this.height = 40,
    this.rounded = true,
    this.isClickable = true,
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
              child: widget.icon,
            ),
          );
        },
      ),
    );
  }
}

class IconAndTextWidget extends StatelessWidget {
  final Icon icon;
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
        BrutIconButton(icon: icon, isClickable: false, rounded: true, buttonColor: iconColor, width: 30, height: 30),
        const SizedBox(width: PaddingSizes.xs),
        Text(text, style: Theme.of(context).textTheme.bodyMedium,),
        const SizedBox(width: PaddingSizes.sm),
      ],
    );
  }
}

class CustomIconButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Icon icon;
  final Color iconColor;
  final double iconSize;
  final double borderRadius;
  final Color backgroundColor;
  final Color borderColor;
  final double borderWidth;
  final double buttonSize; // Nueva propiedad para el tamaño del botón

  const CustomIconButton({
    Key? key,
    required this.onPressed,
    required this.icon,
    this.iconColor = Colors.black,
    this.iconSize = 18.0,
    this.borderRadius = 12.0,
    this.backgroundColor = Colors.white,
    this.borderColor = Colors.black,
    this.borderWidth = 2.0,
    this.buttonSize = 35.0, // Tamaño predeterminado
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: buttonSize,
      height: buttonSize,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(borderRadius),
        boxShadow: const [
          shadowSmallBrut,
        ],
        border: Border.all(
          color: borderColor,
          width: borderWidth,
        ),
      ),
      child: IconButton(
        icon: icon,
        onPressed: onPressed,
        padding: EdgeInsets.zero, // Sin padding para mantener el botón compacto
        constraints: BoxConstraints(), // Sin restricciones para mantener el tamaño del contenedor
      ),
    );
  }
}






