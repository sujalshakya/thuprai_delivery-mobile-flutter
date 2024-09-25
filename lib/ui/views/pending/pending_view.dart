import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:stacked/stacked.dart';
import 'package:thuprai_delivery/base/ui_toolkits/order.dart';

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
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: ListView.builder(
              itemCount: viewModel.orders.length,
              itemBuilder: (context, index) {
                final order = viewModel.orders[index];
                String? payment = order.paymentEvents?.isNotEmpty == true
                    ? order.paymentEvents![0].amount
                    : '0';

                String? price = order.totalInclTax;
                double result =
                    double.parse(price!) - double.parse(payment ?? '0');
                return result == 0
                    ? OrderListtile(
                        orderId: order.number!,
                        paid: true,
                        payment: order.totalInclTax!,
                        name: order.shippingAddress!.firstName!,
                        address1: order.shippingAddress!.line1!,
                        address2: order.shippingAddress!.line4!,
                      )
                    : OrderListtile(
                        payment: order.totalInclTax!,
                        orderId: order.number!,
                        paid: false,
                        name: order.shippingAddress!.firstName!,
                        address1: order.shippingAddress!.line1!,
                        address2: order.shippingAddress!.line4!,
                      );
              }),
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
