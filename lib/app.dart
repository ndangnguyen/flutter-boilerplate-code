import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:petdemo/data/images/images_provider.dart';
import 'package:petdemo/data/images/local_images_provider.dart';
import 'package:petdemo/data/settings/routes.dart';
import 'package:petdemo/data/strings/app_strings.dart';
import 'package:petdemo/modules/app/app_binding.dart';
import 'package:petdemo/theme/theme.dart';

class App {
  ImagesProvider? _imagesProvider;

  Future init() async {
    _imagesProvider = Get.put<ImagesProvider>(LocalImagesProvider());
    final assetFolder = (await getApplicationSupportDirectory()).path;
    await _imagesProvider?.init(assetFolder);
  }

  Future run() async {
    final hasInternet =
        await Connectivity().checkConnectivity() != ConnectivityResult.none;
    KeyboardVisibilityController().onChange.listen((bool visible) {
      if (!visible) {
        SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
            overlays: SystemUiOverlay.values);
      }
    });
    runApp(
      GetMaterialApp(
        debugShowCheckedModeBanner: false,
        builder: (context, child) {
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
            child: child!,
          );
        },
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          DefaultCupertinoLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        locale: Get.deviceLocale,
        title: Strings.appTitle.get,
        theme: appThemeData,
        initialBinding: AppBinding(),
        initialRoute: hasInternet ? Routes.HOME : Routes.NO_INTERNET,
        getPages: AppPages.pages,
        defaultTransition: Transition.fadeIn,
      ),
    );
  }
}
