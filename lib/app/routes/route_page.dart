import 'package:get/get.dart';
import 'package:tugas3_mobile_teori/app/modules/lbs_tracking/lbs_tracking_view.dart';
import 'package:tugas3_mobile_teori/app/modules/login/login_view.dart';
import 'package:tugas3_mobile_teori/app/modules/main/main_view.dart';
import 'package:tugas3_mobile_teori/app/modules/number/number_view.dart';
import 'package:tugas3_mobile_teori/app/modules/site_favorite/site_favorite_view.dart';
import 'package:tugas3_mobile_teori/app/modules/site_recommend/site_recommend_view.dart';
import 'package:tugas3_mobile_teori/app/modules/splash/splash_view.dart';
import 'package:tugas3_mobile_teori/app/modules/stopwatch/stopwatch_view.dart';
import 'package:tugas3_mobile_teori/app/modules/time_convert/time_convert_view.dart';
import 'package:tugas3_mobile_teori/app/routes/route_name.dart';

class RoutePage {
  static List<GetPage<dynamic>> routes = [
    GetPage(
      name: RouteName.splash,
      page: () => SplashView(),
    ),
    GetPage(
      name: RouteName.login,
      page: () => LoginView(),
    ),
    GetPage(
      name: RouteName.main,
      page: () => MainView(),
    ),
    GetPage(
      name: RouteName.stopwatch,
      page: () => StopwatchView(),
    ),
    GetPage(
      name: RouteName.number,
      page: () => NumberView(),
    ),
    GetPage(
      name: RouteName.lbsTracking,
      page: () => LbsTrackingView(),
    ),
    GetPage(
      name: RouteName.timeConvert,
      page: () => TimeConvertView(),
    ),
    GetPage(
      name: RouteName.siteRecommend,
      page: () => SiteRecommendView(),
    ),
    GetPage(
      name: RouteName.siteFavorite,
      page: () => SiteFavoriteView(),
    ),
  ];
}
