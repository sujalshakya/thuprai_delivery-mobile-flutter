import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'picking_up_viewmodel.dart';

class PickingUpView extends StackedView<PickingUpViewModel> {
  const PickingUpView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    PickingUpViewModel viewModel,
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
  PickingUpViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      PickingUpViewModel();
}
