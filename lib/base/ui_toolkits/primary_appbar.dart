import 'package:flutter/material.dart';

import 'package:thuprai_delivery/base/ui_toolkits/title_text.dart';

class PrimaryAppBar extends StatelessWidget implements PreferredSizeWidget {
  /// the primary app bar.
  /// Requires [title].
  /// Not required [leading], [leadingWidth].
  const PrimaryAppBar(
      {super.key, this.leading, required this.title, this.actions});

  /// The start of the app bar, can be any widget.
  final Widget? leading;

  /// The title of the appbar and the view.
  final String title;
  final List<Widget>? actions;

  /// The width of the leading widgets.
  @override
  Widget build(BuildContext context) {
    return AppBar(
        shadowColor: Theme.of(context).colorScheme.primary,
        elevation: 4,
        leading: leading,
        backgroundColor: Theme.of(context).colorScheme.surface,
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: TitleText(
            text: title,
            color: Theme.of(context).colorScheme.onPrimary,
          ),
        ),
        actions: actions);
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
