import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:stacked/stacked.dart';
import 'package:thuprai_delivery/base/model/order_model.dart';
import 'package:thuprai_delivery/base/ui_toolkits/filter_search.dart';
import 'package:thuprai_delivery/base/ui_toolkits/order_builder.dart';
import 'package:thuprai_delivery/base/ui_toolkits/primary_appbar.dart';

import 'processing_viewmodel.dart';

class ProcessingView extends StackedView<ProcessingViewModel> {
  const ProcessingView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    ProcessingViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      appBar: PrimaryAppBar(
        title: "Processing",
        actions: [
          IconButton(
            icon: Icon(
              Icons.search,
              color: Theme.of(context).colorScheme.onPrimary,
            ),
            onPressed: () => showSearch(
              context: context,
              delegate: search(viewModel, context, false),
            ),
          ),
          IconButton(
            icon: Icon(
              Icons.logout_outlined,
              color: Theme.of(context).colorScheme.onPrimary,
            ),
            onPressed: viewModel.logout,
          ),
          IconButton(
            icon: Icon(
              Icons.qr_code_2_outlined,
              color: Theme.of(context).colorScheme.onPrimary,
            ),
            onPressed: viewModel.barcode,
          ),
        ],
      ),
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: viewModel.isBusy
            ? Skeletonizer(
                child: OrderBuilder(
                  viewModel: viewModel,
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
              )
            : OrderBuilder(
                list: viewModel.orders,
                viewModel: viewModel,
              ),
      ),
    );
  }

  @override
  void onViewModelReady(ProcessingViewModel viewModel) =>
      SchedulerBinding.instance
          .addPostFrameCallback((timeStamp) => viewModel.getOrders());
  @override
  ProcessingViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      ProcessingViewModel();
}
