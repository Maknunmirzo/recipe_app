import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:recipe_app/core/routing/routes.dart';

import '../../../core/utils/colors.dart';

class SignUpViewLoginText extends StatelessWidget {
  const SignUpViewLoginText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.go(Routes.login);
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
    );
  }
}



class SignUpViewDescription extends StatelessWidget {
  const SignUpViewDescription({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
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
                height: 0.9,
              ),
            ),
          ),
          SizedBox(height: 30),
        ],
      ),
    );
  }
}

