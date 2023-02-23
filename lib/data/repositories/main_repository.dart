import 'package:petdemo/data/models/user_model.dart';
import 'package:petdemo/data/settings/endpoints.dart';
import 'package:petdemo/utils/http_utils.dart';

abstract class MainRepository {
  Future<UserModel> refreshUserData();
}

class MainRepositoryImpl extends MainRepository {
  @override
  Future<UserModel> refreshUserData() async {
    final response = await HttpHelper.dio.get(Endpoints.refresh);
    return UserModel.fromJson(response.data["user"]);
  }
}
