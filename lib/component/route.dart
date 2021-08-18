import 'package:auto_route/annotations.dart';
import 'package:movei/main.dart';
import 'package:movei/ui/page/create_page.dart';
import 'package:movei/ui/page/detail_page.dart';

@AdaptiveAutoRouter(routes: <AutoRoute>[
  MyHomePage.route,
  DetailPage.route,
  CreatePage.route
])
class $MovieRouter {}
