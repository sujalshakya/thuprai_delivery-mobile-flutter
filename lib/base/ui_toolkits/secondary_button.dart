import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thuprai_delivery/base/theme/theme.dart';

class SecondaryButton extends StatelessWidget {
  /// Button without filled in color.
  /// Requires [text] and [onTap].
  const SecondaryButton(
      {super.key, required this.text, this.onTap, this.width});

  /// Text to be shown in button.
  final String text;

  /// Width of button
  final double? width;

  /// Funtion to be performed on button tap.
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: InkWell(
          onTap: onTap,
          child: Ink(
              width: width,
              height: 50.h,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                      color: ThemeClass().getOnPrimaryColor(context))),
              child: Center(
                  child: Text(
                text,
                style:
                    TextStyle(color: ThemeClass().getOnPrimaryColor(context)),
              ))),
        ));
  }
}
