import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ImagesProvider {
  static ImagesProvider to = Get.find();

  String remoteUrl = "";

  Future downloadAssets({progressCallback}) {
    return Future.value();
  }

  Future init(String assetFolder);

  ImageProvider get(String id);

  String path(String id);

  Widget svg(
    String id, {
    double? width,
    double? height,
    AlignmentGeometry alignment = Alignment.center,
    BoxFit boxFit = BoxFit.contain,
    Color? color,
  });
}
