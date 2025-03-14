import 'package:get/get.dart';
import 'package:getx_demo/screens/expension_tile/expension_tile_binding.dart';
import 'package:getx_demo/screens/expension_tile/expension_tile_view.dart';
import 'package:getx_demo/screens/number_picker/number_picker_binding.dart';
import 'package:getx_demo/screens/number_picker/number_picker_view.dart';
import 'package:getx_demo/screens/date_time/date_time_binding.dart';
import 'package:getx_demo/screens/date_time/date_time_view.dart';
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
      name: AppRoutes.numberPicker,
      page: () => const NumberPickerView(),
      binding: NumberPickerBinding(),
    ),
    GetPage(
      name: AppRoutes.routeVerifyPhone,
      page: () => const VerifyPhoneView(),
      binding: VerifyPhonBinding(),
    ),
    GetPage(
      name: AppRoutes.dateTime,
      page: () => const DateTimeView(),
      binding: DateTimeBinding(),
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
    GetPage(
      name: AppRoutes.expensionTile,
      page: () => const ExpensionTileView(),
      binding: ExpensionTileBinding(),
    ),
  ];
}
