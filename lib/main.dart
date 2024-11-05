import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:kangmas_app/components/my_scroll_behaviour.dart';
import 'package:kangmas_app/screens/splash_screen.dart';
import 'package:kangmas_app/store/appData.dart';
import 'package:kangmas_app/utils/colors.dart';
import 'package:kangmas_app/utils/constant.dart';

AppData appData = AppData();

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        return MaterialApp(
          scrollBehavior: MyScrollBehavior(),
          debugShowCheckedModeBanner: false,
          title: appName,
          theme: ThemeData.light().copyWith(
            colorScheme: ColorScheme(
              brightness: Brightness.light,
              primary: primaryColor,
              onPrimary: whiteColor,
              secondary: secondaryColor,
              onSecondary: secondaryColor,
              error: redColor,
              onError: redColor,
              background: whiteColor,
              onBackground: whiteColor,
              surface: whiteColor,
              onSurface: blackColor,
            ),
            primaryColor: primaryColor,
            secondaryHeaderColor: whiteColor,
            iconTheme: IconThemeData(color: primaryColor),
            tabBarTheme: TabBarTheme(labelColor: Colors.black),
            listTileTheme: ListTileThemeData(iconColor: blackColor),
            brightness: Brightness.light,
            dividerColor: transparent,
            appBarTheme: AppBarTheme(
              iconTheme: IconThemeData(color: primaryColor),
              titleTextStyle: TextStyle(color: primaryColor),
              systemOverlayStyle: SystemUiOverlayStyle(statusBarIconBrightness: Brightness.dark),
            ),
            bottomNavigationBarTheme: BottomNavigationBarThemeData(
              backgroundColor: whiteColor,
              selectedItemColor: bottomSelectedColor,
              unselectedItemColor: bottomUnselectedColor,
            ),
          ),
          darkTheme: ThemeData.dark().copyWith(
            colorScheme: ColorScheme(
              brightness: Brightness.light,
              primary: Colors.black,
              onPrimary: Colors.white,
              secondary: secondaryColor,
              onSecondary: secondaryColor,
              error: redColor,
              onError: redColor,
              background: whiteColor,
              onBackground: whiteColor,
              surface: greyColor,
              onSurface: blackColor,
            ),
            primaryColor: whiteColor,
            secondaryHeaderColor: primaryColor,
            iconTheme: IconThemeData(color: whiteColor),
            brightness: Brightness.dark,
            tabBarTheme: TabBarTheme(labelColor: Colors.white),
            listTileTheme: ListTileThemeData(iconColor: whiteColor),
            dividerColor: transparent,
            dialogTheme: DialogTheme(
              backgroundColor: Colors.grey,
              titleTextStyle: TextStyle(
                color: blackColor,
                fontWeight: FontWeight.w500,
                fontSize: 18,
              ),
              contentTextStyle: TextStyle(color: Colors.black),
            ),
            expansionTileTheme: ExpansionTileThemeData(iconColor: whiteColor, textColor: whiteColor),
            bottomNavigationBarTheme: BottomNavigationBarThemeData(
              backgroundColor: Colors.black,
              selectedItemColor: Colors.white,
              unselectedItemColor: Colors.grey.shade500,
            ),
            appBarTheme: AppBarTheme(
              iconTheme: IconThemeData(color: whiteColor),
              titleTextStyle: TextStyle(color: whiteColor),
              systemOverlayStyle: SystemUiOverlayStyle(statusBarIconBrightness: Brightness.light),
            ),
          ),
          themeMode: appData.mode,
          home: SplashScreen(),
        );
      },
    );
  }
}