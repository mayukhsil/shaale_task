import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shaale_task/modules/landing_page/views/landing_view.dart';

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
          return MaterialApp(
            title: 'Shaale Task',
            theme: ThemeData.dark(),
            home: const LandingView(),
          );
        },
      ),
    );
  }
}
