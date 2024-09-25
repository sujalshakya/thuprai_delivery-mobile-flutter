import 'package:flutter/material.dart';
import 'package:thuprai_delivery/base/ui_toolkits/label_text.dart';

class PickupTileWidget extends StatelessWidget {
  const PickupTileWidget(
      {super.key, required this.partner, this.book1, this.book3, this.book2});
  final String partner;
  final String? book1;
  final String? book2;
  final String? book3;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PrimaryText(
            text: "Partner: $partner",
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: Theme.of(context).colorScheme.onPrimary,
          ),
          PrimaryText(text: "Book: $book1"),
        ],
      ),
    );
  }
}
