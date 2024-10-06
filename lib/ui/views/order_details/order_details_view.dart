import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:stacked/stacked.dart';
import 'package:thuprai_delivery/base/model/order_model.dart';
import 'package:thuprai_delivery/base/ui_toolkits/primary_appbar.dart';
import 'package:thuprai_delivery/base/ui_toolkits/primary_button.dart';
import 'package:thuprai_delivery/ui/views/order_details/widgets/book_ordered_container.dart';
import 'package:thuprai_delivery/ui/views/order_details/widgets/customer_container.dart';
import 'package:thuprai_delivery/ui/views/order_details/widgets/header_container.dart';

import 'order_details_viewmodel.dart';

class OrderDetailsView extends StackedView<OrderDetailsViewModel> {
  final Order order;
  final String price;
  final bool? orderDispatch;
  const OrderDetailsView(
      {Key? key, this.orderDispatch, required this.order, required this.price})
      : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    OrderDetailsViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,
        appBar: PrimaryAppBar(
          title: "Order Details",
          center: true,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Theme.of(context).colorScheme.onPrimary,
            ),
            onPressed: () {
              viewModel.leadingTap();
            },
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              HeaderContainer(order: order, price: price, vm: viewModel),
              CustomerContainer(order: order, vm: viewModel),
              BookOrderedContainer(order: order),
              orderDispatch ?? false
                  ? PrimaryButton(
                      text: "Delivered",
                      onTap: () {
                        viewModel.changeOrderStatus(
                            order.id.toString(), "delivered");
                      },
                    )
                  : const SizedBox.shrink(),
              orderDispatch ?? false
                  ? PrimaryButton(
                      text: "Returned",
                      onTap: () {
                        viewModel.changeOrderStatus(
                            order.id.toString(), "returned");
                      },
                    )
                  : const SizedBox.shrink(),
            ],
          ),
        ));
  }

  @override
  void onViewModelReady(OrderDetailsViewModel viewModel) =>
      SchedulerBinding.instance
          .addPostFrameCallback((timeStamp) => viewModel.getQuanity());
  @override
  OrderDetailsViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      OrderDetailsViewModel(order);
}
