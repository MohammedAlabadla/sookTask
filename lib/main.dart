import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sookps/controllers/app_bindings.dart';
import 'package:sookps/screens/auth/splash_scr.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      useInheritedMediaQuery: true,
      builder: (context, child) {
        return GetMaterialApp(
          themeMode: ThemeMode.light,
          locale: Locale('en'),
          fallbackLocale: const Locale('en'),
          debugShowCheckedModeBanner: false,
          initialBinding: AppBindings(),
          title: 'Sook Flutter Task',
          theme: ThemeData(primarySwatch: Colors.blue),
          home: SplashScreen(),
        );
      },
    );
  }
}
