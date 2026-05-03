import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_c18/common/dependency_injection/get_it.dart';
import 'package:news_c18/common/routes/app_routs.dart';
import 'package:news_c18/common/theme/app_theme.dart';
import 'package:news_c18/features/main_layer/view/main_screen/main_screen.dart';

void main() {
  configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(393, 852),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode: ThemeMode.dark,
        routes: {AppRouts.mainScreenRoute: (_) => MainScreen()},
        initialRoute: AppRouts.mainScreenRoute,
      ),
    );
  }
}
