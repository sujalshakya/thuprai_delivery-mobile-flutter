import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:thuprai_delivery/base/model/order_model.dart';
import 'package:thuprai_delivery/base/ui_toolkits/primary_text.dart';
import 'package:thuprai_delivery/base/ui_toolkits/primary_container.dart';
import 'package:thuprai_delivery/base/ui_toolkits/title_text.dart';
import 'package:thuprai_delivery/ui/views/order_details/order_details_viewmodel.dart';

class HeaderContainer extends StatelessWidget {
  /// The first container in the order details page.
  /// Requires [order] and [price].
  const HeaderContainer(
      {super.key, required this.order, required this.price, required this.vm});

  /// The details of the specific order.
  final Order order;
  final OrderDetailsViewModel vm;

  /// The price of the order after substracting advance from total price.
  final String price;

  @override
  Widget build(BuildContext context) {
    return PrimaryContainer(
      child: Column(
        children: [
          Row(
            children: [
              TitleText(text: "Order Id: #${order.number}"),
              const Spacer(),
              price == "0.00" || price == "0.0"
                  ? PrimaryText(
                      text: "PAID",
                      fontSize: 16,
                      color: Theme.of(context).colorScheme.secondary,
                      fontWeight: FontWeight.w700,
                    )
                  : TitleText(text: "Rs.$price")
            ],
          ),
          Row(
            children: [
              PrimaryText(
                  text: DateFormat('kk:mm - EEE, dd MMM ')
                      .format(order.datePlaced!)),
              const Spacer(),
              PrimaryText(text: "Quantity: ${vm.quantity}")
            ],
          )
        ],
      ),
    );
  }
}
