import 'package:flutter/cupertino.dart';
import 'package:libs_e_commerce_app/core/filled_button.dart';

class FilledButtonData extends StatelessWidget {
  final Function(Map<String, dynamic> param) onPress;
  final bool isFuture;
  final double verticalPadding;
  final double horizontalPadding;

  final Map<String, dynamic> parameter;
  final String text;
  final Color? buttonColor;
  final Widget icon;
  final Widget? suffixIcon;
  final bool isRequireIcon;
  final bool isRequireSuffixIcon;
  final bool isRequireCustomTextStyle;
  final TextStyle customTextStyle;

  final EdgeInsets? buttonMargin;

  final double? elevation;

  //zain-20 becausr log in button has a different color than the rest

  const FilledButtonData(
    this.text,
    this.onPress,
    this.parameter,
    this.isFuture, {
    this.buttonColor,
    super.key,
    this.verticalPadding = 0.0,
    this.horizontalPadding = 0.0,
    this.isRequireIcon = false,
    this.icon = const SizedBox(),
    this.isRequireCustomTextStyle = false,
    this.customTextStyle = const TextStyle(),
    this.isRequireSuffixIcon = false,
    this.suffixIcon,
    this.buttonMargin,
    this.elevation,
  });

  @override
  Widget build(BuildContext context) {
    return CustomFilledButton(
      elevation: elevation,
      buttonMargin ?? const EdgeInsets.all(15),
      Padding(
        padding: EdgeInsets.symmetric(
          vertical: verticalPadding,
          horizontal: horizontalPadding,
        ),
        child: Row(
          children: [
            icon,
            isRequireIcon ? SizedBox(width: 4) : SizedBox(),
            Text(
              text,
              style:
                  isRequireCustomTextStyle
                      ? customTextStyle
                      : TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                        height: 1.6,
                        color: const Color(0xFFFFFFFF),
                      ),
            ),
            suffixIcon ?? const SizedBox(),
            suffixIcon != null ? SizedBox(width: 4) : SizedBox(),
            // isRequireSuffixIcon
            //     ? SizedBox(
            //         width: padding4,
            //       )
            //     : SizedBox(),
          ],
        ),
      ),
      buttonColor ?? const Color(0xFF00C48C),
      onPress,
      isFuture,
      parameter,
      CupertinoActivityIndicator(color: const Color(0xFF4F008C)),
      16,
      true,
    );
  }
}
