import 'package:flutter/material.dart';
import 'package:meal_ai/config/theme/brut_colors.dart';
import 'package:meal_ai/core/styles/text_styles.dart';
import 'package:meal_ai/core/widgets/buttons.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool showArrows;
  final bool showLeadingButton;
  final bool showTrailingButton;
  final void Function()? leadingButtonOnPressed;
  final void Function()? trailingButtonOnPressed;
  final Icon? trailingButtonIcon;
  final Icon? leadingButtonIcon;

  const MyAppBar({
    Key? key,
    required this.title,
    this.showArrows = true,
    this.showLeadingButton = true,
    this.showTrailingButton = true,
    this.leadingButtonOnPressed,
    this.trailingButtonOnPressed,
    this.leadingButtonIcon,
    this.trailingButtonIcon,
  }) : super(key: key);

  @override
  Size get preferredSize =>
      const Size.fromHeight(kToolbarHeight); // Updated height

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: AppTextStyles().lThick.copyWith(
          color: black1,
        )
      ),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      centerTitle: true,
      leading: showLeadingButton
          ? IconButton(
              icon: leadingButtonIcon ??
                  const Icon(
                    Icons.menu,
                    color: Colors.black,
                  ),
              onPressed: () {
                if (leadingButtonOnPressed != null) {
                  leadingButtonOnPressed!();
                }
              },
            )
          : null,
      actions: showTrailingButton
          ? [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: BrutIconButton(
                  icon: trailingButtonIcon ??
                      const Icon(
                        Icons.settings,
                        color: Colors.black,
                      ),
                  onPressed: () {
                    if (trailingButtonOnPressed != null) {
                      trailingButtonOnPressed!();
                    }
                  },
                ),
              ),
            ]
          : [],
      elevation: 0,
    );
  }
}
