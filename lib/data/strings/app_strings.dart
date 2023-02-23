import 'package:get/get.dart';

abstract class Strings {
  static const appTitle = 'appTitle';
  static const baseUrl = 'baseUrl';
  static const errorMessage = 'errorMessage';
}

extension StringsProviderExt on String {
  String get get => tr;
}
