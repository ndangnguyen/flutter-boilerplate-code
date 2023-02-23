import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:petdemo/app.dart';


const enableLog = false;

App magicApp = App();

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  magicApp.init().then((value) => magicApp.run());
}
