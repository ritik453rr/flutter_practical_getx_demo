import 'package:get/get.dart';
import 'package:getx_demo/screens/age_selection/age_selection_binding.dart';
import 'package:getx_demo/screens/age_selection/age_selection_view.dart';
import 'package:getx_demo/screens/calendar/calendar_binding.dart';
import 'package:getx_demo/screens/calendar/calendar_view.dart';
import 'package:getx_demo/screens/refresh_page/comments/comment_page_binding.dart';
import 'package:getx_demo/screens/refresh_page/comments/comment_page_view.dart';
import 'package:getx_demo/screens/refresh_page/todos/todos_binding.dart';
import 'package:getx_demo/screens/refresh_page/todos/todos_view.dart';
import 'package:getx_demo/screens/splash/splash_binding.dart';
import 'package:getx_demo/screens/verify_phone/verify_phone_binding.dart';
import 'package:getx_demo/screens/verify_phone/verify_phone_view.dart';
import 'package:getx_demo/routing/app_routes.dart';

import '../screens/splash/splash_view.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: AppRoutes.routeAgeSelection,
      page: () => const AgeSelectionView(),
      binding: AgeSelectionBinding(),
    ),
    GetPage(
      name: AppRoutes.routeVerifyPhone,
      page: () => const VerifyPhoneView(),
      binding: VerifyPhonBinding(),
    ),
    GetPage(
      name: AppRoutes.routeCalendar,
      page: () => const CalendarView(),
      binding: CalendarBinding(),
    ),
    GetPage(
      name: AppRoutes.routeComments,
      page: () => const CommentPageView(),
      binding: CommentPageBinding(),
    ),
    GetPage(
      name: AppRoutes.routeSplash,
      page: () => SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: AppRoutes.routeTodos,
      page: () => const TodosView(),
      binding: TodosBinding(),
    ),
  ];
}
