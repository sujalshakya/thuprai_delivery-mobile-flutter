import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';
import 'package:thuprai_delivery/base/ui_toolkits/label_text.dart';
import 'package:thuprai_delivery/base/ui_toolkits/primary_appbar.dart';
import 'package:thuprai_delivery/ui/views/couriered/couriered_view.dart';
import 'package:thuprai_delivery/ui/views/dispatched/dispatched_view.dart';
import 'package:thuprai_delivery/ui/views/fulfilled/fulfilled_view.dart';
import 'package:thuprai_delivery/ui/views/pending/pending_view.dart';
import 'package:thuprai_delivery/ui/views/picking_up/picking_up_view.dart';
import 'package:thuprai_delivery/ui/views/processing/processing_view.dart';
import 'package:thuprai_delivery/ui/views/returned/returned_view.dart';
import 'home_viewmodel.dart';

class HomeView extends StackedView<HomeViewModel> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    HomeViewModel viewModel,
    Widget? child,
  ) {
    return DefaultTabController(
      length: 7,
      child: Scaffold(
          appBar: PrimaryAppBar(
            title: viewModel.currentTitle,
            actions: [
              IconButton(
                icon: Icon(
                  Icons.search,
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(
                  Icons.logout_outlined,
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
                onPressed: () {
                  viewModel.logout();
                },
              ),
              IconButton(
                icon: Icon(
                  Icons.qr_code_2_outlined,
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
                onPressed: () {},
              ),
            ],
          ),
          body: const TabBarView(
            physics: NeverScrollableScrollPhysics(),
            children: [
              DispatchedView(),
              PickingUpView(),
              ProcessingView(),
              PendingView(),
              ReturnedView(),
              CourieredView(),
              FulfilledView()
            ],
          ),
          bottomNavigationBar: Material(
            color: Theme.of(context).colorScheme.onPrimary,
            child: SizedBox(
              height: 50.h,
              child: TabBar(
                  onTap: (index) {
                    viewModel.setTitle(index);
                  },
                  dragStartBehavior: DragStartBehavior.start,
                  isScrollable: true,
                  labelStyle: const TextStyle(fontSize: 16),
                  indicator: const BoxDecoration(),
                  splashFactory: NoSplash.splashFactory,
                  labelColor: Theme.of(context).colorScheme.surface,
                  unselectedLabelColor:
                      Theme.of(context).colorScheme.onSecondary,
                  tabs: const [
                    PrimaryText(text: "Dispatched"),
                    PrimaryText(text: "Picking Up"),
                    PrimaryText(text: "Processing"),
                    PrimaryText(text: "Pending"),
                    PrimaryText(text: "Returned"),
                    PrimaryText(text: "Couriered"),
                    PrimaryText(text: "Fulfilled"),
                  ]),
            ),
          )),
    );
  }

  @override
  HomeViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      HomeViewModel();
}
