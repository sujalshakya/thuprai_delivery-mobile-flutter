import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'returned_viewmodel.dart';

class ReturnedView extends StackedView<ReturnedViewModel> {
  const ReturnedView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    ReturnedViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Container(
        padding: const EdgeInsets.only(left: 25.0, right: 25.0),
      ),
    );
  }

  @override
  ReturnedViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      ReturnedViewModel();
}
