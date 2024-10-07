import 'package:flutter/material.dart';
import 'package:search_page/search_page.dart';
import 'package:thuprai_delivery/base/model/order_model.dart';
import 'package:thuprai_delivery/base/theme/theme.dart';
import 'package:thuprai_delivery/base/ui_toolkits/primary_text.dart';
import 'package:thuprai_delivery/base/ui_toolkits/order.dart';

/// Method of searching for orders.
/// Searches using orders name, address and number.
SearchPage<Order> search(viewModel, BuildContext context, bool orderDispatch) {
  return SearchPage<Order>(
      barTheme: ThemeClass().light,
      items: viewModel.orders,
      searchLabel: 'Search orders',
      searchStyle: TextStyle(color: ThemeClass().getOnPrimaryColor(context)),
      suggestion: const Center(
        child: PrimaryText(text: 'Filter orders by name, address or id'),
      ),
      failure: const Center(
        child: PrimaryText(text: 'No order found'),
      ),
      filter: (order) => [
            order.number,
            order.shippingAddress?.firstName,
            order.shippingAddress?.line1,
            order.shippingAddress?.line4,
          ],
      builder: (order) => OrderListtile(
            navigate: () {
              String? payment = order.paymentEvents?.isNotEmpty == true
                  ? order.paymentEvents![0].amount
                  : '0';
              double result =
                  viewModel.getFinalPrice(payment, order.totalInclTax);
              orderDispatch
                  ? viewModel.navigateToOrderDetailsView(
                      order, result.toString())
                  : viewModel.navigate(
                      order,
                      result.toString(),
                    );
            },
            call: () {
              viewModel.call(
                  phoneNumber: order.shippingAddress?.phoneNumber ?? "");
            },
            orderId: order.number ?? "",
            paid: false,
            payment: order.totalInclTax ?? "0",
            name: order.shippingAddress?.firstName ?? "",
            address1: order.shippingAddress?.line1 ?? "",
            address2: order.shippingAddress?.line4 ?? "",
          ));
}
