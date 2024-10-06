import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:thuprai_delivery/base/model/order_model.dart';
import 'package:thuprai_delivery/base/ui_toolkits/order_builder.dart';
import 'package:thuprai_delivery/ui/views/dispatched/dispatched_viewmodel.dart';

class OrderSkeleton extends StatelessWidget {
  const OrderSkeleton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      child: OrderBuilder(
        viewModel: DispatchedViewModel(),
        list: List.filled(
            8,
            Order(
                number: '123',
                totalInclTax: "145",
                shippingAddress: ShippingAddress(
                    line1: "totalInclTax totalInclTax",
                    line4: "totalInclTax",
                    firstName: "totalInclTax"),
                paymentEvents: [PaymentEvent(amount: "33")])),
      ),
    );
  }
}
