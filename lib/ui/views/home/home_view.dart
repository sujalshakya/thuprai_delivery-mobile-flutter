import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';
import 'package:thuprai_delivery/base/ui_toolkits/label_text.dart';

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
          body: PageView(),
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
                  labelColor: Theme.of(context).colorScheme.secondary,
                  unselectedLabelColor:
                      Theme.of(context).colorScheme.onSecondary,
                  tabs: const [
                    PrimaryText(text: "Dispatched"),
                    PrimaryText(text: "Pending"),
                    PrimaryText(text: "Fulfilled"),
                    PrimaryText(text: "Returned"),
                    PrimaryText(text: "Processing"),
                    PrimaryText(text: "Picking Up"),
                    PrimaryText(text: "Couriered"),
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
