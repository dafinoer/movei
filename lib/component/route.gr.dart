// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i1;
import 'package:flutter/material.dart' as _i2;
import 'package:movei/main.dart' as _i3;
import 'package:movei/ui/page/create_page.dart' as _i5;
import 'package:movei/ui/page/detail_page.dart' as _i4;

class MovieRouter extends _i1.RootStackRouter {
  MovieRouter([_i2.GlobalKey<_i2.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i1.PageFactory> pagesMap = {
    MyHomePageRoute.name: (routeData) => _i1.AdaptivePage<dynamic>(
        routeData: routeData,
        builder: (data) {
          final args = data.argsAs<MyHomePageRouteArgs>(
              orElse: () => const MyHomePageRouteArgs());
          return _i3.MyHomePage(key: args.key);
        }),
    DetailPageRoute.name: (routeData) => _i1.AdaptivePage<dynamic>(
        routeData: routeData,
        builder: (data) {
          final pathParams = data.pathParams;
          final args = data.argsAs<DetailPageRouteArgs>(
              orElse: () =>
                  DetailPageRouteArgs(keyId: pathParams.getString('keyId')));
          return _i4.DetailPage(key: args.key, keyId: args.keyId);
        }),
    CreatePageRoute.name: (routeData) => _i1.AdaptivePage<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i5.CreatePage();
        })
  };

  @override
  List<_i1.RouteConfig> get routes => [
        _i1.RouteConfig(MyHomePageRoute.name, path: '/'),
        _i1.RouteConfig(DetailPageRoute.name, path: '/detail/:id'),
        _i1.RouteConfig(CreatePageRoute.name, path: '/create')
      ];
}

class MyHomePageRoute extends _i1.PageRouteInfo<MyHomePageRouteArgs> {
  MyHomePageRoute({_i2.Key? key})
      : super(name, path: '/', args: MyHomePageRouteArgs(key: key));

  static const String name = 'MyHomePageRoute';
}

class MyHomePageRouteArgs {
  const MyHomePageRouteArgs({this.key});

  final _i2.Key? key;
}

class DetailPageRoute extends _i1.PageRouteInfo<DetailPageRouteArgs> {
  DetailPageRoute({_i2.Key? key, required String keyId})
      : super(name,
            path: '/detail/:id',
            args: DetailPageRouteArgs(key: key, keyId: keyId),
            rawPathParams: {'keyId': keyId});

  static const String name = 'DetailPageRoute';
}

class DetailPageRouteArgs {
  const DetailPageRouteArgs({this.key, required this.keyId});

  final _i2.Key? key;

  final String keyId;
}

class CreatePageRoute extends _i1.PageRouteInfo {
  const CreatePageRoute() : super(name, path: '/create');

  static const String name = 'CreatePageRoute';
}
