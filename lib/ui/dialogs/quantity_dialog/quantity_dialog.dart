import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:thuprai_delivery/base/ui_toolkits/label_text.dart';

import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:thuprai_delivery/base/ui_toolkits/primary_button.dart';
import 'package:thuprai_delivery/base/ui_toolkits/primary_textfield.dart';
import 'package:thuprai_delivery/base/ui_toolkits/secondary_button.dart';
import 'package:thuprai_delivery/ui/dialogs/quantity_dialog/quantity_dialog.form.dart';
import 'package:thuprai_delivery/ui/dialogs/quantity_dialog/quantiy_dialog_model.dart';

@FormView(fields: [
  FormTextField(name: 'quantity'),
])
class QuantityDialog extends StackedView<QuantityDialogModel>
    with $QuantityDialog {
  final DialogRequest request;
  final Function(DialogResponse) completer;

  const QuantityDialog({
    Key? key,
    required this.request,
    required this.completer,
  }) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    QuantityDialogModel viewModel,
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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: PrimaryText(
                text: "Quantity Dialog",
                color: Theme.of(context).colorScheme.onPrimary,
                fontSize: 18,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: PrimaryTextfield(
                controller: quantityController,
                keyboardType: TextInputType.number,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SecondaryButton(
                  width: 50.w,
                  text: "1",
                  onTap: () {
                    quantityController.text = "1";
                  },
                ),
                SecondaryButton(
                  width: 50.w,
                  text: "5",
                  onTap: () {
                    quantityController.text = "5";
                  },
                ),
                SecondaryButton(
                  width: 50.w,
                  text: "10",
                  onTap: () {
                    quantityController.text = "10";
                  },
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SecondaryButton(
                  width: 50.w,
                  text: "50",
                  onTap: () {
                    quantityController.text = "50";
                  },
                ),
                SecondaryButton(
                  width: 50.w,
                  text: "100",
                  onTap: () {
                    quantityController.text = "100";
                  },
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Row(
                children: [
                  PrimaryButton(
                    width: 90.w,
                    text: "Cancel",
                    onTap: () {
                      completer(DialogResponse(
                        confirmed: false,
                      ));
                    },
                  ),
                  PrimaryButton(
                    width: 90.w,
                    text: "Confirm",
                    onTap: () {
                      completer(DialogResponse(
                        data: quantityController.text,
                        confirmed: true,
                      ));
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  void onDispose(QuantityDialogModel viewModel) {
    super.onDispose(viewModel);
    disposeForm();
  }

  @override
  QuantityDialogModel viewModelBuilder(BuildContext context) =>
      QuantityDialogModel();
}
