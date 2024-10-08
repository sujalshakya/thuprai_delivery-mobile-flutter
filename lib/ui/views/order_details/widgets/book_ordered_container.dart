import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thuprai_delivery/base/model/order_model.dart';
import 'package:thuprai_delivery/base/theme/theme.dart';
import 'package:thuprai_delivery/base/ui_toolkits/primary_text.dart';
import 'package:thuprai_delivery/base/ui_toolkits/primary_container.dart';
import 'package:thuprai_delivery/base/ui_toolkits/title_text.dart';

class BookOrderedContainer extends StatelessWidget {
  /// The container containing information about the books being ordered.
  /// Requires [order].
  const BookOrderedContainer({
    super.key,
    required this.order,
  });

  /// The details of the specific order.
  final Order order;

  @override
  Widget build(BuildContext context) {
    return PrimaryContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TitleText(text: "Book Ordered"),
          ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: order.lines?.length ?? 0,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 200.w,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            PrimaryText(
                              text: order.lines![index].title ?? "",
                              fontWeight: FontWeight.w600,
                            ),
                            PrimaryText(
                              text:
                                  "Quantity: ${order.lines![index].quantity ?? ""}",
                              color: ThemeClass().getOnSecondaryColor(context),
                            )
                          ],
                        ),
                      ),
                      const Spacer(),
                      PrimaryText(
                        text:
                            "Rs. ${order.lines![index].linePriceInclTax ?? ""}",
                        fontWeight: FontWeight.w600,
                      )
                    ],
                  ),
                );
              }),
          Row(
            children: [
              TitleText(
                  text: "Total",
                  color: ThemeClass().getOnPrimaryColor(context)),
              const Spacer(),
              TitleText(
                  text: "Rs. ${order.totalInclTax}",
                  color: ThemeClass().getOnPrimaryColor(context))
            ],
          )
        ],
      ),
    );
  }
}
