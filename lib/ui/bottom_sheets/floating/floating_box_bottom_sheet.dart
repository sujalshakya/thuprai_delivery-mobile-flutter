import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:thuprai_delivery/base/ui_toolkits/logo.dart';
import 'package:thuprai_delivery/ui/bottom_sheets/floating/floating_box_model.dart';

class FloatingBoxBottomSheet extends StatelessWidget {
  final SheetRequest request;
  final Function(SheetResponse)? completer;
  const FloatingBoxBottomSheet({
    Key? key,
    required this.request,
    required this.completer,
  }) : super(key: key);

  FloatingBoxModel viewModelBuilder(BuildContext context) => FloatingBoxModel();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Container(
        width: 250.w,
        height: 90.h,
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
                Logo(height: 40.h, width: 40.w),
                Text(request.description!)
              ],
            ),
          ],
        ),
      ),
    );
  }
}
