import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:thuprai_delivery/base/ui_toolkits/order.dart';

import 'dispatched_viewmodel.dart';

class DispatchedView extends StackedView<DispatchedViewModel> {
  const DispatchedView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    DispatchedViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,
        body: const Column(
          children: [
            OrderListtile(
              name: "Sujal sh",
              orderId: 50,
              paid: 'Paid',
            ),
            OrderListtile(
              name: "Sujal sh",
              orderId: 50,
              paid: 'Paid',
            ),
            OrderListtile(
              name: "Sujal sh",
              orderId: 50,
              paid: 'Paid',
            ),
            OrderListtile(
              name: "Sujal sh",
              orderId: 50,
              paid: 'Paid',
            )
          ],
        ));
  }

  @override
  DispatchedViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      DispatchedViewModel();
}
