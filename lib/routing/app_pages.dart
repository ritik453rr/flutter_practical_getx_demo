import 'package:get/get.dart';
import 'package:getx_demo/pages/expension_tile/expension_tile_binding.dart';
import 'package:getx_demo/pages/expension_tile/expension_tile_view.dart';
import 'package:getx_demo/pages/number_picker/number_picker_binding.dart';
import 'package:getx_demo/pages/number_picker/number_picker_view.dart';
import 'package:getx_demo/pages/date_time/date_time_binding.dart';
import 'package:getx_demo/pages/date_time/date_time_view.dart';
import 'package:getx_demo/pages/pick_media/pick_media_binding.dart';
import 'package:getx_demo/pages/pick_media/pick_media_view.dart';
import 'package:getx_demo/pages/todos/todos_binding.dart';
import 'package:getx_demo/pages/todos/todos_view.dart';
import 'package:getx_demo/pages/splash/splash_binding.dart';
import 'package:getx_demo/pages/verify_phone/verify_phone_binding.dart';
import 'package:getx_demo/pages/verify_phone/verify_phone_view.dart';
import 'package:getx_demo/routing/app_routes.dart';
import '../pages/splash/splash_view.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: AppRoutes.numberPicker,
      page: () => const NumberPickerView(),
      binding: NumberPickerBinding(),
    ),
    GetPage(
      name: AppRoutes.verifyPhone,
      page: () => const VerifyPhoneView(),
      binding: VerifyPhonBinding(),
    ),
    GetPage(
      name: AppRoutes.dateTime,
      page: () => const DateTimeView(),
      binding: DateTimeBinding(),
    ),
    GetPage(
      name: AppRoutes.splash,
      page: () => SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: AppRoutes.todos,
      page: () => const TodosView(),
      binding: TodosBinding(),
    ),
    GetPage(
      name: AppRoutes.expensionTile,
      page: () => const ExpensionTileView(),
      binding: ExpensionTileBinding(),
    ),
    GetPage(
      name: AppRoutes.pickMedia,
      page: () => const PickMediaView(),
      binding: PickMediaBinding(),
    ),
  ];
}
