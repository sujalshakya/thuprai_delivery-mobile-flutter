import 'package:flutter/material.dart';
import 'package:thuprai_delivery/base/theme/theme.dart';

class PrimaryTextfield extends StatelessWidget {
  /// The main textfield to be used in the app.
  /// requires [controller] .
  /// Does not require [hintText], [prefix] , [obscure], [keyboardType] and [suffix].
  const PrimaryTextfield(
      {super.key,
      required this.controller,
      this.hintText,
      this.prefix,
      this.keyboardType,
      this.suffix,
      this.obscure});

  /// The text that is inputted in the textfield.
  final TextEditingController controller;

  /// The text to be shown in textfield to tell user what to input.
  final String? hintText;

  /// Determine the text in textfield to be visible or not.
  final bool? obscure;

  /// The widget to be shown at the start of the textfield.
  final Widget? prefix;

  /// The widget shown at the end of textfield.
  final Widget? suffix;

  /// The type of keyboard to be shown.
  final TextInputType? keyboardType;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: SizedBox(
        child: TextField(
          keyboardType: keyboardType,
          controller: controller,
          obscureText: obscure ?? false,
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(color: ThemeClass().getOnPrimaryColor(context)),
                borderRadius: BorderRadius.circular(16)),
            focusedBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(color: ThemeClass().getOnPrimaryColor(context)),
                borderRadius: BorderRadius.circular(16)),
            hintText: hintText,
            hintStyle: TextStyle(color: ThemeClass().getPrimaryColor(context)),
            suffixIcon: suffix,
            suffixIconColor: ThemeClass().getOnPrimaryColor(context),
            prefixIcon: prefix,
            prefixIconColor: ThemeClass().getOnPrimaryColor(context),
          ),
        ),
      ),
    );
  }
}
