import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';
import 'package:thuprai_delivery/base/theme/theme.dart';
import 'package:thuprai_delivery/base/ui_toolkits/primary_text.dart';
import 'package:thuprai_delivery/base/ui_toolkits/primary_appbar.dart';
import 'package:thuprai_delivery/ui/views/picking_up/widgets/pickup_skeleton.dart';

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
          actions: [
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
        body: viewModel.isBusy
            ? RefreshIndicator(
                onRefresh: () {
                  return viewModel.getOrders();
                },
                child: const PickUpSkeleton())
            : RefreshIndicator(
                onRefresh: () {
                  return viewModel.getOrders();
                },
                child: SingleChildScrollView(
                    physics: const AlwaysScrollableScrollPhysics(),
                    child: Column(children: [
                      Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16.0, vertical: 8),
                          child: ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              key: const Key("pickup"),
                              shrinkWrap: true,
                              itemCount: viewModel.partners.length,
                              itemBuilder: (context, i) {
                                final partner = viewModel.partners[i];
                                return GestureDetector(
                                    onTap: () {
                                      viewModel
                                          .navigateToPickupDetailsView(partner);
                                    },
                                    child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          PrimaryText(
                                            text: "Partner: $partner",
                                            color: ThemeClass()
                                                .getOnPrimaryColor(context),
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600,
                                          ),
                                          ListView.builder(
                                            physics:
                                                const NeverScrollableScrollPhysics(),
                                            shrinkWrap: true,
                                            itemCount: viewModel.lines.length,
                                            itemBuilder: (context, j) {
                                              final line = viewModel.lines[j];
                                              if (line.status == "Picking-Up") {
                                                if (line.partner == partner) {
                                                  return PrimaryText(
                                                      text:
                                                          "Book: ${line.title}");
                                                }
                                              }
                                              return const SizedBox.shrink();
                                            },
                                          ),
                                          Divider(
                                            color: ThemeClass()
                                                .getOnSecondaryColor(context),
                                          )
                                        ]));
                              })),
                      SizedBox(
                        height: 50.h,
                      )
                    ]))));
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
