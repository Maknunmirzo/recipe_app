import 'package:recipe_app/auth/data/models/sign_up_user_model.dart';
import 'package:recipe_app/core/client.dart';

class SignUpRepository {
  final ApiClient client;

  SignUpRepository({required this.client});

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
    return result;
  }
}
