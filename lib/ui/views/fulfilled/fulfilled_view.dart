import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stacked/stacked.dart';
import 'package:thuprai_delivery/base/theme/theme.dart';
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
      backgroundColor: ThemeClass().getSurfaceColor(context),
      body: Container(
        padding: const EdgeInsets.only(left: 25.0, right: 25.0),
        child: appFlavor == "staging"
            ? const Center(child: Text("Staging"))
            : const Center(child: Text("Development")),
      ),
    );
  }

  @override
  FulfilledViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      FulfilledViewModel();
}
