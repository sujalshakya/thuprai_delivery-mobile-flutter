import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:isbn/isbn.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:stacked/stacked.dart';
import 'package:thuprai_delivery/base/theme/theme.dart';
import 'package:thuprai_delivery/base/ui_toolkits/primary_text.dart';

import 'scanner_viewmodel.dart';

class ScannerView extends StackedView<ScannerViewModel> {
  ScannerView({Key? key}) : super(key: key);
  final MobileScannerController controller = MobileScannerController();

  @override
  Widget builder(
    BuildContext context,
    ScannerViewModel viewModel,
    Widget? child,
  ) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                viewModel.leadingTap();
              },
              icon: const Icon(Icons.arrow_back)),
        ),
        backgroundColor: ThemeClass().getSurfaceColor(context),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 250.h,
                child: MobileScanner(
                  controller: controller,
                  onDetect: (BarcodeCapture capture) async {
                    final List<Barcode> barcodes = capture.barcodes;

                    // Stop the scanner while processing the barcode.
                    await controller.stop();

                    for (final barcode in barcodes) {
                      if (barcode.rawValue != null &&
                          !viewModel.isAlreadyScanned(barcode.rawValue!)) {
                        Isbn isbn = Isbn();

                        if (barcode.format == BarcodeFormat.ean13) {
                          if ((isbn.isIsbn10(barcode.rawValue!)) ||
                              isbn.isIsbn13(barcode.rawValue ?? "")) {
                            viewModel.addScannedBarcode(barcode.rawValue!);

                            await viewModel.askQuantity(barcode.rawValue!);

                            await Future.delayed(const Duration(seconds: 1));
                          }
                        }
                      }
                    }

                    controller.start();
                  },
                ),
              ),
              PrimaryText(text: viewModel.text)
            ],
          ),
        ),
      ),
    );
  }

  @override
  ScannerViewModel viewModelBuilder(BuildContext context) => ScannerViewModel();
}
