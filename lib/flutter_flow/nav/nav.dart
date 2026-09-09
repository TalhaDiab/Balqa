import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';

import '/backend/supabase/supabase.dart';

import '/auth/base_auth_user_provider.dart';

import '/backend/push_notifications/push_notifications_handler.dart'
    show PushNotificationsHandler;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';

import '/index.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

GlobalKey<NavigatorState> appNavigatorKey = GlobalKey<NavigatorState>();

class AppStateNotifier extends ChangeNotifier {
  AppStateNotifier._();

  static AppStateNotifier? _instance;
  static AppStateNotifier get instance => _instance ??= AppStateNotifier._();

  BaseAuthUser? initialUser;
  BaseAuthUser? user;
  bool showSplashImage = true;
  String? _redirectLocation;

  /// Determines whether the app will refresh and build again when a sign
  /// in or sign out happens. This is useful when the app is launched or
  /// on an unexpected logout. However, this must be turned off when we
  /// intend to sign in/out and then navigate or perform any actions after.
  /// Otherwise, this will trigger a refresh and interrupt the action(s).
  bool notifyOnAuthChange = true;

  bool get loading => user == null || showSplashImage;
  bool get loggedIn => user?.loggedIn ?? false;
  bool get initiallyLoggedIn => initialUser?.loggedIn ?? false;
  bool get shouldRedirect => loggedIn && _redirectLocation != null;

  String getRedirectLocation() => _redirectLocation!;
  bool hasRedirect() => _redirectLocation != null;
  void setRedirectLocationIfUnset(String loc) => _redirectLocation ??= loc;
  void clearRedirectLocation() => _redirectLocation = null;

  /// Mark as not needing to notify on a sign in / out when we intend
  /// to perform subsequent actions (such as navigation) afterwards.
  void updateNotifyOnAuthChange(bool notify) => notifyOnAuthChange = notify;

  void update(BaseAuthUser newUser) {
    final shouldUpdate =
        user?.uid == null || newUser.uid == null || user?.uid != newUser.uid;
    initialUser ??= newUser;
    user = newUser;
    // Refresh the app on auth change unless explicitly marked otherwise.
    // No need to update unless the user has changed.
    if (notifyOnAuthChange && shouldUpdate) {
      notifyListeners();
    }
    // Once again mark the notifier as needing to update on auth change
    // (in order to catch sign in / out events).
    updateNotifyOnAuthChange(true);
  }

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier) => GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      navigatorKey: appNavigatorKey,
      errorBuilder: (context, state) =>
          appStateNotifier.loggedIn ? HomePageWidget() : SplashPageWidget(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) =>
              appStateNotifier.loggedIn ? HomePageWidget() : SplashPageWidget(),
          routes: [
            FFRoute(
              name: HomePageWidget.routeName,
              path: HomePageWidget.routePath,
              builder: (context, params) => HomePageWidget(
                phone: params.getParam(
                  'phone',
                  ParamType.String,
                ),
                welcomeTrip: params.getParam<TripsRow>(
                  'welcomeTrip',
                  ParamType.SupabaseRow,
                  isList: true,
                ),
                emptyTrips: params.getParam<AppRow>(
                  'emptyTrips',
                  ParamType.SupabaseRow,
                ),
                tabIndex: params.getParam(
                  'tabIndex',
                  ParamType.int,
                ),
                update: params.getParam(
                  'update',
                  ParamType.bool,
                ),
                android: params.getParam(
                  'android',
                  ParamType.String,
                ),
                apple: params.getParam(
                  'apple',
                  ParamType.String,
                ),
                share: params.getParam(
                  'share',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: SignupWidget.routeName,
              path: SignupWidget.routePath,
              builder: (context, params) => SignupWidget(),
            ),
            FFRoute(
              name: CodeWidget.routeName,
              path: CodeWidget.routePath,
              builder: (context, params) => CodeWidget(
                phone: params.getParam(
                  'phone',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: ServiceWidget.routeName,
              path: ServiceWidget.routePath,
              builder: (context, params) => ServiceWidget(
                service: params.getParam(
                  'service',
                  ParamType.DataStruct,
                  isList: false,
                  structBuilder: ServiceStruct.fromSerializableMap,
                ),
                price: params.getParam(
                  'price',
                  ParamType.double,
                ),
                letter: params.getParam(
                  'letter',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: TripPayWidget.routeName,
              path: TripPayWidget.routePath,
              builder: (context, params) => TripPayWidget(
                status: params.getParam(
                  'status',
                  ParamType.int,
                ),
                booking: params.getParam(
                  'booking',
                  ParamType.int,
                ),
                bookingRow: params.getParam<BookingsRow>(
                  'bookingRow',
                  ParamType.SupabaseRow,
                ),
                tripid: params.getParam(
                  'tripid',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: ShippingInfoWidget.routeName,
              path: ShippingInfoWidget.routePath,
              builder: (context, params) => ShippingInfoWidget(
                kmPrice: params.getParam(
                  'kmPrice',
                  ParamType.double,
                ),
                sizes: params.getParam<String>(
                  'sizes',
                  ParamType.String,
                  isList: true,
                ),
                prices: params.getParam<double>(
                  'prices',
                  ParamType.double,
                  isList: true,
                ),
                from: params.getParam<String>(
                  'from',
                  ParamType.String,
                  isList: true,
                ),
                branches: params.getParam<String>(
                  'branches',
                  ParamType.String,
                  isList: true,
                ),
                pay: params.getParam(
                  'pay',
                  ParamType.bool,
                ),
                ltlng: params.getParam<String>(
                  'ltlng',
                  ParamType.String,
                  isList: true,
                ),
                dollar: params.getParam<double>(
                  'dollar',
                  ParamType.double,
                  isList: true,
                ),
                euro: params.getParam<double>(
                  'euro',
                  ParamType.double,
                  isList: true,
                ),
                currency: params.getParam<String>(
                  'currency',
                  ParamType.String,
                  isList: true,
                ),
                cityList: params.getParam<String>(
                  'cityList',
                  ParamType.String,
                  isList: true,
                ),
              ),
            ),
            FFRoute(
              name: ShipmentTrackingWidget.routeName,
              path: ShipmentTrackingWidget.routePath,
              builder: (context, params) => ShipmentTrackingWidget(
                shipmentID: params.getParam(
                  'shipmentID',
                  ParamType.int,
                ),
                time: params.getParam(
                  'time',
                  ParamType.DateTime,
                ),
              ),
            ),
            FFRoute(
              name: TripWidget.routeName,
              path: TripWidget.routePath,
              builder: (context, params) => TripWidget(
                trip: params.getParam<TripsRow>(
                  'trip',
                  ParamType.SupabaseRow,
                ),
                cityList: params.getParam<String>(
                  'cityList',
                  ParamType.String,
                  isList: true,
                ),
                ltlng: params.getParam<String>(
                  'ltlng',
                  ParamType.String,
                  isList: true,
                ),
                tripID: params.getParam(
                  'tripID',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: TermsWidget.routeName,
              path: TermsWidget.routePath,
              builder: (context, params) => TermsWidget(),
            ),
            FFRoute(
              name: ShippingAccWidget.routeName,
              path: ShippingAccWidget.routePath,
              builder: (context, params) => ShippingAccWidget(
                shipping: params.getParam<ShippingRow>(
                  'shipping',
                  ParamType.SupabaseRow,
                ),
                pay: params.getParam(
                  'pay',
                  ParamType.bool,
                ),
              ),
            ),
            FFRoute(
              name: SplashPageWidget.routeName,
              path: SplashPageWidget.routePath,
              builder: (context, params) => SplashPageWidget(),
            ),
            FFRoute(
              name: OrderWidget.routeName,
              path: OrderWidget.routePath,
              builder: (context, params) => OrderWidget(
                sizes: params.getParam<String>(
                  'sizes',
                  ParamType.String,
                  isList: true,
                ),
                prices: params.getParam<double>(
                  'prices',
                  ParamType.double,
                  isList: true,
                ),
                kmPrice: params.getParam(
                  'kmPrice',
                  ParamType.int,
                ),
                ltlng: params.getParam<String>(
                  'ltlng',
                  ParamType.String,
                  isList: true,
                ),
                branches: params.getParam<String>(
                  'branches',
                  ParamType.String,
                  isList: true,
                ),
                dollar: params.getParam<double>(
                  'dollar',
                  ParamType.double,
                  isList: true,
                ),
                euro: params.getParam<double>(
                  'euro',
                  ParamType.double,
                  isList: true,
                ),
                gover: params.getParam<String>(
                  'gover',
                  ParamType.String,
                  isList: true,
                ),
                pay: params.getParam(
                  'pay',
                  ParamType.bool,
                ),
                category: params.getParam<String>(
                  'category',
                  ParamType.String,
                  isList: true,
                ),
                currency: params.getParam<String>(
                  'currency',
                  ParamType.String,
                  isList: true,
                ),
                cityList: params.getParam<String>(
                  'cityList',
                  ParamType.String,
                  isList: true,
                ),
              ),
            ),
            FFRoute(
              name: SpicealTripWidget.routeName,
              path: SpicealTripWidget.routePath,
              builder: (context, params) => SpicealTripWidget(
                specialTrip: params.getParam(
                  'specialTrip',
                  ParamType.int,
                ),
                citylist: params.getParam<String>(
                  'citylist',
                  ParamType.String,
                  isList: true,
                ),
                ltlng: params.getParam<String>(
                  'ltlng',
                  ParamType.String,
                  isList: true,
                ),
                title: params.getParam(
                  'title',
                  ParamType.String,
                ),
                directions: params.getParam(
                  'directions',
                  ParamType.double,
                ),
                specialTripVan: params.getParam(
                  'specialTripVan',
                  ParamType.double,
                ),
              ),
            ),
            FFRoute(
              name: TrackingWidget.routeName,
              path: TrackingWidget.routePath,
              builder: (context, params) => TrackingWidget(
                tripID: params.getParam(
                  'tripID',
                  ParamType.String,
                ),
                booking: params.getParam(
                  'booking',
                  ParamType.int,
                ),
              ),
            ),
            FFRoute(
              name: TripSharedWidget.routeName,
              path: TripSharedWidget.routePath,
              builder: (context, params) => TripSharedWidget(
                tripID: params.getParam(
                  'tripID',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: TripResolverWidget.routeName,
              path: TripResolverWidget.routePath,
              builder: (context, params) => TripResolverWidget(),
            ),
            FFRoute(
              name: SigninWidget.routeName,
              path: SigninWidget.routePath,
              builder: (context, params) => SigninWidget(),
            ),
            FFRoute(
              name: NotifyWidget.routeName,
              path: NotifyWidget.routePath,
              builder: (context, params) => NotifyWidget(),
            )
          ].map((r) => r.toRoute(appStateNotifier)).toList(),
        ),
      ].map((r) => r.toRoute(appStateNotifier)).toList(),
    );

extension NavParamExtensions on Map<String, String?> {
  Map<String, String> get withoutNulls => Map.fromEntries(
        entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
}

extension NavigationExtensions on BuildContext {
  void goNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : goNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void pushNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : pushNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void safePop() {
    // If there is only one route on the stack, navigate to the initial
    // page instead of popping.
    if (canPop()) {
      pop();
    } else {
      go('/');
    }
  }
}

extension GoRouterExtensions on GoRouter {
  AppStateNotifier get appState => AppStateNotifier.instance;
  void prepareAuthEvent([bool ignoreRedirect = false]) =>
      appState.hasRedirect() && !ignoreRedirect
          ? null
          : appState.updateNotifyOnAuthChange(false);
  bool shouldRedirect(bool ignoreRedirect) =>
      !ignoreRedirect && appState.hasRedirect();
  void clearRedirectLocation() => appState.clearRedirectLocation();
  void setRedirectLocationIfUnset(String location) =>
      appState.updateNotifyOnAuthChange(false);
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(pathParameters)
    ..addAll(uri.queryParameters)
    ..addAll(extraMap);
  TransitionInfo get transitionInfo => extraMap.containsKey(kTransitionInfoKey)
      ? extraMap[kTransitionInfoKey] as TransitionInfo
      : TransitionInfo.appDefault();
}

class FFParameters {
  FFParameters(this.state, [this.asyncParams = const {}]);

  final GoRouterState state;
  final Map<String, Future<dynamic> Function(String)> asyncParams;

  Map<String, dynamic> futureParamValues = {};

  // Parameters are empty if the params map is empty or if the only parameter
  // present is the special extra parameter reserved for the transition info.
  bool get isEmpty =>
      state.allParams.isEmpty ||
      (state.allParams.length == 1 &&
          state.extraMap.containsKey(kTransitionInfoKey));
  bool isAsyncParam(MapEntry<String, dynamic> param) =>
      asyncParams.containsKey(param.key) && param.value is String;
  bool get hasFutures => state.allParams.entries.any(isAsyncParam);
  Future<bool> completeFutures() => Future.wait(
        state.allParams.entries.where(isAsyncParam).map(
          (param) async {
            final doc = await asyncParams[param.key]!(param.value)
                .onError((_, __) => null);
            if (doc != null) {
              futureParamValues[param.key] = doc;
              return true;
            }
            return false;
          },
        ),
      ).onError((_, __) => [false]).then((v) => v.every((e) => e));

  dynamic getParam<T>(
    String paramName,
    ParamType type, {
    bool isList = false,
    List<String>? collectionNamePath,
    StructBuilder<T>? structBuilder,
  }) {
    if (futureParamValues.containsKey(paramName)) {
      return futureParamValues[paramName];
    }
    if (!state.allParams.containsKey(paramName)) {
      return null;
    }
    final param = state.allParams[paramName];
    // Got parameter from `extras`, so just directly return it.
    if (param is! String) {
      return param;
    }
    // Return serialized value.
    return deserializeParam<T>(
      param,
      type,
      isList,
      collectionNamePath: collectionNamePath,
      structBuilder: structBuilder,
    );
  }
}

class FFRoute {
  const FFRoute({
    required this.name,
    required this.path,
    required this.builder,
    this.requireAuth = false,
    this.asyncParams = const {},
    this.routes = const [],
  });

  final String name;
  final String path;
  final bool requireAuth;
  final Map<String, Future<dynamic> Function(String)> asyncParams;
  final Widget Function(BuildContext, FFParameters) builder;
  final List<GoRoute> routes;

  GoRoute toRoute(AppStateNotifier appStateNotifier) => GoRoute(
        name: name,
        path: path,
        redirect: (context, state) {
          if (appStateNotifier.shouldRedirect) {
            final redirectLocation = appStateNotifier.getRedirectLocation();
            appStateNotifier.clearRedirectLocation();
            return redirectLocation;
          }

          if (requireAuth && !appStateNotifier.loggedIn) {
            appStateNotifier.setRedirectLocationIfUnset(state.uri.toString());
            return '/splashPage';
          }
          return null;
        },
        pageBuilder: (context, state) {
          fixStatusBarOniOS16AndBelow(context);
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = appStateNotifier.loading
              ? Center(
                  child: SizedBox(
                    width: 50.0,
                    height: 50.0,
                    child: SpinKitFadingCircle(
                      color: FlutterFlowTheme.of(context).primary,
                      size: 50.0,
                    ),
                  ),
                )
              : PushNotificationsHandler(child: page);

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  name: state.name,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) =>
                          PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).buildTransitions(
                    context,
                    animation,
                    secondaryAnimation,
                    child,
                  ),
                )
              : MaterialPage(
                  key: state.pageKey, name: state.name, child: child);
        },
        routes: routes,
      );
}

class TransitionInfo {
  const TransitionInfo({
    required this.hasTransition,
    this.transitionType = PageTransitionType.fade,
    this.duration = const Duration(milliseconds: 300),
    this.alignment,
  });

  final bool hasTransition;
  final PageTransitionType transitionType;
  final Duration duration;
  final Alignment? alignment;

  static TransitionInfo appDefault() => TransitionInfo(hasTransition: false);
}

class RootPageContext {
  const RootPageContext(this.isRootPage, [this.errorRoute]);
  final bool isRootPage;
  final String? errorRoute;

  static bool isInactiveRootPage(BuildContext context) {
    final rootPageContext = context.read<RootPageContext?>();
    final isRootPage = rootPageContext?.isRootPage ?? false;
    final location = GoRouterState.of(context).uri.toString();
    return isRootPage &&
        location != '/' &&
        location != rootPageContext?.errorRoute;
  }

  static Widget wrap(Widget child, {String? errorRoute}) => Provider.value(
        value: RootPageContext(true, errorRoute),
        child: child,
      );
}

extension GoRouterLocationExtension on GoRouter {
  String getCurrentLocation() {
    final RouteMatch lastMatch = routerDelegate.currentConfiguration.last;
    final RouteMatchList matchList = lastMatch is ImperativeRouteMatch
        ? lastMatch.matches
        : routerDelegate.currentConfiguration;
    return matchList.uri.toString();
  }
}
