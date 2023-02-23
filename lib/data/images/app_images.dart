import 'package:flutter/material.dart';

import 'images_provider.dart';

abstract class Images {
  static const avatar = "avatar.png";

  static final container = {
    avatar,
  };
}

extension ImagesProviderExt on String {
  ImageProvider get img => ImagesProvider.to.get(this);

  String get path => ImagesProvider.to.path(this);

  Widget svg({
    double? width,
    double? height,
    AlignmentGeometry alignment = Alignment.center,
    BoxFit boxFit = BoxFit.contain,
    Color? color,
  }) {
    return ImagesProvider.to.svg(
      this,
      width: width,
      height: height,
      alignment: alignment,
      boxFit: boxFit,
      color: color,
    );
  }
}
