import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
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
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: viewModel.isBusy
              ? Center(
                  child: CircularProgressIndicator(
                  color: Theme.of(context).colorScheme.onPrimary,
                ))
              : ListView.builder(
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
                            navigate: () {
                              viewModel.navigate(
                                  order, result.toStringAsFixed(2));
                            },
                            orderId: order.number!,
                            paid: true,
                            payment: result.toStringAsFixed(2),
                            name: order.shippingAddress!.firstName!,
                            address1: order.shippingAddress!.line1!,
                            address2: order.shippingAddress!.line4!,
                          )
                        : OrderListtile(
                            navigate: () {
                              viewModel.navigate(
                                  order, result.toStringAsFixed(2));
                            },
                            payment: result.toStringAsFixed(2),
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
  void onViewModelReady(DispatchedViewModel viewModel) =>
      SchedulerBinding.instance
          .addPostFrameCallback((timeStamp) => viewModel.getOrders());
  @override
  DispatchedViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      DispatchedViewModel();
}
