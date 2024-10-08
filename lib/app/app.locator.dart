// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedLocatorGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, implementation_imports, depend_on_referenced_packages

import 'package:stacked_services/src/bottom_sheet/bottom_sheet_service.dart';
import 'package:stacked_services/src/dialog/dialog_service.dart';
import 'package:stacked_services/src/navigation/navigation_service.dart';
import 'package:stacked_shared/stacked_shared.dart';
import 'package:thuprai_delivery/base/network/check_network.dart';
import 'package:thuprai_delivery/ui/views/pickup_details/repository/pickup_details_repository_implementation.dart';

import '../base/network/api_service.dart';
import '../base/network/dio_service.dart';
import '../base/repository/order_repository_implementation.dart';
import '../base/service/secure_storage_service.dart';
import '../ui/views/login/repository/login_repository_implementation.dart';
import '../ui/views/order_details/repository/order_details_repository_implementation.dart';

final locator = StackedLocator.instance;
final dio = locator<DioService>().dio;
Future<void> setupLocator({
  String? environment,
  EnvironmentFilter? environmentFilter,
}) async {
// Register environments
  locator.registerEnvironment(
      environment: environment, environmentFilter: environmentFilter);

// Register dependencies
  locator.registerLazySingleton(() => BottomSheetService());
  locator.registerLazySingleton(() => DialogService());
  locator.registerLazySingleton(() => CheckNetworkService());

  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => ApiService(dio));
  locator.registerLazySingleton(() => DioService());
  locator.registerLazySingleton(() => SecureStorageService());
  locator.registerLazySingleton(() => OrderRepositoryImplementation());
  locator.registerLazySingleton(() => OrderDetailsRepositoryImplementation());
  locator.registerLazySingleton(() => LoginRepositoryImplementation());
  locator.registerLazySingleton(() => PickupDetailsRepositoryImplementation());
}
