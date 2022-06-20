import 'package:ecommerce_app/screens/auth/signin/signin_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        //navigation bar icons' color
        ));
    return ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        builder: (context, child) {
          return GestureDetector(
            onTap: () {
              FocusManager.instance.primaryFocus?.unfocus();
            },
            child: MaterialApp(
              theme: ThemeData(
                appBarTheme: AppBarTheme(
                  systemOverlayStyle: SystemUiOverlayStyle(
                    statusBarColor: Colors.transparent,
                    // For Android (dark icons)
                    systemNavigationBarIconBrightness: Brightness.dark,
                    // For iOS (dark icons)
                    statusBarBrightness: Brightness.dark,
                  ),
                ),
              ),
              debugShowCheckedModeBanner: false,
              home: SignInScreen(),
            ),
          );
        });
  }
}
