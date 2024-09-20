import 'package:flutter/material.dart';
import 'package:thuprai_delivery/base/ui_toolkits/title_text.dart';

class PrimaryAppBar extends StatelessWidget implements PreferredSizeWidget {
  /// the primary app bar.
  /// Requires [title].
  /// Not required [leading], [leadingWidth] and [actions].
  const PrimaryAppBar(
      {super.key,
      this.leading,
      required this.title,
      this.leadingWidth,
      this.actions});

  /// The start of the app bar, can be any widget.
  final Widget? leading;

  /// The title of the appbar and the view.
  final String title;

  /// The end of the appbar, can be list of any widgets.
  final List<Widget>? actions;

  /// The width of the leading widgets.
  final double? leadingWidth;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leadingWidth: leadingWidth,
      leading: leading,
      backgroundColor: Theme.of(context).colorScheme.secondary,
      centerTitle: true,
      title: TitleText(
        text: title,
        color: Theme.of(context).colorScheme.onPrimary,
      ),
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
