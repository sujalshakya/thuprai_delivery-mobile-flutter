import 'package:flutter/material.dart';
import 'package:thuprai_delivery/base/model/order_model.dart';
import 'package:thuprai_delivery/base/ui_toolkits/order.dart';
import 'package:thuprai_delivery/base/wrapper/base_viewmodel_wrapper.dart';

class OrderBuilder extends StatelessWidget {
  final BaseViewmodelWrapper viewModel;

  /// Navigation from Order Dispatch or not.
  final bool? orderDispatch;

  /// List of orders.
  final List<Order> list;

  const OrderBuilder(
      {super.key,
      required this.viewModel,
      required this.list,
      this.orderDispatch});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, index) {
          final order = list[index];

          /// Check if any payment has been made in advance.
          String? payment = order.paymentEvents?.isNotEmpty == true
              ? order.paymentEvents![0].amount
              : '0';
          double result = viewModel.getFinalPrice(payment, order.totalInclTax);

          /// Show paid if full price has already been paid.
          return OrderListtile(
            navigate: () {
              orderDispatch ?? false
                  ? viewModel.navigateToOrderDetailsView(
                      order, result.toString())
                  : viewModel.navigate(
                      order,
                      result.toString(),
                    );
            },
            call: () {
              viewModel.call(phoneNumber: order.shippingAddress!.phoneNumber!);
            },
            orderId: order.number!,
            paid: (result == 0.00 || result == 0.0) ? true : false,
            payment: result.toString(),
            name: order.shippingAddress?.firstName ?? "",
            address1: order.shippingAddress?.line1 ?? "",
            address2: order.shippingAddress?.line4 ?? "",
          );
        });
  }
}
