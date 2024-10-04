import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:stacked/stacked.dart';

import 'scanner_viewmodel.dart';

class ScannerView extends StackedView<ScannerViewModel> {
  const ScannerView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    ScannerViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,
        body: Center(
          child: SizedBox(
            height: 250.h,
            child: MobileScanner(onDetect: (capture) {
              final List<Barcode> barcodes = capture.barcodes;
              for (final barcode in barcodes) {
                debugPrint(barcode.rawValue ?? "No Data found in QR");
              }
            }),
          ),
        ));
  }

  @override
  ScannerViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      ScannerViewModel();
}
