import 'package:consult_app/config/theme/app_light_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'config/localization/flutter_localization_service.dart' show FlutterLocalizationService;
import 'config/routes/app_routes.dart' show AppRoutes;
import 'config/theme/app_dark_theme.dart';
import 'config/theme/theme_logjc/theme_logic_provider.dart';

class ConsultApp extends StatelessWidget {
  const ConsultApp({super.key});

  @override
  Widget build(BuildContext context) {
    var localization = FlutterLocalizationService().localization;

    return ChangeNotifierProvider(
     create: (context) => ThemeLogicProvider(),
      child: ScreenUtilInit(
          designSize: const Size(375, 812),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (context, child) {
            final themeProvider = context.watch<ThemeLogicProvider>();
            return MaterialApp.router(
              debugShowCheckedModeBanner: false,
              title: 'Consult App',
              locale: localization.currentLocale,
              supportedLocales: localization.supportedLocales,
              localizationsDelegates: localization.localizationsDelegates,
              routerConfig: AppRoutes.router,
              theme: AppLightTheme.themeData,
              darkTheme: AppDarkTheme.themeData,
              themeMode: themeProvider.themeMode,
            );
          }
      ),
    );
  }
}