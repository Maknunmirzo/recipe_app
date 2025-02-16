import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:recipe_app/auth/presentation/widgets/auth_form_text.dart';
import 'package:recipe_app/auth/presentation/widgets/password_text_form.dart';

import '../../../core/presentation/widgets/recipe_elevated_button.dart';
import '../../../core/utils/colors.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 40,
        title: Text(
          "Sign up",
          style: TextStyle(
            color: AppColors.redPinkMain,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 90),
        children: [
          Form(
            child: Column(
              spacing: 10,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: AuthFormText(
                    controller: TextEditingController(),
                    hintText: "Maknun mirzo",
                    validator: (value) => value,
                    label: "Full Name",
                    errorText: null,
                  ),
                ),
                Center(
                  child: AuthFormText(
                    controller: TextEditingController(),
                    hintText: "example@example.com",
                    validator: (value) => value,
                    label: "Email",
                    errorText: null,
                  ),
                ),
                Center(
                  child: AuthFormText(
                    controller: TextEditingController(),
                    hintText: "+ 123 456 789",
                    validator: (value) => value,
                    label: "Mobile Number",
                    errorText: null,
                  ),
                ),
                Center(
                  child: AuthFormText(
                    controller: TextEditingController(),
                    hintText: "DD / MM /YYY",
                    validator: (value) => value,
                    label: "Date of birth",
                    errorText: null,
                  ),
                ),
                PasswordTextForm(
                 isShowPassword: true,
                  suffixOnTap: () {},
                  controller: TextEditingController(),
                  errorText: null,
                  label: "Password",
                ),
                PasswordTextForm(
                  isShowPassword: true,
                  suffixOnTap: () {},
                  controller: TextEditingController(),
                  label: "Confirm Password",
                  errorText: null,
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Center(
            child: Text(
              "By continuing, you agree to ",
              style: TextStyle(
                  color: Color(0xffFFFDF9),
                  fontSize: 14,
                  fontFamily: "League Spartan",
                  fontWeight: FontWeight.w400,
                  height: 1),
            ),
          ),
          Center(
            child: Text(
              "Terms of Use and Privacy Policy.",
              style: TextStyle(
                  color: Color(0xffFFFDF9),
                  fontSize: 14,
                  fontFamily: "League Spartan",
                  fontWeight: FontWeight.w600,
                  height: 0.9),
            ),
          ),
          SizedBox(height: 30),
          Center(
            child: RecipeElevatedButton(
              text: "Sign Up",
              callback: () {},
              size: Size(194, 45),
              backgroundColor: AppColors.redPinkMain,
              foregroundColor: Colors.white,
            ),
          ),
          SizedBox(height: 10),
          GestureDetector(
            onTap: () {
              context.go("/auth");
            },
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 6,
                children: [
                  Text(
                    "Already have an account?",
                    style: TextStyle(
                      color: Color(0xffFFFDF9),
                      fontSize: 13,
                      fontFamily: "League Spartan",
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  Text(
                    "Log In",
                    style: TextStyle(
                      color: AppColors.redPinkMain,
                      fontSize: 13,
                      fontFamily: "League Spartan",
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
