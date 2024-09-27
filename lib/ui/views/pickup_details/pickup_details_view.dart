import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:stacked/stacked.dart';
import 'package:thuprai_delivery/base/ui_toolkits/label_text.dart';
import 'package:thuprai_delivery/base/ui_toolkits/primary_appbar.dart';
import 'package:thuprai_delivery/base/ui_toolkits/primary_button.dart';
import 'package:thuprai_delivery/base/ui_toolkits/primary_container.dart';
import 'pickup_details_viewmodel.dart';

class PickupDetailsView extends StackedView<PickupDetailsViewModel> {
  final String partner;
  const PickupDetailsView({Key? key, required this.partner}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    PickupDetailsViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,
        appBar: PrimaryAppBar(
          title: "PickUp Details",
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
        body: viewModel.isBusy
            ? Center(
                child: CircularProgressIndicator(
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
              )
            : Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Center(
                      child: PrimaryText(
                        text: partner,
                        color: Theme.of(context).colorScheme.onPrimary,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: viewModel.books.length,
                        itemBuilder: (context, index) {
                          return PrimaryContainer(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  PrimaryText(
                                      text:
                                          "Book: ${viewModel.books[index].title}"),
                                  PrimaryText(
                                      text:
                                          "Quantity: ${viewModel.books[index].quantity}"),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: PrimaryButton(
                                        onTap: () {},
                                        text: "Mark as Picked Up"),
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    )
                  ],
                ),
              ));
  }

  @override
  void onViewModelReady(PickupDetailsViewModel viewModel) =>
      SchedulerBinding.instance
          .addPostFrameCallback((timeStamp) => viewModel.getOrders(partner));
  @override
  PickupDetailsViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      PickupDetailsViewModel(partner: partner);
}
