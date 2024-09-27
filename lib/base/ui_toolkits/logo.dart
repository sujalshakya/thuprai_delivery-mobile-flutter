import 'package:flutter/material.dart';
import 'package:thuprai_delivery/base/common/assets.dart';

class Logo extends StatelessWidget {
  /// Logo of the app.
  const Logo({
    super.key,
    required this.height,
    required this.width,
  });

  /// Height of logo.
  final double height;

  /// Width of logo.
  final double width;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Image(
          image: const AssetImage(Assets.logo),
          width: width,
          height: height,
        ),
      ),
    );
  }
}
