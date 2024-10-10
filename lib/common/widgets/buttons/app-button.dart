import 'package:flutter/material.dart';
import 'package:swd_app/theme/color.dart';
import 'package:swd_app/theme/sizes.dart';
import 'package:swd_app/theme/text-styles.dart';

class AppButton extends StatelessWidget {
  final String text;
  final Color? enabledBtnColor;
  final Color? disabledBtnColor;
  final Color? textColor;
  final bool? enabled;
  final double? paddingVertical;
  final bool? smallButton;
  final Function() onTap;

  const AppButton({
    Key? key,
    required this.text,
    this.enabledBtnColor,
    this.textColor,
    this.enabled,
    required this.onTap,
    this.disabledBtnColor,
    this.paddingVertical,
    this.smallButton = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: enabled == null
          ? onTap
          : enabled!
              ? onTap
              : null,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: enabled == null
                ? enabledBtnColor ?? appPrimaryColor
                : enabled!
                    ? enabledBtnColor ?? appPrimaryColor
                    : disabledBtnColor ?? appTertiaryColor,
            width: 1,
          ),
          // Use gradient only when the button is enabled
          gradient: (enabled == null || enabled == true)
              ? LinearGradient(
                  begin: Alignment.bottomRight,
                  end: Alignment.topLeft,
                  colors: [
                    Color(0xFFEFA058), // Start color
                    Color(0xFFEF5858), // End color
                  ],
                  stops: [0.0, 0.4717], // Figma gradient stops
                )
              : null, // No gradient when disabled
          // Fallback solid color when disabled
          color: enabled == null
              ? null
              : enabled!
                  ? null
                  : disabledBtnColor ?? appTertiaryColor,
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: paddingVertical ?? 10.0),
          child: Center(
            child: Text(
              text,
              style: bodyText2Style.copyWith(
                color: enabled != null
                    ? enabled!
                        ? textColor ?? Colors.white
                        : Colors.black
                    : textColor ?? Colors.white,
                fontWeight: FontWeight.w400,
                fontSize: 15,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
