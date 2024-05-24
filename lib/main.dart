import 'dart:io';

import 'package:ecommerce/DI/dI.dart';
import 'package:ecommerce/presentation_layer/ui/core/local/prefsHelper.dart';
import 'package:ecommerce/presentation_layer/ui/core/local/provider.dart';
import 'package:ecommerce/presentation_layer/ui/core/utils/routesManager.dart';
import 'package:ecommerce/presentation_layer/ui/home/homeScreen.dart';
import 'package:ecommerce/presentation_layer/ui/home/tabs/homeTab/homeTabView.dart';
import 'package:ecommerce/presentation_layer/ui/signIn/signInScreen.dart';
import 'package:ecommerce/presentation_layer/ui/signUp/signUpScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await PrefsHelper.init();
  configureDependencies();
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize:  const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        navigatorKey:navigatorKey ,
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          fontFamily: GoogleFonts.poppins().fontFamily,
          useMaterial3: false,
        ),
        routes: {
          RoutesManager.signUpRouteName:(context)=>SignUpScreen(),
          RoutesManager.signInRouteName:(context)=>SignInScreen(),
          RoutesManager.HomeScreenRouteName:(context)=>HomeScreen(),

        },
        initialRoute: PrefsHelper.getToken().isNotEmpty?
        RoutesManager.HomeScreenRouteName:RoutesManager.signInRouteName,
      ),
    );
  }
}




