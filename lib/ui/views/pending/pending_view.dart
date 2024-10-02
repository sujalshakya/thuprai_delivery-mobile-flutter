import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:stacked/stacked.dart';
import 'package:thuprai_delivery/base/model/order_model.dart';
import 'package:thuprai_delivery/base/ui_toolkits/order_builder.dart';

import 'pending_viewmodel.dart';

class PendingView extends StackedView<PendingViewmodel> {
  const PendingView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    PendingViewmodel viewModel,
    Widget? child,
  ) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: viewModel.isBusy
              ? Skeletonizer(
                  child: OrderBuilder(
                    viewModel: viewModel,
                    list: List.filled(
                        8,
                        Order(
                            number: '123',
                            totalInclTax: "145",
                            shippingAddress: ShippingAddress(
                                line1: "totalInclTax totalInclTax",
                                line4: "totalInclTax",
                                firstName: "totalInclTax"),
                            paymentEvents: [PaymentEvent(amount: "33")])),
                  ),
                )
              : OrderBuilder(
                  list: viewModel.orders,
                  viewModel: viewModel,
                ),
        ));
  }

  @override
  void onViewModelReady(PendingViewmodel viewModel) => SchedulerBinding.instance
      .addPostFrameCallback((timeStamp) => viewModel.getOrders());

  @override
  PendingViewmodel viewModelBuilder(
    BuildContext context,
  ) =>
      PendingViewmodel();
}
