import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:thuprai_delivery/app/app.locator.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:thuprai_delivery/base/network/api_service.dart';
import 'package:thuprai_delivery/base/repository/order_repository_implementation.dart';
import 'package:thuprai_delivery/base/service/secure_storage_service.dart';
import 'package:thuprai_delivery/ui/views/login/repository/login_repository_implementation.dart';
// @stacked-import

import 'test_helpers.mocks.dart';

@GenerateMocks([], customMocks: [
  MockSpec<NavigationService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<BottomSheetService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<DialogService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<SecureStorageService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<ApiService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<OrderRepositoryImplementation>(
      onMissingStub: OnMissingStub.returnDefault),

  MockSpec<LoginRepositoryImplementation>(
      onMissingStub: OnMissingStub.returnDefault)

  // @stacked-mock-spec
])
void registerServices() {
  getAndRegisterNavigationService();
  getAndRegisterBottomSheetService();
  getAndRegisterDialogService();
  getAndRegisterLoginRepositoryImplementationService();
  getAndRegisterOrderRepositoryImplementation();
  // @stacked-mock-register
}

MockNavigationService getAndRegisterNavigationService() {
  _removeRegistrationIfExists<NavigationService>();
  final service = MockNavigationService();
  locator.registerSingleton<NavigationService>(service);
  return service;
}

MockBottomSheetService getAndRegisterBottomSheetService<T>({
  SheetResponse<T>? showCustomSheetResponse,
}) {
  _removeRegistrationIfExists<BottomSheetService>();
  final service = MockBottomSheetService();

  when(service.showCustomSheet<T, T>(
    enableDrag: anyNamed('enableDrag'),
    enterBottomSheetDuration: anyNamed('enterBottomSheetDuration'),
    exitBottomSheetDuration: anyNamed('exitBottomSheetDuration'),
    ignoreSafeArea: anyNamed('ignoreSafeArea'),
    isScrollControlled: anyNamed('isScrollControlled'),
    barrierDismissible: anyNamed('barrierDismissible'),
    additionalButtonTitle: anyNamed('additionalButtonTitle'),
    variant: anyNamed('variant'),
    title: anyNamed('title'),
    hasImage: anyNamed('hasImage'),
    imageUrl: anyNamed('imageUrl'),
    showIconInMainButton: anyNamed('showIconInMainButton'),
    mainButtonTitle: anyNamed('mainButtonTitle'),
    showIconInSecondaryButton: anyNamed('showIconInSecondaryButton'),
    secondaryButtonTitle: anyNamed('secondaryButtonTitle'),
    showIconInAdditionalButton: anyNamed('showIconInAdditionalButton'),
    takesInput: anyNamed('takesInput'),
    barrierColor: anyNamed('barrierColor'),
    barrierLabel: anyNamed('barrierLabel'),
    customData: anyNamed('customData'),
    data: anyNamed('data'),
    description: anyNamed('description'),
  )).thenAnswer((realInvocation) =>
      Future.value(showCustomSheetResponse ?? SheetResponse<T>()));

  locator.registerSingleton<BottomSheetService>(service);
  return service;
}

MockLoginRepositoryImplementation
    getAndRegisterLoginRepositoryImplementationService() {
  _removeRegistrationIfExists<MockLoginRepositoryImplementation>();
  final service = MockLoginRepositoryImplementation();
  locator.registerSingleton<MockLoginRepositoryImplementation>(service);
  return service;
}

MockOrderRepositoryImplementation
    getAndRegisterOrderRepositoryImplementation() {
  _removeRegistrationIfExists<MockOrderRepositoryImplementation>();
  final service = MockOrderRepositoryImplementation();

  locator.registerSingleton<MockOrderRepositoryImplementation>(service);
  return service;
}

MockDialogService getAndRegisterDialogService() {
  _removeRegistrationIfExists<DialogService>();
  final service = MockDialogService();
  locator.registerSingleton<DialogService>(service);
  return service;
}

// @stacked-mock-create

void _removeRegistrationIfExists<T extends Object>() {
  if (locator.isRegistered<T>()) {
    locator.unregister<T>();
  }
}
