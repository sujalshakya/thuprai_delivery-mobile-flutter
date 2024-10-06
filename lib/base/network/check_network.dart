import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:thuprai_delivery/app/app.dialogs.dart';
import 'package:thuprai_delivery/app/app.locator.dart';

class CheckNetworkService {
  final dialogService = locator<DialogService>();
  Future<bool> checkNetwork() async {
    final List<ConnectivityResult> connectivityResult =
        await (Connectivity().checkConnectivity());

    if (connectivityResult.contains(ConnectivityResult.none)) {
      dialogService.showCustomDialog(
          variant: DialogType.errorAlert,
          description: "No Internet Connection.");
      return false;
    } else {
      return true;
    }
  }
}
