import 'package:flutter/material.dart';
import 'package:thuprai_delivery/base/model/order_model.dart';
import 'package:thuprai_delivery/base/ui_toolkits/order_builder.dart';
import 'package:thuprai_delivery/base/wrapper/skeletonizer_wrapper.dart';
import 'package:thuprai_delivery/ui/views/dispatched/dispatched_viewmodel.dart';

class OrderSkeleton extends StatelessWidget {
  /// Skeleton loader to replace circular progress indicator.
  const OrderSkeleton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SkeletonizerWrapper().skeletonizer(
      OrderBuilder(
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
