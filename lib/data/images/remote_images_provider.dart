import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:petdemo/data/images/app_images.dart';
import 'package:petdemo/data/images/images_provider.dart';
import 'package:petdemo/utils/http_utils.dart';

class RemoteImagesProvider extends ImagesProvider {
  late String savedFolder;

  @override
  Future init(String assetFolder) async {
    savedFolder = (await Directory("$assetFolder/images").create()).path;
  }

  @override
  ImageProvider get(String id) {
    final fileImage = File("$savedFolder/$id");
    if (fileImage.existsSync()) {
      return FileImage(fileImage);
    } else {
      return AssetImage("assets/images/$id");
    }
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
    final fileImage = File("$savedFolder/$id");
    if (fileImage.existsSync()) {
      return SvgPicture.file(
        fileImage,
        width: width,
        height: height,
        alignment: alignment,
        fit: boxFit,
      );
    } else {
      return SvgPicture.asset(
        "assets/images/$id",
        width: width,
        height: height,
        alignment: alignment,
        fit: boxFit,
        color: color,
      );
    }
  }

  @override
  Future downloadAssets({progressCallback}) async {
    final images = Images.container.toList();
    const subSize = 20;
    final List<List<String>> chunks = [];

    for (var i = 0; i < images.length; i += subSize) {
      final end = (i + subSize < images.length) ? i + subSize : images.length;
      chunks.add(images.sublist(i, end));
    }

    for (final sublist in chunks) {
      await Future.wait(
        sublist.map((image) {
          return HttpHelper.download("$remoteUrl/images/$image", savePath: "$savedFolder/$image");
        }),
      );
      progressCallback(sublist.length);
    }
  }

  @override
  String path(String id) {
    return "";
  }
}
