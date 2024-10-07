import 'package:flutter/material.dart';
import 'package:thuprai_delivery/base/theme/theme.dart';
import 'package:thuprai_delivery/base/ui_toolkits/primary_text.dart';

class PrimaryAppBar extends StatelessWidget implements PreferredSizeWidget {
  /// the primary app bar.
  /// Requires [title].
  /// Not required [leading], [center], [actions].
  const PrimaryAppBar(
      {super.key,
      this.leading,
      required this.title,
      this.center,
      this.actions});

  /// The start of the app bar, can be any widget.
  final Widget? leading;

  /// Whether title is to be at center.
  final bool? center;

  /// The title of the appbar and the view.
  final String title;

  /// The list of widgets at the end of the app bar.
  final List<Widget>? actions;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      shadowColor: ThemeClass().getPrimaryColor(context),
      centerTitle: center,
      elevation: 4,
      leading: leading,
      automaticallyImplyLeading: false,
      backgroundColor: ThemeClass().getSurfaceColor(context),
      title: Padding(
        padding: const EdgeInsets.all(8.0),
        child: PrimaryText(
          text: title,
          color: ThemeClass().getOnPrimaryColor(context),
        ),
      ),
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
