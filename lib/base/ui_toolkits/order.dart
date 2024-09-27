import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thuprai_delivery/base/ui_toolkits/label_text.dart';

class OrderListtile extends StatelessWidget {
  /// The list tile to be used to show the orders.
  /// Requires [orderId], [paid], [payment], [address1], [address2] and [name].
  /// Does not require [navigate].
  const OrderListtile(
      {super.key,
      required this.orderId,
      required this.paid,
      required this.payment,
      required this.address1,
      required this.address2,
      this.navigate,
      this.call,
      required this.name});

  /// The id of the order.
  final String orderId;

  /// The money left to be payed.
  final String payment;

  /// Whether the money has already been paid or not.
  final bool paid;

  /// The name of the customer.
  final String name;

  /// The first half of the address of delivery.
  final String address1;

  /// The second half of the address of delivery.
  final String address2;

  ///The function to call when icon is tapped.
  final Function()? call;

  /// to track from where order details is navigated from.
  final Function()? navigate;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: navigate,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
              child: Row(
                children: [
                  PrimaryText(
                    text: "Order Id: #$orderId",
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                  const Spacer(),
                  paid
                      ? PrimaryText(
                          text: "PAID",
                          fontSize: 16,
                          color: Theme.of(context).colorScheme.secondary,
                          fontWeight: FontWeight.w700,
                        )
                      : PrimaryText(
                          text: "Rs. $payment",
                          fontSize: 16,
                          color: Theme.of(context).colorScheme.primary,
                          fontWeight: FontWeight.w700,
                        )
                ],
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: SizedBox(
                    width: 200.w,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        PrimaryText(
                          text: name,
                          color: Theme.of(context).colorScheme.onSecondary,
                          fontWeight: FontWeight.w700,
                        ),
                        PrimaryText(text: "$address1, $address2"),
                      ],
                    ),
                  ),
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: call,
                    child: CircleAvatar(
                      backgroundColor: Theme.of(context).colorScheme.onSurface,
                      radius: 20,
                      child: Icon(Icons.phone,
                          color: Theme.of(context).colorScheme.surface),
                    ),
                  ),
                ),
              ],
            ),
            Divider(
              color: Theme.of(context).colorScheme.onSecondary,
            )
          ],
        ),
      ),
    );
  }
}
