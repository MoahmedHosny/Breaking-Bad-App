import 'constants/constants.dart';
import 'app_route.dart';
import 'style/color/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: transparent,
      statusBarIconBrightness: Brightness.dark,
    ),
  );
  runApp(BreakingBad(AppRoute()));
}

class BreakingBad extends StatelessWidget {
  final AppRoute appRoute;
  BreakingBad(this.appRoute);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: grey,
        fontFamily: 'Lato',
        appBarTheme: AppBarTheme(
          backgroundColor: yellow,
        ),
      ),
      initialRoute: Home,
      onGenerateRoute: appRoute.generateRoute,
    );
  }
}
