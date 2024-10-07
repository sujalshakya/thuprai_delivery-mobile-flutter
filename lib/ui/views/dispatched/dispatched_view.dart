import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:stacked/stacked.dart';
import 'package:thuprai_delivery/base/theme/theme.dart';
import 'package:thuprai_delivery/base/ui_toolkits/filter_search.dart';
import 'package:thuprai_delivery/base/ui_toolkits/order_builder.dart';
import 'package:thuprai_delivery/base/ui_toolkits/order_skeletion.dart';
import 'package:thuprai_delivery/base/ui_toolkits/primary_appbar.dart';

import 'dispatched_viewmodel.dart';

class DispatchedView extends StackedView<DispatchedViewModel> {
  const DispatchedView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    DispatchedViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      appBar: PrimaryAppBar(
        title: "Dispatched",
        actions: [
          IconButton(
            icon: Icon(
              Icons.search,
              color: ThemeClass().getOnPrimaryColor(context),
            ),
            onPressed: () => showSearch(
              context: context,
              delegate: search(viewModel, context, false),
            ),
          ),
          IconButton(
            icon: Icon(
              Icons.logout_outlined,
              color: ThemeClass().getOnPrimaryColor(context),
            ),
            onPressed: viewModel.logout,
          ),
          IconButton(
            icon: Icon(
              Icons.qr_code_2_outlined,
              color: ThemeClass().getOnPrimaryColor(context),
            ),
            onPressed: viewModel.tapOnBarcode,
          ),
        ],
      ),
      backgroundColor: ThemeClass().getSurfaceColor(context),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: RefreshIndicator(
          onRefresh: () {
            return viewModel.getOrders();
          },
          child: viewModel.isBusy
              ? const OrderSkeleton()
              : OrderBuilder(
                  orderDispatch: true,
                  list: viewModel.orders,
                  viewModel: viewModel,
                ),
        ),
      ),
    );
  }

  @override
  void onViewModelReady(DispatchedViewModel viewModel) =>
      SchedulerBinding.instance
          .addPostFrameCallback((timeStamp) => viewModel.getOrders());
  @override
  DispatchedViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      DispatchedViewModel();
}
