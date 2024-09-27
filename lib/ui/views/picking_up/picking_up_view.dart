import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:stacked/stacked.dart';
import 'package:thuprai_delivery/ui/views/picking_up/widget/pickup_tile_widget.dart';

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
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
        child: viewModel.isBusy
            ? Center(
                child: CircularProgressIndicator(
                color: Theme.of(context).colorScheme.onPrimary,
              ))
            : ListView.builder(
                shrinkWrap: true,
                itemCount: viewModel.orders.length,
                itemBuilder: (context, i) {
                  final order = viewModel.orders[i];

                  return Column(
                    children: [
                      ListView.builder(
                        shrinkWrap: true,
                        itemCount: order.lines.length,
                        itemBuilder: (context, j) {
                          final line = order.lines[j];
                          if (line.status == "Picking-Up") {
                            return PickupTileWidget(
                              partner: line.partner,
                              book1: line.title,
                            );
                          }
                          return const SizedBox.shrink();
                        },
                      ),
                      Divider(
                        color: Theme.of(context).colorScheme.onSecondary,
                      )
                    ],
                  );
                },
              ),
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
