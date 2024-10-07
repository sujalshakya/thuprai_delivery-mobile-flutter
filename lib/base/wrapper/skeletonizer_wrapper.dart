import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class SkeletonizerWrapper {
  skeletonizer(Widget child) {
    return Skeletonizer(child: child);
  }
}
