import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shaale_task/modules/landing_page/views/landing_view.dart';
import 'package:shaale_task/styles/app_text_colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQueryData.fromWindow(WidgetsBinding.instance.window);
    // initializing Riverpod with ProviderScope
    return ProviderScope(
      //initializing screenUtil with values from MediaQuery
      child: ScreenUtilInit(
        designSize: Size(size.size.width, size.size.height),
        minTextAdapt: true,
        builder: (_, __) {
          //root widget of the app(MaterialApp)
          return MaterialApp(
            title: 'Shaale Task',
            theme: ThemeData.dark().copyWith(
              primaryColor: AppColor.appPrimary,
              scaffoldBackgroundColor: AppColor.appDarkGrey,
              elevatedButtonTheme: ElevatedButtonThemeData(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(AppColor.appPrimary),
                )
              ),
            ),
            home: const LandingView(),
          );
        },
      ),
    );
  }
}
