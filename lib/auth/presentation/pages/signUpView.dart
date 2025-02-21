import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/auth/presentation/manager/sign_up_view_model.dart';
import 'package:recipe_app/auth/presentation/widgets/sign_up_view_login_texts.dart';
import 'package:recipe_app/auth/presentation/widgets/auth_form_text.dart';
import 'package:recipe_app/auth/presentation/widgets/password_text_form.dart';

import '../../../core/presentation/widgets/recipe_elevated_button.dart';
import '../../../core/utils/colors.dart';
import '../widgets/sign_date_of_birth.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SignUpViewModel>(
      create: (context) => SignUpViewModel(repo: context.read()),
      builder: (context, child) {
        var vm=context.watch<SignUpViewModel>();
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
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
            children: [
              Form(
                key: vm.formKey,
                child: Column(
                  spacing: 10,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AuthFormText(
                      controller: vm.nameController,
                      hintText: "Maknun",
                      validator: (value) => null,
                      label: "Name",
                      errorText: null,
                    ),
                    AuthFormText(
                      controller: vm.surnameController,
                      hintText: "Mirzo",
                      validator: (value) => null,
                      label: "Surname",
                      errorText: null,
                    ),
                    AuthFormText(
                      controller: vm.usernameController,
                      hintText: "@maknunmirzo",
                      validator: (value) => null,
                      label: "Username",
                      errorText: null,
                    ),
                    AuthFormText(
                      controller: vm.emailController,
                      hintText: "example@example.com",
                      validator: (value) => null,
                      label: "Email",
                      errorText: null,
                    ),
                    AuthFormText(
                        controller: vm.numberController,
                        hintText: "+ 123 456 789",
                        validator: (value) => null,
                        label: "Mobile Number",
                        errorText: null,
                      ),
                    SignDateOfBirth(),
                    PasswordTextForm(
                      isShowPassword: vm.showObscureText,
                      suffixOnTap: () {vm.showPassword();},
                      controller: vm.passwordController,
                      errorText: null,
                      label: "Password",
                      validator: (value){
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        } else if (value.length < 6) {
                          return 'Password must be at least 6 characters';
                        }
                        return null;
                      },

                    ),
                    PasswordTextForm(
                      isShowPassword: vm.confirmShowObscureText,
                      suffixOnTap: () {vm.confirmShowPassword();},
                      controller: vm.confirmPasswordController,
                      label: "Confirm Password",
                      errorText: null,
                      validator: (value){
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        } else if (value.length < 6) {
                          return 'Password must be at least 6 characters';
                        }
                        if(vm.passwordController.text!=vm.confirmPasswordController.text) {
                          return "passwords are not match";
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              ),
              SignUpViewDescription(),
              Center(
                child: RecipeElevatedButton(
                  text: "Sign Up",
                  callback: () async {
                    if(vm.formKey.currentState!.validate())
                    {
                      if(await vm.signUp()&&context.mounted) {
                        showDialog(
                        context: context,
                      useSafeArea: true,
                      barrierColor: Colors.black54,
                      barrierDismissible: true,
                      builder: (BuildContext context) {
                        return Center(
                          child: Dialog(
                            backgroundColor: Colors.white,
                            elevation: 10,
                            clipBehavior: Clip.antiAlias,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(40)),
                            child: Container(
                              width: 250,
                              height: 286,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 45, vertical: 20),
                              decoration: BoxDecoration(),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    width: 133,
                                    child: Text(
                                      "Sign up Succesful!",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontFamily: "Poppins",
                                          color: Colors.black,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                  Container(
                                    width: 83,
                                    height: 83,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(42),
                                      color: AppColors.pink,
                                    ),
                                    child: Center(
                                      child: SvgPicture.asset(
                                        "assets/svg/bottom/profile.svg",
                                        width: 30,
                                        height: 42,
                                        colorFilter: ColorFilter.mode(
                                          AppColors.redPinkMain,
                                          BlendMode.srcIn,
                                        ),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        "Lorem ipsum dolor sit amet pretium cras"
                                        " id dui pellentesque ornare."
                                        " Quisque malesuada.",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontFamily: "Poppins",
                                          color: Colors.black,
                                          fontSize: 13,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    );
                      }
                    }
                  },
                  size: Size(194, 45),
                  backgroundColor: AppColors.redPinkMain,
                  foregroundColor: Colors.white,
                ),
              ),
              SizedBox(height: 10),
              SignUpViewLoginText()
            ],
          ),
        );
      },
    );
  }
}
