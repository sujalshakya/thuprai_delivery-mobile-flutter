import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:stacked/stacked.dart';
import 'package:thuprai_delivery/base/ui_toolkits/order.dart';
import 'package:thuprai_delivery/ui/views/couriered/couriered_viewmodel.dart';

class CourieredView extends StackedView<CourieredViewModel> {
  const CourieredView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    CourieredViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: viewModel.isBusy
              ? Center(
                  child: CircularProgressIndicator(
                  color: Theme.of(context).colorScheme.onPrimary,
                ))
              : ListView.builder(
                  itemCount: viewModel.orders.length,
                  itemBuilder: (context, index) {
                    final order = viewModel.orders[index];

                    /// Check if any payment has been made in advance.
                    String? payment = order.paymentEvents?.isNotEmpty == true
                        ? order.paymentEvents![0].amount
                        : '0';
                    double result =
                        viewModel.getFinalPrice(payment, order.totalInclTax);

                    /// Show paid if full price has already been paid.
                    return result == 0
                        ? OrderListtile(
                            navigate: () {
                              viewModel.navigate(
                                  order, result.toStringAsFixed(2));
                            },
                            call: () {
                              viewModel.call(
                                  phoneNumber:
                                      order.shippingAddress!.phoneNumber!);
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
                            call: () {
                              viewModel.call(
                                  phoneNumber:
                                      order.shippingAddress!.phoneNumber!);
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
  void onViewModelReady(CourieredViewModel viewModel) =>
      SchedulerBinding.instance
          .addPostFrameCallback((timeStamp) => viewModel.getOrders());
  @override
  CourieredViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      CourieredViewModel();
}
