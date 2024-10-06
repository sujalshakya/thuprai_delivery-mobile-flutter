import 'package:thuprai_delivery/app/app.dialogs.dart';
import 'package:thuprai_delivery/app/app.router.dart';
import 'package:thuprai_delivery/base/wrapper/base_viewmodel_wrapper.dart';
import 'package:thuprai_delivery/ui/views/barcode/model/barcode_model.dart';

class ScannerViewModel extends BaseViewmodelWrapper {
  List<BarcodeISbn> barcodes = [];

  /// asked is used for controlling camera.
  bool asked = false;

  /// text to be displayed under the camera.
  String text = "";

  /// open dialog to ask quantity of books.
  askQuantity(String barcode) async {
    await Future.delayed(const Duration(seconds: 1));
    final dialog = await dialogService.showCustomDialog(
      variant: DialogType.quantity,
    );

    text = "ISBN number: $barcode is added successfully";
    rebuildUi();
    if (dialog != null) {
      asked = true;
      barcodes.add(
        BarcodeISbn(quantity: dialog.data, barcode: barcode),
      );
    }
  }

  /// function of leading icon of appbar.
  leadingTap() {
    navigationService.replaceWithBarcodeView(barcodes: barcodes);
  }
}
