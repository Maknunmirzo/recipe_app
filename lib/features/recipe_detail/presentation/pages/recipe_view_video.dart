import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/core/presentation/widgets/recipe_app_bar.dart';
import 'package:recipe_app/core/utils/colors.dart';

import 'package:recipe_app/features/recipe_detail/presentation/manager/recipe_view_video_view_model.dart';
import 'package:video_player/video_player.dart';

class RecipeViewVideo extends StatelessWidget {
  const RecipeViewVideo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var vm = context.watch<RecipeViewVideoViewModel>();
    return Scaffold(
      appBar: RecipeAppBar(
        backTap: () {
          Navigator.pop(context);
        },
        action1Tap: () {
          showDialog(
            useSafeArea: true,
            context: context,
            builder: (context) => Center(
                child: Container(
              width: 300,
              height: 80,
              padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(20)),
              child: Column(
                children: [
                  Text(
                    "Volume",
                    style: TextStyle(
                      color: AppColors.redPinkMain,
                      fontWeight: FontWeight.w700,
                      fontSize: 19,
                    ),
                  ),
                  Row(
                    children: [
                     IconButton(onPressed: (){}, icon:  Icon(Icons.add,color: AppColors.redPinkMain,),),
                      IconButton(onPressed: (){}, icon:  Icon(Icons.add_circle,color: AppColors.redPinkMain,),),

                    ],
                  )
                ],
              ),
            )),
          );
        },
        action2Tap: () {},
        action1: "assets/svg/share.svg",
        action2: "assets/svg/plus.svg",
        title: vm.title,
      ),
      body: Center(
        child: AspectRatio(
          aspectRatio: vm.controller.value.aspectRatio,
          child: Stack(
            children: [
              VideoPlayer(vm.controller),
              Positioned(
                left: 0,
                right: 0,
                bottom: 40,
                child:
                    VideoProgressIndicator(vm.controller, allowScrubbing: true),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
