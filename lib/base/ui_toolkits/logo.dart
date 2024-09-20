import 'package:flutter/material.dart';
import 'package:thuprai_delivery/ui/common/assets.dart';

class Logo extends StatelessWidget {
  const Logo({
    super.key,
    required this.height,
    required this.width,
  });
  final double height;
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
