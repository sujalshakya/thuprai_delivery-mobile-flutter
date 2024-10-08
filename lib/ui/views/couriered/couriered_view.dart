import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:stacked/stacked.dart';
import 'package:thuprai_delivery/base/theme/theme.dart';
import 'package:thuprai_delivery/base/ui_toolkits/filter_search.dart';
import 'package:thuprai_delivery/base/ui_toolkits/order_builder.dart';
import 'package:thuprai_delivery/base/ui_toolkits/order_skeletion.dart';
import 'package:thuprai_delivery/base/ui_toolkits/primary_appbar.dart';
import 'package:thuprai_delivery/ui/views/couriered/couriered_viewmodel.dart';

class CourieredView extends StackedView<CourieredViewModel> {
  const CourieredView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    CourieredViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
        appBar: PrimaryAppBar(
          title: "Couriered",
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
          child: viewModel.isBusy
              ? const OrderSkeleton()
              : RefreshIndicator(
                  onRefresh: () {
                    return viewModel.getOrders();
                  },
                  child: OrderBuilder(
                    list: viewModel.orders,
                    viewModel: viewModel,
                  ),
                ),
        ));
  }

  @override
  void onViewModelReady(CourieredViewModel viewModel) =>
      SchedulerBinding.instance
          .addPostFrameCallback((timeStamp) => viewModel.getOrders());
  @override
  CourieredViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      CourieredViewModel();
}
