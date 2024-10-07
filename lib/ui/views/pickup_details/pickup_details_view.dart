import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:stacked/stacked.dart';
import 'package:thuprai_delivery/base/theme/theme.dart';
import 'package:thuprai_delivery/base/ui_toolkits/primary_text.dart';
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
        backgroundColor: ThemeClass().getSurfaceColor(context),
        appBar: PrimaryAppBar(
          title: "PickUp Details",
          center: true,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: ThemeClass().getOnPrimaryColor(context),
            ),
            onPressed: () {
              viewModel.leadingTap();
            },
          ),
        ),
        body: viewModel.isBusy
            ? Center(
                child: CircularProgressIndicator(
                  color: ThemeClass().getOnPrimaryColor(context),
                ),
              )
            : SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Center(
                        child: PrimaryText(
                          text: partner,
                          color: ThemeClass().getOnPrimaryColor(context),
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      ListView.builder(
                        shrinkWrap: true,
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
                                        onTap: () {
                                          viewModel.changePickupStatus(
                                              viewModel.books[index].id!);
                                        },
                                        text: "Mark as Picked Up"),
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                      viewModel.pickedup.isEmpty
                          ? const SizedBox.shrink()
                          : PrimaryContainer(
                              child: Column(
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Center(
                                        child: PrimaryText(
                                      text: "PickedUp books",
                                      fontSize: 18,
                                    )),
                                  ),
                                  ListView.builder(
                                      shrinkWrap: true,
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      itemCount: viewModel.pickedup.length,
                                      itemBuilder: (context, index) {
                                        return PrimaryText(
                                            text: viewModel
                                                .pickedup[index].title!);
                                      })
                                ],
                              ),
                            ),
                    ],
                  ),
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
