import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:thuprai_delivery/base/ui_toolkits/label_text.dart';
import 'package:thuprai_delivery/base/ui_toolkits/primary_appbar.dart';
import 'package:thuprai_delivery/base/ui_toolkits/primary_container.dart';
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
              onPressed: () {
                viewModel.delete(barcodes ?? []);
              },
              icon: Icon(
                Icons.delete,
                color: Theme.of(context).colorScheme.onPrimary,
              ))
        ],
      ),
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: barcodes == null
          ? const Center(child: Text("No barcode scanned"))
          : ListView.builder(
              itemCount: viewModel.barcodes?.length ?? 0,
              itemBuilder: (context, index) {
                final barcode = viewModel.barcodes?[index];
                String quantity = barcode?.quantity ?? "0";
                String barcodeISBN = barcode!.barcode ?? "";
                return PrimaryContainer(
                  child: ListTile(
                    leading: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: PrimaryText(
                        text: "${index + 1}",
                        fontSize: 20,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    title: PrimaryText(
                      text: barcodeISBN,
                    ),
                    subtitle: PrimaryText(
                        text: "Quanity: $quantity",
                        color: Theme.of(context).colorScheme.onSecondary),
                    trailing: IconButton(
                      icon: Icon(
                        Icons.edit,
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                      onPressed: () async {
                        quantity = await viewModel.edit(index);
                      },
                    ),
                  ),
                );
              }),
      floatingActionButton: barcodes == null
          ? const SizedBox.shrink()
          : Padding(
              padding: const EdgeInsets.all(24.0),
              child: FloatingActionButton(
                onPressed: () {
                  viewModel.share(barcodes ?? []);
                },
                backgroundColor: Theme.of(context).colorScheme.secondary,
                foregroundColor: Theme.of(context).colorScheme.surface,
                child: const Icon(Icons.download),
              ),
            ),
    );
  }

  @override
  BarcodeViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      BarcodeViewModel(barcodes);
}
