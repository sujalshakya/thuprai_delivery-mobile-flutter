import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:thuprai_delivery/base/ui_toolkits/label_text.dart';
import 'package:thuprai_delivery/base/ui_toolkits/primary_appbar.dart';
import 'package:thuprai_delivery/base/ui_toolkits/primary_container.dart';
import 'package:thuprai_delivery/base/ui_toolkits/title_text.dart';

import 'order_details_viewmodel.dart';

class OrderDetailsView extends StackedView<OrderDetailsViewModel> {
  const OrderDetailsView({Key? key}) : super(key: key);

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
            onPressed: () {},
          ),
        ),
        body: Column(
          children: [
            const PrimaryContainer(
              child: Column(
                children: [
                  Row(
                    children: [
                      TitleText(text: "Order Id:"),
                      Spacer(),
                      TitleText(text: "Rs.")
                    ],
                  ),
                  Row(
                    children: [
                      PrimaryText(text: "date"),
                      Spacer(),
                      PrimaryText(text: "Quantity")
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
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 8),
                    child: PrimaryText(
                      text: "Name",
                    ),
                  ),
                  Row(
                    children: [
                      const PrimaryText(text: "Address"),
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
                      const PrimaryText(text: "phone"),
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const TitleText(text: "Book Ordered"),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            PrimaryText(text: "book name"),
                            PrimaryText(text: "Quantity")
                          ],
                        ),
                        Spacer(),
                        PrimaryText(
                          text: "Rs.",
                        )
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      TitleText(
                          text: "Total",
                          color: Theme.of(context).colorScheme.onPrimary),
                      const Spacer(),
                      TitleText(
                          text: "Rs.",
                          color: Theme.of(context).colorScheme.onPrimary)
                    ],
                  )
                ],
              ),
            )
          ],
        ));
  }

  @override
  OrderDetailsViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      OrderDetailsViewModel();
}
