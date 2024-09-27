// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedNavigatorGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/material.dart' as _i15;
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart' as _i1;
import 'package:stacked_services/stacked_services.dart' as _i17;
import 'package:thuprai_delivery/base/model/order_model.dart' as _i16;
import 'package:thuprai_delivery/ui/views/couriered/couriered_view.dart'
    as _i11;
import 'package:thuprai_delivery/ui/views/dispatched/dispatched_view.dart'
    as _i6;
import 'package:thuprai_delivery/ui/views/fulfilled/fulfilled_view.dart'
    as _i12;
import 'package:thuprai_delivery/ui/views/home/home_view.dart' as _i2;
import 'package:thuprai_delivery/ui/views/login/login_view.dart' as _i5;
import 'package:thuprai_delivery/ui/views/order_details/order_details_view.dart'
    as _i13;
import 'package:thuprai_delivery/ui/views/pending/pending_view.dart' as _i9;
import 'package:thuprai_delivery/ui/views/picking_up/picking_up_view.dart'
    as _i7;
import 'package:thuprai_delivery/ui/views/pickup_details/pickup_details_view.dart'
    as _i14;
import 'package:thuprai_delivery/ui/views/processing/processing_view.dart'
    as _i8;
import 'package:thuprai_delivery/ui/views/returned/returned_view.dart' as _i10;
import 'package:thuprai_delivery/ui/views/startup/startup_view.dart' as _i3;
import 'package:thuprai_delivery/ui/views/ui_toolkits/ui_toolkits_view.dart'
    as _i4;

class Routes {
  static const homeView = '/home-view';

  static const startupView = '/startup-view';

  static const uiToolkitsView = '/ui-toolkits-view';

  static const loginView = '/login-view';

  static const dispatchedView = '/dispatched-view';

  static const pickingUpView = '/picking-up-view';

  static const processingView = '/processing-view';

  static const pendingView = '/pending-view';

  static const returnedView = '/returned-view';

  static const courieredView = '/couriered-view';

  static const fulfilledView = '/fulfilled-view';

  static const orderDetailsView = '/order-details-view';

  static const pickupDetailsView = '/pickup-details-view';

  static const all = <String>{
    homeView,
    startupView,
    uiToolkitsView,
    loginView,
    dispatchedView,
    pickingUpView,
    processingView,
    pendingView,
    returnedView,
    courieredView,
    fulfilledView,
    orderDetailsView,
    pickupDetailsView,
  };
}

class StackedRouter extends _i1.RouterBase {
  final _routes = <_i1.RouteDef>[
    _i1.RouteDef(
      Routes.homeView,
      page: _i2.HomeView,
    ),
    _i1.RouteDef(
      Routes.startupView,
      page: _i3.StartupView,
    ),
    _i1.RouteDef(
      Routes.uiToolkitsView,
      page: _i4.UiToolkitsView,
    ),
    _i1.RouteDef(
      Routes.loginView,
      page: _i5.LoginView,
    ),
    _i1.RouteDef(
      Routes.dispatchedView,
      page: _i6.DispatchedView,
    ),
    _i1.RouteDef(
      Routes.pickingUpView,
      page: _i7.PickingUpView,
    ),
    _i1.RouteDef(
      Routes.processingView,
      page: _i8.ProcessingView,
    ),
    _i1.RouteDef(
      Routes.pendingView,
      page: _i9.PendingView,
    ),
    _i1.RouteDef(
      Routes.returnedView,
      page: _i10.ReturnedView,
    ),
    _i1.RouteDef(
      Routes.courieredView,
      page: _i11.CourieredView,
    ),
    _i1.RouteDef(
      Routes.fulfilledView,
      page: _i12.FulfilledView,
    ),
    _i1.RouteDef(
      Routes.orderDetailsView,
      page: _i13.OrderDetailsView,
    ),
    _i1.RouteDef(
      Routes.pickupDetailsView,
      page: _i14.PickupDetailsView,
    ),
  ];

  final _pagesMap = <Type, _i1.StackedRouteFactory>{
    _i2.HomeView: (data) {
      return _i15.MaterialPageRoute<dynamic>(
        builder: (context) => const _i2.HomeView(),
        settings: data,
      );
    },
    _i3.StartupView: (data) {
      return _i15.MaterialPageRoute<dynamic>(
        builder: (context) => const _i3.StartupView(),
        settings: data,
      );
    },
    _i4.UiToolkitsView: (data) {
      return _i15.MaterialPageRoute<dynamic>(
        builder: (context) => const _i4.UiToolkitsView(),
        settings: data,
      );
    },
    _i5.LoginView: (data) {
      return _i15.MaterialPageRoute<dynamic>(
        builder: (context) => const _i5.LoginView(),
        settings: data,
      );
    },
    _i6.DispatchedView: (data) {
      return _i15.MaterialPageRoute<dynamic>(
        builder: (context) => const _i6.DispatchedView(),
        settings: data,
      );
    },
    _i7.PickingUpView: (data) {
      return _i15.MaterialPageRoute<dynamic>(
        builder: (context) => const _i7.PickingUpView(),
        settings: data,
      );
    },
    _i8.ProcessingView: (data) {
      return _i15.MaterialPageRoute<dynamic>(
        builder: (context) => const _i8.ProcessingView(),
        settings: data,
      );
    },
    _i9.PendingView: (data) {
      return _i15.MaterialPageRoute<dynamic>(
        builder: (context) => const _i9.PendingView(),
        settings: data,
      );
    },
    _i10.ReturnedView: (data) {
      return _i15.MaterialPageRoute<dynamic>(
        builder: (context) => const _i10.ReturnedView(),
        settings: data,
      );
    },
    _i11.CourieredView: (data) {
      return _i15.MaterialPageRoute<dynamic>(
        builder: (context) => const _i11.CourieredView(),
        settings: data,
      );
    },
    _i12.FulfilledView: (data) {
      return _i15.MaterialPageRoute<dynamic>(
        builder: (context) => const _i12.FulfilledView(),
        settings: data,
      );
    },
    _i13.OrderDetailsView: (data) {
      final args = data.getArgs<OrderDetailsViewArguments>(nullOk: false);
      return _i15.MaterialPageRoute<dynamic>(
        builder: (context) => _i13.OrderDetailsView(
            key: args.key,
            orderDispatch: args.orderDispatch,
            order: args.order,
            price: args.price),
        settings: data,
      );
    },
    _i14.PickupDetailsView: (data) {
      final args = data.getArgs<PickupDetailsViewArguments>(nullOk: false);
      return _i15.MaterialPageRoute<dynamic>(
        builder: (context) =>
            _i14.PickupDetailsView(key: args.key, partner: args.partner),
        settings: data,
      );
    },
  };

  @override
  List<_i1.RouteDef> get routes => _routes;

  @override
  Map<Type, _i1.StackedRouteFactory> get pagesMap => _pagesMap;
}

class OrderDetailsViewArguments {
  const OrderDetailsViewArguments({
    this.key,
    this.orderDispatch,
    required this.order,
    required this.price,
  });

  final _i15.Key? key;

  final bool? orderDispatch;

  final _i16.Order order;

  final String price;

  @override
  String toString() {
    return '{"key": "$key", "orderDispatch": "$orderDispatch", "order": "$order", "price": "$price"}';
  }

  @override
  bool operator ==(covariant OrderDetailsViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key &&
        other.orderDispatch == orderDispatch &&
        other.order == order &&
        other.price == price;
  }

  @override
  int get hashCode {
    return key.hashCode ^
        orderDispatch.hashCode ^
        order.hashCode ^
        price.hashCode;
  }
}

class PickupDetailsViewArguments {
  const PickupDetailsViewArguments({
    this.key,
    required this.partner,
  });

  final _i15.Key? key;

  final String partner;

  @override
  String toString() {
    return '{"key": "$key", "partner": "$partner"}';
  }

  @override
  bool operator ==(covariant PickupDetailsViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key && other.partner == partner;
  }

  @override
  int get hashCode {
    return key.hashCode ^ partner.hashCode;
  }
}

extension NavigatorStateExtension on _i17.NavigationService {
  Future<dynamic> navigateToHomeView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.homeView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToStartupView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.startupView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToUiToolkitsView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.uiToolkitsView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToLoginView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.loginView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToDispatchedView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.dispatchedView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToPickingUpView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.pickingUpView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToProcessingView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.processingView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToPendingView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.pendingView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToReturnedView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.returnedView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToCourieredView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.courieredView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToFulfilledView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.fulfilledView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToOrderDetailsView({
    _i15.Key? key,
    bool? orderDispatch,
    required _i16.Order order,
    required String price,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.orderDetailsView,
        arguments: OrderDetailsViewArguments(
            key: key, orderDispatch: orderDispatch, order: order, price: price),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToPickupDetailsView({
    _i15.Key? key,
    required String partner,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.pickupDetailsView,
        arguments: PickupDetailsViewArguments(key: key, partner: partner),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithHomeView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.homeView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithStartupView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.startupView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithUiToolkitsView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.uiToolkitsView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithLoginView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.loginView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithDispatchedView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.dispatchedView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithPickingUpView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.pickingUpView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithProcessingView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.processingView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithPendingView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.pendingView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithReturnedView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.returnedView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithCourieredView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.courieredView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithFulfilledView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.fulfilledView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithOrderDetailsView({
    _i15.Key? key,
    bool? orderDispatch,
    required _i16.Order order,
    required String price,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.orderDetailsView,
        arguments: OrderDetailsViewArguments(
            key: key, orderDispatch: orderDispatch, order: order, price: price),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithPickupDetailsView({
    _i15.Key? key,
    required String partner,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.pickupDetailsView,
        arguments: PickupDetailsViewArguments(key: key, partner: partner),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }
}
