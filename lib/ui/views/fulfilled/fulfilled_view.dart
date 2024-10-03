import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:thuprai_delivery/base/ui_toolkits/primary_appbar.dart';

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
      appBar: const PrimaryAppBar(
        title: "Fulfilled",
      ),
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
