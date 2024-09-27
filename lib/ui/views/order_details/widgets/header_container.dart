import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:thuprai_delivery/base/model/order_model.dart';
import 'package:thuprai_delivery/base/ui_toolkits/label_text.dart';
import 'package:thuprai_delivery/base/ui_toolkits/primary_container.dart';
import 'package:thuprai_delivery/base/ui_toolkits/title_text.dart';

class HeaderContainer extends StatelessWidget {
  const HeaderContainer({
    super.key,
    required this.order,
    required this.price,
  });

  final Order order;
  final String price;

  @override
  Widget build(BuildContext context) {
    return PrimaryContainer(
      child: Column(
        children: [
          Row(
            children: [
              TitleText(text: "Order Id: ${order.number}"),
              const Spacer(),
              price == "0.0"
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
              PrimaryText(text: "Quantity: ${order.lines!.length}")
            ],
          )
        ],
      ),
    );
  }
}
