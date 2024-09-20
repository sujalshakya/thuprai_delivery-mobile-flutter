import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class UiToolkitsViewModel extends BaseViewModel {
  bool passwordVisible = true;
  late Icon suffixIcon;
  suffixIconTap() {
    passwordVisible = !passwordVisible;
    suffixIcon = passwordVisible
        ? const Icon(Icons.visibility)
        : const Icon(Icons.visibility_off);
    rebuildUi();
  }
}
