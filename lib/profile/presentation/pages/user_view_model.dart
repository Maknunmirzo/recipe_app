import 'package:flutter/material.dart';
import 'package:recipe_app/profile/data/models/user_model.dart';
import 'package:recipe_app/profile/data/repositories/user_repository.dart';

class UserViewModel extends ChangeNotifier{
   UserRepository _repo;
   final int  userId;
   UserModel ?user;
   bool loading=false;

   UserViewModel({required UserRepository repo, required this.userId }):_repo=repo{
     load();
   }

   Future<void> load() async{
     loading=true;
     user=await _repo.fetchUser(userId);
     notifyListeners();
   }
}