import 'package:recipe_app/core/client.dart';
import 'package:recipe_app/core/secure_storage.dart';

class AuthRepository {
  AuthRepository({required this.client});

  final ApiClient client;

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
