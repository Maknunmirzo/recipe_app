import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/core/routing/router.dart' show router;
import 'core/providers.dart';
import 'core/utils/theme.dart';

void main() {
  runApp(RecipeApp());
}

class RecipeApp extends StatelessWidget {
  const RecipeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers,
      child: MaterialApp.router(
        theme: appThemeData,
        debugShowCheckedModeBanner: false,
        routerConfig: router,
      ),
    );
  }
}
