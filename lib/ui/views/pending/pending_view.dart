import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'pending_viewmodel.dart';

class PendingView extends StackedView<PendingViewModel> {
  const PendingView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    PendingViewModel viewModel,
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
  PendingViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      PendingViewModel();
}
