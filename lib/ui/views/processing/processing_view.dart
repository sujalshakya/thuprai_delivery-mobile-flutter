import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'processing_viewmodel.dart';

class ProcessingView extends StackedView<ProcessingViewModel> {
  const ProcessingView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    ProcessingViewModel viewModel,
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
  ProcessingViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      ProcessingViewModel();
}
