import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thuprai_delivery/base/ui_toolkits/primary_button.dart';
import 'package:thuprai_delivery/ui/common/app_colors.dart';
import 'package:thuprai_delivery/ui/common/ui_helpers.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:thuprai_delivery/ui/dialogs/error_alert/error_alert_dialog_model.dart';

class ErrorAlertDialog extends StackedView<ErrorAlertDialogModel> {
  final DialogRequest request;
  final Function(DialogResponse) completer;

  const ErrorAlertDialog({
    Key? key,
    required this.request,
    required this.completer,
  }) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    ErrorAlertDialogModel viewModel,
    Widget? child,
  ) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      backgroundColor: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.error_outline,
                        color: Theme.of(context).colorScheme.error,
                        size: 40,
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Text(
                        request.description!,
                        style:
                            const TextStyle(fontSize: 14, color: kcMediumGrey),
                        maxLines: 3,
                        softWrap: true,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            verticalSpaceMedium,
            PrimaryButton(
              text: "OK",
              onTap: () {
                completer(DialogResponse(
                  confirmed: true,
                ));
              },
            )
          ],
        ),
      ),
    );
  }

  @override
  ErrorAlertDialogModel viewModelBuilder(BuildContext context) =>
      ErrorAlertDialogModel();
}
