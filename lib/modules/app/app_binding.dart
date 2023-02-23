import 'package:get/get.dart';
import 'package:petdemo/data/repositories/main_repository.dart';

import 'app_controller.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<MainRepository>(MainRepositoryImpl());
    Get.put(AppController());
  }
}
