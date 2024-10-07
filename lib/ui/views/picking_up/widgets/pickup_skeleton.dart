import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thuprai_delivery/base/ui_toolkits/primary_text.dart';
import 'package:thuprai_delivery/base/wrapper/skeletonizer_wrapper.dart';

class PickUpSkeleton extends StatelessWidget {
  const PickUpSkeleton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SkeletonizerWrapper().skeletonizer(Padding(
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
    ));
  }
}
