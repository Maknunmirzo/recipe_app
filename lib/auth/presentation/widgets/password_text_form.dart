import 'package:flutter/material.dart';
import 'package:recipe_app/core/utils/colors.dart';

class PasswordTextForm extends StatelessWidget {
  const PasswordTextForm({
    super.key,
    required this.controller, required this.label,
  });

  final TextEditingController controller;
  final String label;


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,style: TextStyle(
          color: Color(0xffFFFDF9),
          fontSize: 15,
          fontWeight: FontWeight.w500,

        ),),
        SizedBox(height: 10,),
        SizedBox(
            width: double.infinity,
            height: 47,
            child: TextFormField(
              controller: controller,
              textAlignVertical: TextAlignVertical.top,
              cursorHeight: 20,
              style: TextStyle(
                  color: AppColors.redPinkMain,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  height: 1),
              decoration: InputDecoration(
                  hintText: "●●●●●●●",
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(18)),
                  contentPadding: EdgeInsets.symmetric(horizontal: 36),
                  hintStyle: TextStyle(
                    color: AppColors.beigeColor.withValues(alpha: 0.6),
                    fontSize: 16,
                    height: 1,
                  ),
                  filled: true,
                  fillColor: AppColors.pink),
              obscureText: false,
              obscuringCharacter: "●",
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your password';
                } else if (value.length < 6) {
                  return 'Password must be at least 6 characters';
                }
                return null;
              },
            )),
      ],
    );
  }
}
