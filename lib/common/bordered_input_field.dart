import 'package:flutter/material.dart';

class BorderedInputField extends StatelessWidget {
  Key? textFormKey;
  FormFieldValidator<String>? validator;
  FocusNode? focusNode;
  ValueChanged<String>? onChanged;
  bool obscureText = false;
  bool readOnly = false;
  final TextEditingController? controller;
  GestureTapCallback? onTap;
  ValueChanged<String>? onFieldSubmitted;
  final TextStyle? hintStyle;
  final String? hintText;
  Widget? prefixIcon;
  TextDirection? textDirection;
  TextInputType? keyboardType;
  double? height;
  double? maxHeight;
  EdgeInsets margins;
  int? maxLines;
  bool? isDense;
  bool? expands;
  double? borderRadios;
  double? focusedBorderRadios;
  Widget? trailingWidget;
  final AutovalidateMode? autovalidateMode;
  final TextAlign? textAlign;
  final TextAlignVertical? textAlignVertical;

  BorderedInputField({
    this.textFormKey,
    this.validator,
    this.focusNode,
    this.onChanged,
    this.obscureText = false,
    this.controller,
    this.readOnly = false,
    this.onTap,
    this.onFieldSubmitted,
    this.hintStyle,
    this.hintText,
    this.prefixIcon,
    this.textDirection,
    this.keyboardType,
    this.height,
    this.maxHeight,
    this.margins = const EdgeInsets.all(3),
    this.maxLines,
    this.isDense = false,
    this.expands = false,
    this.borderRadios,
    this.focusedBorderRadios,
    this.autovalidateMode,
    this.trailingWidget,
    this.textAlign,
    this.textAlignVertical,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    OutlineInputBorder outlineInputBorder = OutlineInputBorder(
      borderSide: BorderSide(width: 1, color: const Color(0x807A869A)),
      borderRadius: BorderRadius.circular(borderRadios ?? 12),
    );
    InputDecoration decoration = InputDecoration(
      // Hint
      hintText: hintText,
      hintTextDirection: TextDirection.ltr,
      hintStyle: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.bold,
        height: 1.6,
        color: const Color(0x807A869A),
      ),
      isDense: isDense ?? true,

      // focusedBorder
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(width: 1, color: const Color(0xFF00C48C)),
        borderRadius: BorderRadius.circular(focusedBorderRadios ?? 12),
      ),
      // Border
      border: outlineInputBorder,
      enabledBorder: outlineInputBorder,

      constraints: BoxConstraints(
        minHeight: height ?? 0.0,
        maxHeight: maxHeight ?? double.infinity,
      ),
    );

    return Container(
      // decoration: BoxDecoration(
      //   borderRadius: BorderRadius.circular(
      //     radius12,
      //   ),
      //   color: theme.theme.transparent,
      //   border: Border.all(
      //     width: appSize1,
      //     color: theme.theme.secondaryColor
      //   ),
      // ),
      child: TextFormField(
        key: textFormKey,
        maxLines: maxLines,
        autovalidateMode:
            autovalidateMode ?? AutovalidateMode.onUserInteraction,
        keyboardType: keyboardType,
        textDirection: textDirection,
        validator: validator,
        focusNode: focusNode,
        obscureText: obscureText,
        readOnly: readOnly,
        controller: controller,
        onFieldSubmitted: onFieldSubmitted,
        onTap: onTap,
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          height: 1,
          color: const Color(0xFF061941),
        ),
        decoration: decoration,
        textAlign: textAlign ?? TextAlign.start,
        textAlignVertical: textAlignVertical,
        expands: expands ?? false,
        // decoration: InputDecoration(
        //   isDense: isDense,
        //   constraints: BoxConstraints(minHeight: height ?? 44),
        //   prefixIcon: prefixIcon,
        //   hintText: hintText,
        //   hintStyle: theme.theme.secondary16,
        //   contentPadding:
        //       const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
        //   filled: true,
        //   fillColor: theme.theme.bgPrimaryColor,
        //   border: OutlineInputBorder(
        //       borderSide: BorderSide.none,
        //       borderRadius: BorderRadius.circular(radius12)),
        // ),
        onChanged: onChanged,
      ),
    );
  }
}
