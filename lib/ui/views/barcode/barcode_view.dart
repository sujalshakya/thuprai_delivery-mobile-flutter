import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:thuprai_delivery/base/ui_toolkits/label_text.dart';
import 'package:thuprai_delivery/base/ui_toolkits/primary_appbar.dart';
import 'barcode_viewmodel.dart';

class BarcodeView extends StackedView<BarcodeViewModel> {
  const BarcodeView({Key? key}) : super(key: key);

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
        body: viewModel.barcodes == []
            ? const Center(child: Text("No data"))
            : ListView.builder(
                itemCount: viewModel.barcodes.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: PrimaryText(text: index.toString()),
                    title: const PrimaryText(
                      text: "",
                    ),
                    subtitle: const PrimaryText(
                      text: "",
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
