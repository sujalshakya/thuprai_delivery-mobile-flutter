import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thuprai_delivery/base/model/order_model.dart';
import 'package:thuprai_delivery/base/ui_toolkits/label_text.dart';
import 'package:thuprai_delivery/base/ui_toolkits/primary_container.dart';
import 'package:thuprai_delivery/base/ui_toolkits/title_text.dart';

class CustomerContainer extends StatelessWidget {
  const CustomerContainer({
    super.key,
    required this.order,
  });

  final Order order;

  @override
  Widget build(BuildContext context) {
    return PrimaryContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TitleText(
            text: "Customer",
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: PrimaryText(
              text: order.shippingAddress!.firstName ?? "",
            ),
          ),
          Row(
            children: [
              SizedBox(
                width: 250.w,
                child: PrimaryText(
                    text:
                        "${order.shippingAddress?.line1 ?? ""}, ${order.shippingAddress?.line4 ?? ""}"),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircleAvatar(
                  backgroundColor: Theme.of(context).colorScheme.onSurface,
                  radius: 20,
                  child: Icon(Icons.location_on,
                      color: Theme.of(context).colorScheme.surface),
                ),
              ),
            ],
          ),
          Row(
            children: [
              PrimaryText(text: order.shippingAddress?.phoneNumber ?? ""),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircleAvatar(
                  backgroundColor: Theme.of(context).colorScheme.onSurface,
                  radius: 20,
                  child: Icon(Icons.call,
                      color: Theme.of(context).colorScheme.surface),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircleAvatar(
                  backgroundColor: Theme.of(context).colorScheme.onSurface,
                  radius: 20,
                  child: Icon(Icons.message,
                      color: Theme.of(context).colorScheme.surface),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
