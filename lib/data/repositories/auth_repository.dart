import 'dart:convert';

import 'package:petdemo/data/local/local_data.dart';
import 'package:petdemo/data/models/request/user_request_model.dart';
import 'package:petdemo/data/models/user_model.dart';
import 'package:petdemo/data/settings/endpoints.dart';
import 'package:petdemo/utils/http_utils.dart';

abstract class AuthRepository {
  Future<void> login(UserRequestModel userRequestModel);

  Future<void> register(UserRequestModel userRequestModel);
}

class AuthRepositoryImpl extends AuthRepository {
  @override
  Future<void> login(UserRequestModel userRequestModel) async {
    final response =
        await HttpHelper.post(Endpoints.login, data: userRequestModel.toJson());
    final userData = UserModel.fromJson(response.data[0]);
    LocalData.shared.saveUserData(jsonEncode(userData));
    LocalData.shared.accessToken = userData.token!;
  }

  @override
  Future<void> register(UserRequestModel userRequestModel) async {
    final response = await HttpHelper.post(Endpoints.register,
        data: userRequestModel.toJson());
    final UserModel userModel = UserModel.fromJson(response.data[0]);
    LocalData.shared.saveUserData(jsonEncode(userModel));
  }
}
