import 'package:recipe_app/core/client.dart';
import 'package:recipe_app/core/secure_storage.dart';

import '../../../profile/data/models/user_model.dart';
import '../models/sign_up_user_model.dart';

class UserRepository {
  final ApiClient client;

  UserRepository({required this.client});

  Future<bool> signUp({
    required String name,
    required String surname,
    required String username,
    required String email,
    required String phoneNumber,
    required DateTime dateOfBirth,
    required String password,
  }) async {
    final result = await client.signUp(
        user: SignUpUserModel(
      password: password,
      email: email,
      username: username,
      name: name,
      surname: surname,
      dateOfBirth: dateOfBirth,
      phoneNumber: phoneNumber,
    ));
    if(result["result"]) {
      SecureStorage.deleteToken();
      SecureStorage.saveToken(token: result["token"]);
      SecureStorage.deleteCredentials();
      SecureStorage.saveCredentials(login: phoneNumber, password: password);
      return true;
    }else{
      return false;
    }
  }

  UserModel? user;

  Future<UserModel> fetchUser(int userId) async {
    if (user != null) return user!;
    var rawUser = await client.fetchUser(userId);
    user = UserModel.fromJson(rawUser);
    return user!;
  }


  Future<void> login({required String login, required String password}) async {
    final String token = await client.login(login:login, password:password);
    await SecureStorage.deleteCredentials();
    await SecureStorage.saveCredentials(login: login, password: password);
    await SecureStorage.deleteToken();
    await SecureStorage.saveToken(token: token);
  }

  Future logout()async{
    await SecureStorage.deleteToken();
    await SecureStorage.deleteCredentials();
  }

}
