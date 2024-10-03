import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:stacked/stacked.dart';
import 'package:thuprai_delivery/base/ui_toolkits/label_text.dart';
import 'package:thuprai_delivery/base/ui_toolkits/primary_appbar.dart';

import 'picking_up_viewmodel.dart';

class PickingUpView extends StackedView<PickingUpViewModel> {
  const PickingUpView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    PickingUpViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      appBar: PrimaryAppBar(
        title: "Picking Up",
        logout: viewModel.logout,
      ),
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: viewModel.isBusy
          ? Skeletonizer(
              child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: PrimaryText(
                              text: "PickingUpViewModel",
                            ),
                          ),
                          PrimaryText(
                            text: "PickingUpViewModel lckingUpViewModel",
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Divider()
                        ]);
                  }),
            ))
          : SingleChildScrollView(
              child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
                  child: ListView.builder(
                    key: const Key("pickup"),
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: viewModel.partners.length,
                    itemBuilder: (context, i) {
                      final partner = viewModel.partners[i];

                      return GestureDetector(
                        onTap: () {
                          viewModel.navigateToPickupDetailsView(partner);
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            PrimaryText(
                              text: "Partner: $partner",
                              color: Theme.of(context).colorScheme.onPrimary,
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                            ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: viewModel.lines.length,
                              itemBuilder: (context, j) {
                                final line = viewModel.lines[j];
                                if (line.status == "Picking-Up") {
                                  if (line.partner == partner) {
                                    return PrimaryText(
                                        text: "Book: ${line.title}");
                                  }
                                }
                                return const SizedBox.shrink();
                              },
                            ),
                            Divider(
                              color: Theme.of(context).colorScheme.onSecondary,
                            )
                          ],
                        ),
                      );
                    },
                  )),
            ),
    );
  }

  @override
  void onViewModelReady(PickingUpViewModel viewModel) =>
      SchedulerBinding.instance
          .addPostFrameCallback((timeStamp) => viewModel.getOrders());

  @override
  PickingUpViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      PickingUpViewModel();
}
