import 'package:get/get.dart';
import 'package:petdemo/modules/home/bindings/home_binding.dart';
import 'package:petdemo/modules/home/screens/home_page.dart';

class Routes {
  static const HOME = '/home';
  static const MAIN = '/main';
  static const AUTH = '/auth';
  static const NO_INTERNET = '/noInternet';
}

class AppPages {
  static final pages = [
    GetPage(
      name: Routes.HOME,
      page: () => const HomePage(),
      binding: HomeBinding(),
      transition: Transition.fadeIn,
    ),
  ];
}
