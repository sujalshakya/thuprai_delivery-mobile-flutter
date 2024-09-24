import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';
import 'package:thuprai_delivery/base/ui_toolkits/label_text.dart';
import 'package:thuprai_delivery/base/ui_toolkits/primary_appbar.dart';
import 'package:thuprai_delivery/ui/views/dispatched/dispatched_view.dart';

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
            title: 'Dispatched',
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
          body: PageView(
            children: const [DispatchedView()],
          ),
          bottomNavigationBar: Material(
            color: Theme.of(context).colorScheme.onPrimary,
            child: SizedBox(
              height: 50.h,
              child: TabBar(
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
