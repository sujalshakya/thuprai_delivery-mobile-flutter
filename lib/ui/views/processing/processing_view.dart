import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:stacked/stacked.dart';
import 'package:thuprai_delivery/base/ui_toolkits/order.dart';

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
        body: ListView.builder(
            itemCount: viewModel.orders.length,
            itemBuilder: (context, index) {
              final order = viewModel.orders[index];

              return OrderListtile(
                orderId: order.number,
                paid: order.totalInclTax,
                name: order.shippingAddress.firstName,
                address1: order.shippingAddress.line1,
                address2: order.shippingAddress.line4,
              );
            }));
  }

  @override
  void onViewModelReady(ProcessingViewModel viewModel) =>
      SchedulerBinding.instance
          .addPostFrameCallback((timeStamp) => viewModel.getOrders());
  @override
  ProcessingViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      ProcessingViewModel();
}
