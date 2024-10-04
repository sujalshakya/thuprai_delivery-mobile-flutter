import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:thuprai_delivery/base/ui_toolkits/label_text.dart';
import 'package:thuprai_delivery/base/ui_toolkits/primary_appbar.dart';
import 'package:thuprai_delivery/ui/views/barcode/model/barcode_model.dart';
import 'barcode_viewmodel.dart';

class BarcodeView extends StackedView<BarcodeViewModel> {
  final List<BarcodeISbn>? barcodes;

  const BarcodeView({Key? key, this.barcodes}) : super(key: key);
  @override
  Widget builder(
    BuildContext context,
    BarcodeViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
        appBar: PrimaryAppBar(
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Theme.of(context).colorScheme.onPrimary,
            ),
            onPressed: () {
              viewModel.leadingTap();
            },
          ),
          title: "BarCode Scanner",
          actions: [
            IconButton(
              onPressed: () {
                viewModel.scanner();
              },
              icon: Icon(
                Icons.qr_code,
                color: Theme.of(context).colorScheme.onPrimary,
              ),
            ),
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.delete,
                  color: Theme.of(context).colorScheme.onPrimary,
                ))
          ],
        ),
        backgroundColor: Theme.of(context).colorScheme.surface,
        body: barcodes == null
            ? const Center(child: Text("No data"))
            : ListView.builder(
                itemCount: barcodes?.length ?? 0,
                itemBuilder: (context, index) {
                  final barcode = barcodes?[index];
                  return ListTile(
                    leading: PrimaryText(text: index.toString()),
                    title: PrimaryText(text: barcode!.barcode ?? ""),
                    subtitle: PrimaryText(
                      text: barcode.quantity ?? "",
                    ),
                    trailing: IconButton(
                      icon: const Icon(
                        Icons.edit,
                      ),
                      onPressed: () {},
                    ),
                  );
                }));
  }

  @override
  BarcodeViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      BarcodeViewModel();
}
