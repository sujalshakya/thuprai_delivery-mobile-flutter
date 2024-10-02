import 'package:thuprai_delivery/base/network/dio_service.dart';
import 'package:thuprai_delivery/base/network/api_service.dart';
import 'package:thuprai_delivery/base/repository/order_repository_implementation.dart';
import 'package:thuprai_delivery/base/service/secure_storage_service.dart';
import 'package:thuprai_delivery/ui/bottom_sheets/floating/floating_box_bottom_sheet.dart';
import 'package:thuprai_delivery/ui/bottom_sheets/notice/notice_sheet.dart';
import 'package:thuprai_delivery/ui/dialogs/error_alert/error_alert_dialog.dart';
import 'package:thuprai_delivery/ui/dialogs/info_alert/info_alert_dialog.dart';

import 'package:thuprai_delivery/ui/views/home/home_view.dart';
import 'package:thuprai_delivery/ui/views/login/repository/login_repository_implementation.dart';
import 'package:thuprai_delivery/ui/views/startup/startup_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:thuprai_delivery/ui/views/ui_toolkits/ui_toolkits_view.dart';
import 'package:thuprai_delivery/ui/views/login/login_view.dart';
import 'package:thuprai_delivery/ui/views/dispatched/dispatched_view.dart';
import 'package:thuprai_delivery/ui/views/picking_up/picking_up_view.dart';
import 'package:thuprai_delivery/ui/views/processing/processing_view.dart';
import 'package:thuprai_delivery/ui/views/pending/pending_view.dart';
import 'package:thuprai_delivery/ui/views/returned/returned_view.dart';
import 'package:thuprai_delivery/ui/views/couriered/couriered_view.dart';
import 'package:thuprai_delivery/ui/views/fulfilled/fulfilled_view.dart';
import 'package:thuprai_delivery/ui/views/order_details/order_details_view.dart';
import 'package:thuprai_delivery/ui/views/pickup_details/pickup_details_view.dart';
// @stacked-import

@StackedApp(
  routes: [
    MaterialRoute(page: HomeView),
    MaterialRoute(page: StartupView),
    MaterialRoute(page: UiToolkitsView),
    MaterialRoute(page: LoginView),
    MaterialRoute(page: DispatchedView),
    MaterialRoute(page: PickingUpView),
    MaterialRoute(page: ProcessingView),
    MaterialRoute(page: PendingView),
    MaterialRoute(page: ReturnedView),
    MaterialRoute(page: CourieredView),
    MaterialRoute(page: FulfilledView),
    MaterialRoute(page: OrderDetailsView),
    MaterialRoute(page: PickupDetailsView),
// @stacked-route
  ],
  dependencies: [
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: ApiService),
    LazySingleton(classType: DioService),
    LazySingleton(classType: SecureStorageService),
    LazySingleton(classType: OrderRepositoryImplementation),

    LazySingleton(classType: LoginRepositoryImplementation),

    // @stacked-service
  ],
  bottomsheets: [
    StackedBottomsheet(classType: NoticeSheet),
    StackedBottomsheet(classType: FloatingBoxBottomSheet)
    // @stacked-bottom-sheet
  ],
  dialogs: [
    StackedDialog(classType: InfoAlertDialog),
    StackedDialog(classType: ErrorAlertDialog),

    // @stacked-dialog
  ],
)
class App {}
