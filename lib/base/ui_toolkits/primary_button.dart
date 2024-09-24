import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PrimaryButton extends StatelessWidget {
  /// Button with filled in colors.
  /// Requires [text] and [onTap].
  const PrimaryButton({super.key, required this.text, this.onTap, this.width});

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
                color: Theme.of(context).colorScheme.onPrimary,
                borderRadius: BorderRadius.circular(12)),
            child: Center(
                child: Text(
              text,
              style: TextStyle(color: Theme.of(context).colorScheme.surface),
            ))),
      ),
    );
  }
}
