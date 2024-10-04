import 'dart:io';

import 'package:csv/csv.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:thuprai_delivery/app/app.dialogs.dart';
import 'package:thuprai_delivery/app/app.router.dart';
import 'package:thuprai_delivery/base/wrapper/base_viewmodel_wrapper.dart';
import 'package:thuprai_delivery/ui/views/barcode/model/barcode_model.dart';

class BarcodeViewModel extends BaseViewmodelWrapper {
  final List<BarcodeISbn>? barcodes;
  List<String> isbn = [];
  List<String> quantity = [];
  BarcodeViewModel(this.barcodes, {Key? key});
  void leadingTap() {
    navigationService.back();
  }

  void delete(List<BarcodeISbn> barcodes) {
    barcodes.clear();
    rebuildUi();
  }

  edit(int index) async {
    final response = await dialogService.showCustomDialog(
      variant: DialogType.quantity,
    );
    barcodes![index].quantity = response!.data;
    rebuildUi();
  }

  void share(List<BarcodeISbn> barcodes) async {
    List<List<String>> rows = [];

    rows.add(["ISBN", "Quantity"]);

    for (int i = 0; i < barcodes.length; i++) {
      List<String> row = [];
      row.add(barcodes[i].barcode!);
      row.add(barcodes[i].quantity!);
      rows.add(row);
    }

    String csvContent = const ListToCsvConverter().convert(rows);

    final directory = await getApplicationDocumentsDirectory();
    String datetime = DateTime.now().toString();

    final csvFilePath = File('${directory.path}/$datetime.csv');
    await csvFilePath.writeAsString(csvContent);

    final files = <XFile>[];
    files.add(XFile(csvFilePath.path, name: 'ISBN_$datetime.csv'));

    Share.shareXFiles(files);
  }

  void scanner() {
    navigationService.navigateToScannerView();
  }
}
