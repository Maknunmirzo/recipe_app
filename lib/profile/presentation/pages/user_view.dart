import 'package:flutter/material.dart';
import 'package:recipe_app/profile/presentation/pages/user_view_model.dart';

class UserView extends StatelessWidget {
  const UserView({super.key, required this.viewModel, required this.userId});

  final UserViewModel viewModel;
  final int userId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(viewModel.user != null
            ? viewModel.user!.fullName
            : "Ism mavjud emas"),
      ),
      body: Placeholder(),
    );
  }
}
