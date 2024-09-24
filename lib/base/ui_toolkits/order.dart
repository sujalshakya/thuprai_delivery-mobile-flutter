import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thuprai_delivery/base/ui_toolkits/label_text.dart';

class OrderListtile extends StatelessWidget {
  const OrderListtile(
      {super.key,
      required this.orderId,
      required this.paid,
      required this.address1,
      required this.address2,
      required this.name});
  final String orderId;
  final String paid;
  final String name;
  final String address1;
  final String address2;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              children: [
                PrimaryText(
                  text: "Order Id: #$orderId",
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
                const Spacer(),
                PrimaryText(
                  text: "Rs. $paid",
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                )
              ],
            ),
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    PrimaryText(
                      text: name,
                      color: Theme.of(context).colorScheme.onSecondary,
                      fontWeight: FontWeight.w700,
                    ),
                    SizedBox(
                        width: 200.w,
                        child: PrimaryText(text: "$address1, $address2")),
                  ],
                ),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircleAvatar(
                  backgroundColor: Colors.pink,
                  radius: 20,
                  child: Icon(Icons.phone,
                      color: Theme.of(context).colorScheme.surface),
                ),
              ),
            ],
          ),
          Divider(
            color: Theme.of(context).colorScheme.onSecondary,
          )
        ],
      ),
    );
  }
}
