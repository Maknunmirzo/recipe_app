import 'package:flutter/cupertino.dart';
import 'package:recipe_app/auth/data/repositories/auth_repository.dart';

class AuthViewModel extends ChangeNotifier {

  AuthViewModel({required AuthRepository authRepo}):_authRepo=authRepo;
  final AuthRepository _authRepo;
  final TextEditingController loginController=TextEditingController();

  final TextEditingController passwordController=TextEditingController();

  final GlobalKey<FormState> formKey=GlobalKey<FormState>();
   String? _errorMessage;
   String? get errorMessage=>_errorMessage;

    bool showObscureText=false;
   bool get hasError=> _errorMessage!=null;


   Future<bool> login() async{
     try{
       await _authRepo.login(login: loginController.text, password: passwordController.text);
       _errorMessage=null;
       notifyListeners();
       return true;
     }on Exception catch(e){
       _errorMessage=e.toString();
       notifyListeners();
       return false;
     }

   }


   void showPassword(){
   showObscureText= !showObscureText;
     notifyListeners();
   }
}