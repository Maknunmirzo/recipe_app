import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:recipe_app/auth/presentation/manager/auth_view_model.dart';
import 'package:recipe_app/auth/presentation/widgets/auth_form_text.dart';
import 'package:recipe_app/auth/presentation/widgets/auth_social.dart';

import 'package:recipe_app/auth/presentation/widgets/password_text_form.dart';
import 'package:recipe_app/core/presentation/widgets/recipe_elevated_button.dart';
import 'package:recipe_app/core/utils/colors.dart';

class AuthView extends StatelessWidget {
  const AuthView({super.key, required this.vm});

  final AuthViewModel vm;

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: vm,
      builder: (context, child) => Scaffold(
        appBar: AppBar(
          toolbarHeight: 40,
          title: Text(
            "Login",
            style: TextStyle(
              color: AppColors.redPinkMain,
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
          centerTitle: true,
        ),
        body: ListView(
          padding: EdgeInsets.only(top: 152, bottom: 100),
          children: [
            Form(
              key: vm.formKey,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  spacing: 10,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    AuthFormText(
                      errorText: (vm.hasError) ? vm.errorMessage : null,
                      label: "Login",
                      controller: vm.loginController,
                      hintText: "login",
                      validator: (jnj) {
                        return null;
                      },
                    ),
                    SizedBox(height: 10),
                    PasswordTextForm(
                      isShowPassword: vm.showObscureText,
                      suffixOnTap: () {
                        vm.showPassword();
                      },
                      controller: vm.passwordController,
                      errorText: (vm.hasError)? vm.errorMessage!:null,
                      label: "Password",
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: 50),
            // Text(
            //   (vm.hasError) ? vm.errorMessage! : "erroer yo'q",
            //   style: TextStyle(color: Colors.red),
            // ),
            Center(
              child: RecipeElevatedButton(
                text: "Login",
                callback: () async {
                  if (vm.formKey.currentState!.validate()) {
                    if (await vm.login() && context.mounted) {
                      context.go("/categories");
                    }
                  }
                },
                size: Size(207, 45),
              ),
            ),
            SizedBox(height: 27),
            Center(
              child: RecipeElevatedButton(
                text: "Sign Up",
                callback: () {
                  context.go("/SignUp");
                },
                size: Size(207, 45),
              ),
            ),
            SizedBox(height: 65),
            Center(
              child: Text(
                "Forgot Password?",
                style: TextStyle(
                  color: Color(0xffFFFDF9),
                  fontSize: 15,
                  fontFamily: "League Spartan",
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            SizedBox(height: 40),
            Center(
              child: Text(
                "or sign up with",
                style: TextStyle(
                  color: Color(0xffFFFDF9),
                  fontSize: 15,
                  fontFamily: "League Spartan",
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: SizedBox(
                width: 200,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    AuthSocial(icon: "assets/svg/insta.svg"),
                    AuthSocial(icon: "assets/svg/google.svg"),
                    AuthSocial(icon: "assets/svg/facebook.svg"),
                    AuthSocial(icon: "assets/svg/whatsapp.svg"),
                  ],
                ),
              ),
            ),
            SizedBox(height: 55),
            GestureDetector(
              onTap:  () {
                context.go("/signUp");
              },
              child: Center(
                child: Text(
                  "Don’t have an account? Sign Up",
                  style: TextStyle(
                    color: Color(0xffFFFDF9),
                    fontSize: 15,
                    fontFamily: "League Spartan",
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
