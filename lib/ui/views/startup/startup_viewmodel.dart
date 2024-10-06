import 'package:thuprai_delivery/app/app.router.dart';
import 'package:thuprai_delivery/base/wrapper/base_viewmodel_wrapper.dart';

class StartupViewModel extends BaseViewmodelWrapper {
  Future runStartupLogic() async {
    await Future.delayed(const Duration(seconds: 1));
    final token = await tokenService.getToken('token');
    if (token == null) {
      navigationService.replaceWithLoginView();
    } else {
      navigationService.replaceWithHomeView();
    }
  }
}
