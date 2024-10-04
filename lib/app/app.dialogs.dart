// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedDialogGenerator
// **************************************************************************

import 'package:stacked_services/stacked_services.dart';

import 'app.locator.dart';
import '../ui/dialogs/error_alert/error_alert_dialog.dart';
import '../ui/dialogs/quantity_dialog/quantity_dialog.dart';

enum DialogType {
  errorAlert,
  quantity,
}

void setupDialogUi() {
  final dialogService = locator<DialogService>();

  final Map<DialogType, DialogBuilder> builders = {
    DialogType.errorAlert: (context, request, completer) =>
        ErrorAlertDialog(request: request, completer: completer),
    DialogType.quantity: (context, request, completer) =>
        QuantityDialog(request: request, completer: completer),
  };

  dialogService.registerCustomDialogBuilders(builders);
}
