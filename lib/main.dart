import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/core/l10n/app_localization.dart';
import 'package:recipe_app/core/routing/router.dart' show router;
import 'core/localization_view_model.dart';
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
      builder: (context,child)=>MaterialApp.router(
        theme: appThemeData,
        debugShowCheckedModeBanner: false,
        routerConfig: router,
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          AppLocalizations.delegate
        ],
        supportedLocales: [
          Locale("uz"),
          Locale("en"),
        ],
        locale: context.watch<LocalizationViewModel>().currentLocale,
      ),
    );
  }
}
