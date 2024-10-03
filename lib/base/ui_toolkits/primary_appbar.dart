import 'package:flutter/material.dart';
import 'package:thuprai_delivery/base/ui_toolkits/label_text.dart';

class PrimaryAppBar extends StatelessWidget implements PreferredSizeWidget {
  /// the primary app bar.
  /// Requires [title].
  /// Not required [leading], [center], [actions].
  const PrimaryAppBar(
      {super.key,
      this.leading,
      required this.title,
      this.center,
      this.logout,
      this.search});

  /// The start of the app bar, can be any widget.
  final Widget? leading;

  /// Whether title is to be at center.
  final bool? center;

  /// The title of the appbar and the view.
  final String title;

  final Function()? logout;

  final Function()? search;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      shadowColor: Theme.of(context).colorScheme.primary,
      centerTitle: center,
      elevation: 4,
      leading: leading,
      backgroundColor: Theme.of(context).colorScheme.surface,
      title: Padding(
        padding: const EdgeInsets.all(8.0),
        child: PrimaryText(
          text: title,
          color: Theme.of(context).colorScheme.onPrimary,
        ),
      ),
      actions: [
        IconButton(
          icon: Icon(
            Icons.search,
            color: Theme.of(context).colorScheme.onPrimary,
          ),
          onPressed: search,
        ),
        IconButton(
          icon: Icon(
            Icons.logout_outlined,
            color: Theme.of(context).colorScheme.onPrimary,
          ),
          onPressed: logout,
        ),
        IconButton(
          icon: Icon(
            Icons.qr_code_2_outlined,
            color: Theme.of(context).colorScheme.onPrimary,
          ),
          onPressed: () {},
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
