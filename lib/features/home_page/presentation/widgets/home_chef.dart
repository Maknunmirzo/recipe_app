import 'package:flutter/material.dart';

class HomeChef extends StatelessWidget {
  const HomeChef({super.key, required this.image, required this.name});

  final String image, name;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 3,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(7),
          child: Image.network(
            image,
            fit: BoxFit.cover,
            width: 82,
            height: 74,
          ),
        ),
        Text(
          name,
          style: TextStyle(
            color: Colors.white,
            fontFamily: "Poppins",
            fontWeight: FontWeight.w400,
            fontSize: 12,
          ),
        )
      ],
    );
  }
}
