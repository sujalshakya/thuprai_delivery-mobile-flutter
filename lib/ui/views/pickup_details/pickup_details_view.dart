import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'pickup_details_viewmodel.dart';

class PickupDetailsView extends StackedView<PickupDetailsViewModel> {
  const PickupDetailsView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    PickupDetailsViewModel viewModel,
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
  PickupDetailsViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      PickupDetailsViewModel();
}
