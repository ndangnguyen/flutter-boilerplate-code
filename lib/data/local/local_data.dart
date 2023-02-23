import 'dart:convert';

import 'package:get_storage/get_storage.dart';
import 'package:petdemo/data/models/user_model.dart';

abstract class Keys {
  static const ACCESS_TOKEN = 'accessToken';
  static const USER_DATA = 'userData';
  static const STRING_ASSET_LOADED = 'stringsL';
  static const IMAGE_ASSET_LOADED = 'imagesL';
}

class LocalData {
  static final LocalData shared = LocalData();

  final GetStorage _storage = GetStorage();

  set accessToken(String token) {
    _storage.write(Keys.ACCESS_TOKEN, token);
  }

  String get accessToken {
    return _storage.read(Keys.ACCESS_TOKEN);
  }

  void saveUserData(String userData) {
    _storage.write(Keys.USER_DATA, userData);
  }

  UserModel? get userData {
    try {
      final String userJson = _storage.read(Keys.USER_DATA);
      return UserModel.fromJson(jsonDecode(userJson));
    } catch (_) {
      return null;
    }
  }

  bool isStringsAssetLoaded() {
    return _storage.hasData(Keys.STRING_ASSET_LOADED);
  }

  bool isImagesAssetLoaded() {
    return _storage.hasData(Keys.IMAGE_ASSET_LOADED);
  }

  void setStringsAssetLoaded() {
    _storage.write(Keys.STRING_ASSET_LOADED, 'true');
  }

  void setImagesAssetLoaded() {
    _storage.write(Keys.IMAGE_ASSET_LOADED, 'true');
  }

  void clearData() {
    _storage.erase();
  }
}
