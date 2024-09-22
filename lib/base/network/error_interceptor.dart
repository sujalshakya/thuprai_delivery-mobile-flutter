import 'package:dio/dio.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:thuprai_delivery/app/app.dialogs.dart';
import 'package:thuprai_delivery/app/app.locator.dart';

class ErrorInterceptor extends Interceptor {
  String errMessage = "";
  final _dialogService = locator<DialogService>();
  @override
  Future<void> onError(err, handler) async {
    if (err.response != null) {
      switch (err.response?.statusCode) {
        case 400:
          errMessage = 'Email or Password is invalid';
        case 401:
          errMessage = 'UnAuthorized';
        case 403:
          errMessage = 'Forbidden';
        case 404:
          errMessage = 'Not Found';
        case 429:
          errMessage = 'Too Many Requests';
        case 502:
          errMessage = 'Bad Gateway';
        case 504:
          errMessage = 'Gateway Timeout';
        case 500:
          errMessage = 'Internal Server Error';
      }
    } else {
      errMessage = 'Network Error';
    }
    _dialogService.showCustomDialog(
        variant: DialogType.errorAlert, description: errMessage);

    handler.next(err);
  }
}
