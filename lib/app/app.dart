import 'package:thuprai_delivery/ui/bottom_sheets/notice/notice_sheet.dart';
import 'package:thuprai_delivery/ui/dialogs/info_alert/info_alert_dialog.dart';
import 'package:thuprai_delivery/ui/views/home/home_view.dart';
import 'package:thuprai_delivery/ui/views/startup/startup_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:thuprai_delivery/ui/views/ui_toolkits/ui_toolkits_view.dart';
import 'package:thuprai_delivery/ui/views/login/login_view.dart';
// @stacked-import

@StackedApp(
  routes: [
    MaterialRoute(page: HomeView),
    MaterialRoute(page: StartupView),
    MaterialRoute(page: UiToolkitsView),
    MaterialRoute(page: LoginView),
// @stacked-route
  ],
  dependencies: [
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: NavigationService),
    // @stacked-service
  ],
  bottomsheets: [
    StackedBottomsheet(classType: NoticeSheet),
    // @stacked-bottom-sheet
  ],
  dialogs: [
    StackedDialog(classType: InfoAlertDialog),
    // @stacked-dialog
  ],
)
class App {}
