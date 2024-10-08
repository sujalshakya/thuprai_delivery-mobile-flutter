import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:thuprai_delivery/base/theme/theme.dart';
import 'package:thuprai_delivery/base/ui_toolkits/primary_text.dart';

class OrderListtile extends StatelessWidget {
  /// The list tile to be used to show the orders.
  /// Requires [orderId], [paid], [payment], [address1], [address2] and [name].
  /// Does not require [navigate] and [call].
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
    return InkWell(
      key: const Key("OrderList"),
      onTap: navigate,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: PrimaryText(
                      text: "Order Id: #$orderId",
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w700,
                      color: ThemeClass().getOnPrimaryColor(context),
                    ),
                  ),
                  paid
                      ? PrimaryText(
                          text: "PAID",
                          fontSize: 16.sp,
                          color: ThemeClass().getSecondaryColor(context),
                          fontWeight: FontWeight.w700,
                        )
                      : Expanded(
                          flex: 0,
                          child: PrimaryText(
                            text: "Rs. $payment",
                            fontSize: 16.sp,
                            color: ThemeClass().getPrimaryColor(context),
                            fontWeight: FontWeight.w700,
                          ),
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
                          color: ThemeClass().getOnSecondaryColor(context),
                          fontWeight: FontWeight.w700,
                        ),
                        PrimaryText(text: "$address1, $address2"),
                      ],
                    ),
                  ),
                ),
                const Spacer(),
                Skeleton.ignore(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: call,
                      child: CircleAvatar(
                        backgroundColor:
                            ThemeClass().getOnPrimaryColor(context),
                        radius: 20,
                        child: Icon(Icons.phone,
                            color: ThemeClass().getSurfaceColor(context)),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Divider(
              color: ThemeClass().getOnSecondaryColor(context),
            )
          ],
        ),
      ),
    );
  }
}
