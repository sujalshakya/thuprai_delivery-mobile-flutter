import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thuprai_delivery/base/model/order_model.dart';
import 'package:thuprai_delivery/base/theme/theme.dart';
import 'package:thuprai_delivery/base/ui_toolkits/primary_text.dart';
import 'package:thuprai_delivery/base/ui_toolkits/primary_container.dart';
import 'package:thuprai_delivery/base/ui_toolkits/title_text.dart';
import 'package:thuprai_delivery/ui/views/order_details/order_details_viewmodel.dart';

class CustomerContainer extends StatelessWidget {
  /// The container containg information about the customer.
  /// Requires [order].
  const CustomerContainer({
    super.key,
    required this.vm,
    required this.order,
  });

  /// The details of the specific order.
  final Order order;

  /// Pass specific instance of viewmodel.
  final OrderDetailsViewModel vm;

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
              text: order.shippingAddress?.firstName ?? "",
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
                child: GestureDetector(
                  onTap: () {
                    vm.openMap("${order.shippingAddress?.line1}");
                  },
                  child: CircleAvatar(
                    backgroundColor: ThemeClass().getOnPrimaryColor(context),
                    radius: 20,
                    child: Icon(Icons.location_on,
                        color: ThemeClass().getSurfaceColor(context)),
                  ),
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
                child: GestureDetector(
                  onTap: () {
                    vm.call(
                        phoneNumber: "${order.shippingAddress?.phoneNumber}");
                  },
                  child: CircleAvatar(
                    backgroundColor: ThemeClass().getOnPrimaryColor(context),
                    radius: 20,
                    child: Icon(Icons.call,
                        color: ThemeClass().getSurfaceColor(context)),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: () {
                    vm.sms(
                        phoneNumber: order.shippingAddress?.phoneNumber ?? "");
                  },
                  child: CircleAvatar(
                    backgroundColor: ThemeClass().getOnPrimaryColor(context),
                    radius: 20,
                    child: Icon(Icons.message,
                        color: ThemeClass().getSurfaceColor(context)),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
