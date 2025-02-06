import 'package:flutter/material.dart';
import 'package:recipe_app/core/utils/colors.dart';
import 'package:recipe_app/onboarding/presentation/pages/onboarding_view_model.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({
    super.key,
    required this.viewModel,
  });

  final OnboardingViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: viewModel,
      builder: (context, _) => Scaffold(
        backgroundColor: AppColors.beigeColor,
        body: ListView.separated(
          itemCount: viewModel.onboardings.length,
          itemBuilder: (context, index) => Text(
            viewModel.onboardings[index].title,
            style: TextStyle(color: Colors.white),
          ),
          separatorBuilder: (context, index) => Text(
            "ishladi",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
