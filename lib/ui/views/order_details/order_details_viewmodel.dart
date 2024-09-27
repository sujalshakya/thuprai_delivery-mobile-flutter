import 'package:thuprai_delivery/base/wrapper/base_viewmodel_wrapper.dart';

class OrderDetailsViewModel extends BaseViewmodelWrapper {
  void leadingTap() {
    navigationService.back();
  }
}
