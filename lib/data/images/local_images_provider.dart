import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:petdemo/data/images/images_provider.dart';
import 'package:petdemo/data/local/local_data.dart';

class LocalImagesProvider extends ImagesProvider {
  @override
  Future init(String assetFolder) async {
    LocalData.shared.setImagesAssetLoaded();
  }

  @override
  ImageProvider get(String id) {
    return AssetImage("assets/images/$id");
  }

  @override
  Widget svg(
    String id, {
    double? width,
    double? height,
    AlignmentGeometry alignment = Alignment.center,
    BoxFit boxFit = BoxFit.contain,
    Color? color,
  }) {
    return SvgPicture.asset(
      "assets/images/$id",
      width: width,
      height: height,
      alignment: alignment,
      fit: boxFit,
      color: color,
    );
  }

  @override
  String path(String id) {
    return "assets/images/$id";
  }
}
