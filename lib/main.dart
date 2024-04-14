import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:newsweb/page_routes/route_generate.dart';
import 'package:newsweb/page_routes/routes.dart';
import 'package:newsweb/utils/apphelper.dart';
import 'package:newsweb/utils/theme/dark_theme.dart';
import 'package:newsweb/utils/theme/light_theme.dart';
import 'package:newsweb/view/auth/login.dart';
import 'package:newsweb/view/ui/home_screen.dart';
import 'package:newsweb/view_model/provider/ThemeProvider.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:sidebarx/sidebarx.dart';

Future<void> main() async {
  await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: "AIzaSyAaD8NiMUzwleH6d81lls9_Kby8yqHzKP0",
          appId: '1:1078440827221:web:b47ebb68f51153d2ef77dc',
          messagingSenderId: '1078440827221',
          projectId: 'news-8e2c1',
          storageBucket: 'news-8e2c1.appspot.com'));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(builder: (context, orientation, screenType) {
      return StreamProvider<InternetConnectionStatus>(
        initialData: InternetConnectionStatus.connected,
        create: (_) {
          return InternetConnectionChecker().onStatusChange;
        },
        child: MultiProvider(
          providers: [
            ChangeNotifierProvider<DarkThemeProvider>(
                create: (_) => DarkThemeProvider()),
          ],
          child: Consumer<DarkThemeProvider>(builder: (context, value, child) {
            return GetMaterialApp(
              builder: (context, child) {
                AppHelper.themelight = !value.darkTheme;
                return MediaQuery(
                  data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
                  child: child!,
                );
              },
              title: 'ShoTnews',
              debugShowCheckedModeBanner: false,
              initialRoute: Routes.loginScreen,
              onGenerateRoute: RouteGenerator.generateRoute,
              theme: value.darkTheme ? lighttheme : darktheme,
            );
          }),
        ),
      );
    });
  }
}

const defaultInputBorder = OutlineInputBorder(
  borderRadius: BorderRadius.all(Radius.circular(16)),
  borderSide: BorderSide(
    color: Color(0xFFDEE3F2),
    width: 1,
  ),
);
