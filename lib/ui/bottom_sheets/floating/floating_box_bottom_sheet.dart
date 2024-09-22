import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:thuprai_delivery/base/ui_toolkits/label_text.dart';
import 'package:thuprai_delivery/base/ui_toolkits/logo.dart';
import 'package:thuprai_delivery/ui/bottom_sheets/floating/floating_box_model.dart';

class FloatingBoxBottomSheet extends StackedView<FloatingBoxModel> {
  final Function(SheetResponse) completer;
  final SheetRequest request;
  const FloatingBoxBottomSheet({
    Key? key,
    required this.completer,
    required this.request,
  }) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    FloatingBoxModel viewModel,
    Widget? child,
  ) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Logo(height: 40.h, width: 40.w),
                  ],
                ),
                PrimaryText(
                  text: request.description!,
                  softWrap: true,
                  maxLines: 3,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  FloatingBoxModel viewModelBuilder(BuildContext context) => FloatingBoxModel();
}
