import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:stacked/stacked.dart';
import 'package:thuprai_delivery/base/model/order_model.dart';
import 'package:thuprai_delivery/base/ui_toolkits/label_text.dart';
import 'package:thuprai_delivery/base/ui_toolkits/primary_appbar.dart';
import 'package:thuprai_delivery/base/ui_toolkits/primary_button.dart';
import 'package:thuprai_delivery/base/ui_toolkits/primary_container.dart';
import 'package:thuprai_delivery/base/ui_toolkits/title_text.dart';

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
              PrimaryContainer(
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
              ),
              PrimaryContainer(
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
                            backgroundColor:
                                Theme.of(context).colorScheme.onSurface,
                            radius: 20,
                            child: Icon(Icons.location_on,
                                color: Theme.of(context).colorScheme.surface),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        PrimaryText(
                            text: order.shippingAddress?.phoneNumber ?? ""),
                        const Spacer(),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CircleAvatar(
                            backgroundColor:
                                Theme.of(context).colorScheme.onSurface,
                            radius: 20,
                            child: Icon(Icons.call,
                                color: Theme.of(context).colorScheme.surface),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CircleAvatar(
                            backgroundColor:
                                Theme.of(context).colorScheme.onSurface,
                            radius: 20,
                            child: Icon(Icons.message,
                                color: Theme.of(context).colorScheme.surface),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              PrimaryContainer(
                child: Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const TitleText(text: "Book Ordered"),
                      ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: order.lines?.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 200.w,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      children: [
                                        PrimaryText(
                                          text: "${order.lines![index].title}",
                                          fontWeight: FontWeight.w600,
                                        ),
                                        PrimaryText(
                                          text:
                                              "Quantity: ${order.lines![index].quantity}",
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onSecondary,
                                        )
                                      ],
                                    ),
                                  ),
                                  const Spacer(),
                                  PrimaryText(
                                    text:
                                        "${order.lines![index].unitPriceInclTax}",
                                    fontWeight: FontWeight.w600,
                                  )
                                ],
                              ),
                            );
                          }),
                      Row(
                        children: [
                          TitleText(
                              text: "Total",
                              color: Theme.of(context).colorScheme.onPrimary),
                          const Spacer(),
                          TitleText(
                              text: "Rs. ${order.totalInclTax}",
                              color: Theme.of(context).colorScheme.onPrimary)
                        ],
                      )
                    ],
                  ),
                ),
              ),
              orderDispatch ?? false
                  ? PrimaryButton(
                      text: "Delivered",
                      onTap: () {},
                    )
                  : const SizedBox.shrink(),
              orderDispatch ?? false
                  ? PrimaryButton(
                      text: "Returned",
                      onTap: () {},
                    )
                  : const SizedBox.shrink(),
            ],
          ),
        ));
  }

  @override
  OrderDetailsViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      OrderDetailsViewModel();
}
