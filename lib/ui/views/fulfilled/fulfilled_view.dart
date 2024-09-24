import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'fulfilled_viewmodel.dart';

class FulfilledView extends StackedView<FulfilledViewModel> {
  const FulfilledView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    FulfilledViewModel viewModel,
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
  FulfilledViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      FulfilledViewModel();
}
