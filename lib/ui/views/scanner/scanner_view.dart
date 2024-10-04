import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:stacked/stacked.dart';
import 'package:thuprai_delivery/base/ui_toolkits/label_text.dart';

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
        backgroundColor: Theme.of(context).colorScheme.surface,
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
                    for (final barcode in barcodes) {
                      await controller.stop();

                      await viewModel.askQuantity(barcode.rawValue.toString());
                      await Future.delayed(const Duration(seconds: 1));
                      if (viewModel.asked) {
                        await controller.start();
                      }
                    }
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
