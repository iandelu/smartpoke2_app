import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meal_ai/config/theme/brut_colors.dart';

class NeuContainer extends StatefulWidget {
  /// A customizable neubrutalist-style Container Template, allowing
  /// user to experiment freely without any restriction in functionality.
  ///
  /// This button is built using Flutter's `Material` widget, and is designed to
  /// follow the Neubrutalism UI style guidelines.
  ///
  /// *[Constants]

  ///   - const neuBlack = Colors.black;
  ///   - const neuDefault1 = Colors.teal;
  ///   - const neuShadow = Color(0xFF080808);
  ///
  ///   - const neuBorder = 3.0;
  ///   - const neuShadowBlurRadius = 0.0;
  ///
  ///   - const neuOffset = Offset(4, 4);
  ///   - const neuBlurStyle = BlurStyle.solid;

  NeuContainer({
    Key? key,
    this.offset = const Offset(4, 4),
    this.color = accentTeal1,
    this.shadowColor = black1,
    this.borderColor = black1,
    this.height,
    this.width,
    this.borderWidth = 3,
    this.shadowBlurRadius = 0.0,
    this.shadowBlurStyle = BlurStyle.solid,
    this.child,
    this.borderRadius,
  }) : super(key: key);

  /// - offset (optional): An Offset that defines the position of the shadow of the container.
  ///
  /// By default, it is set to neuOffset.

  final Offset offset;

  /// - color (optional): A Color that defines the background color of the container.
  ///
  /// By default, it is set to neuDefault1.

  final Color? color;

  /// - shadowColor (optional): A Color that defines the color of the shadow of the container.
  ///
  /// By default, it is set to neuShadow.

  final Color shadowColor;

  /// - borderColor (optional): A Color that defines the color of the border of the container.
  ///
  /// By default, it is set to neuBlack.

  final Color borderColor;

  /// - height (optional): A double that defines the height of the container.
  ///
  /// By default, it is set to null.

  final double? height;

  /// - width (optional): A double that defines the width of the container.
  ///
  /// By default, it is set to null.

  final double? width;

  /// - borderWidth (optional): A double that defines the width of the border of the container.
  ///
  /// By default, it is set to neuBorder.

  final double borderWidth;

  /// - shadowBlurRadius (optional): A double that defines the blur radius of the shadow of the container.
  ///
  /// By default, it is set to neuShadowBlurRadius.

  final double shadowBlurRadius;

  /// - shadowBlurStyle (optional): A BlurStyle that defines the style of the blur of the shadow of the container.
  ///
  /// By default, it is set to neuBlurStyle.

  final BlurStyle shadowBlurStyle;

  /// - child (optional): A widget that is displayed inside the container.
  ///
  /// By default, it is set to null.

  final Widget? child;

  /// - borderRadius (optional): A BorderRadiusGeometry that defines the radius of the corners of the container.
  ///
  /// By default, it is set to null.

  final BorderRadiusGeometry? borderRadius;

  @override
  State<NeuContainer> createState() => NeuContainerState();
}

class NeuContainerState extends State<NeuContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      decoration: BoxDecoration(
        borderRadius: widget.borderRadius,
        border: Border.all(
          color: widget.borderColor,
          width: widget.borderWidth,
        ),
        boxShadow: [
          BoxShadow(
            color: widget.shadowColor,
            blurRadius: widget.shadowBlurRadius,
            offset: widget.offset,
            blurStyle: widget.shadowBlurStyle,
          ),
        ],
        color: widget.color,
      ),
      child: widget.child,
      clipBehavior: Clip.antiAlias,
    );
  }
}

class NeuButton extends StatefulWidget {
  /// A customizable neubrutalist-style  button.
  ///
  /// The button has a customizable background color, border color,
  /// and drop shadow. The button's shape can also be customized with a rounded
  /// border radius. The button's behavior is specified with an `onPressed`
  /// callback function.
  ///
  /// This button is built using Flutter's `Material` widget, and is designed to
  /// follow the Neubrutalism UI style guidelines.
  ///
  /// *[Constants]

  ///   - const neuBlack = Colors.black;
  ///   - const neuDefault1 = Colors.teal;
  ///   - const neuShadow = Color(0xFF080808);
  ///
  ///   - const neuBorder = 3.0;
  ///   - const neuShadowBlurRadius = 0.0;
  ///
  ///   - const neuOffset = Offset(4, 4);
  ///   - const neuBlurStyle = BlurStyle.solid;

  NeuButton({
    Key? key,
    required this.enableAnimation,
    this.buttonColor = accentTeal1,
    this.shadowColor = black1,
    this.borderColor = black1,
    this.onPressed,
    this.borderRadius,
    this.offset = const Offset(4, 4),
    this.buttonHeight = 50,
    this.buttonWidth = 50,
    this.shadowBlurRadius = 0.0,
    this.borderWidth = 3.0,
    this.animationDuration = 100,
    required this.child,
  }) : super(key: key);

  /// - child: The child widget inside of the button
  ///
  final Widget? child;

  /// - buttonColor (optional) : A Color that defines the color of the button.
  ///
  /// By default, it is set to neuDefault1 (black).
  final Color buttonColor;

  /// shadowColor (optional) : A Color that defines the color of the button's shadow.
  ///
  /// By default, it is set to neuShadow.
  ///
  final Color shadowColor;

  // - borderColor (optional) : A Color that defines the color of the button's border.
  //
  //By default, it is set to neuBlack.

  final Color borderColor;

  /// - onPressed (optional) : A callback function that is called when the button is pressed.
  ///
  final GestureTapCallback? onPressed;

  /// - borderRadius (optional) : A BorderRadiusGeometry that defines the border radius of the button.
  ///
  /// If not specified, the button will have a circular border radius.
  final BorderRadius? borderRadius;

  /// - offset : An Offset that defines the amount and direction of the blur applied to the shadow of the card.
  ///
  final Offset offset;

  /// - buttonHeight (optional) : A double value that defines the height of the button.
  ///
  final double buttonHeight;

  /// - buttonWidth (optional) : A double value that defines the width of the button.
  ///
  final double buttonWidth;

  /// - shadowBlurRadius (optional) : A double that defines the radius of the blur applied to the shadow of the card.
  ///
  /// By default, it is set to neuShadowBlurRadius.
  ///
  final double shadowBlurRadius;

  /// - borderWidth (optional) : A double value that defines the width of the button's border.
  ///
  /// By default, it is set to neuBorder.
  ///
  final double borderWidth;

  /// animate (required) : Boolean Property to toggle the Animation property of the Button Widget.
  ///
  /// Creates a smooth pressing animation beginning from Offset(0,0) to the defined [`offset`] property. (Default offset value is (4,4))
  final bool enableAnimation;

  ///animationDuration (optional) : An Int. defining the Animation Duration in milliseconds.
  ///
  ///Default value is 100ms
  final int animationDuration;

  @override
  State<NeuButton> createState() => NeuButtonState();
}

class NeuButtonState extends State<NeuButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: widget.animationDuration),
    )..addListener(() {
      setState(() {});
    });
    _animation = Tween<Offset>(begin: const Offset(0, 0), end: widget.offset)
        .animate(new CurvedAnimation(
        parent: _controller, curve: Curves.bounceInOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        var doOnPressedAction = () => {
          if (widget.onPressed != null) {widget.onPressed!()}
        };

        if (widget.enableAnimation) {
          // do the on pressed action after the
          // first part of animation
          _controller.forward().then((value) {
            doOnPressedAction();
            _controller.reverse();
          });
        } else {
          // do on pressed action without any
          // animation
          doOnPressedAction();
        }
      },
      child: AnimatedBuilder(
        animation: _animation,
        child: NeuContainer(
          width: widget.buttonWidth,
          height: widget.buttonHeight,
          borderRadius: widget.borderRadius,
          color: widget.buttonColor,
          borderColor: widget.borderColor,
          borderWidth: widget.borderWidth,
          shadowColor: widget.shadowColor,
          shadowBlurRadius: widget.shadowBlurRadius,
          offset: widget.offset - _animation.value,
          child: Center(child: widget.child),
        ),
        builder: (context, child) {
          return Transform.translate(
            offset: _animation.value,
            child: child,
          );
        },
      ),
    );
  }
}


class NeuIconButton extends NeuButton {
  /// A customizable neubrutalist-style icon button.
  ///
  /// The button has an icon, customizable background color, border color,
  /// and drop shadow. The button's shape can also be customized with a rounded
  /// border radius. The button's behavior is specified with an `onPressed`
  /// callback function.
  ///
  /// This button is built using Flutter's `Material` widget, and is designed to
  /// follow the Neubrutalism UI style guidelines.
  ///
  /// *[Constants]

  ///   - const neuBlack = Colors.black; /   - const neuDefault1 = Colors.teal;
  ///   - const neuShadow = Color(0xFF080808);
  ///
  ///   - const neuBorder = 3.0;
  ///   - const neuShadowBlurRadius = 0.0;
  ///
  ///   - const neuOffset = Offset(4, 4);
  ///   - const neuBlurStyle = BlurStyle.solid;

  NeuIconButton({
    Key? key,
    required enableAnimation,
    required this.icon,
    int animationDuration = 100,
    Color borderColor = black1,
    BorderRadius? borderRadius,
    double borderWidth = 3.0,
    Color buttonColor = accentTeal1,
    double buttonHeight = 50,
    double buttonWidth = 100,
    Offset offset = const Offset(4, 4),
    GestureTapCallback? onPressed,
    double shadowBlurRadius = 0.0,
    Color shadowColor = black1,
  }) : super(
    animationDuration: animationDuration,
    borderColor: borderColor,
    borderRadius: borderRadius,
    borderWidth: borderWidth,
    buttonColor: buttonColor,
    buttonHeight: buttonHeight,
    buttonWidth: buttonWidth,
    child: icon,
    enableAnimation: enableAnimation,
    key: key,
    offset: offset,
    onPressed: onPressed,
    shadowBlurRadius: shadowBlurRadius,
    shadowColor: shadowColor,
  );

  /// - icon (required) : A Icon Widget to help you add icons.
  ///
  final Icon icon;
}