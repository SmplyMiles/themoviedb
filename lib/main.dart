import 'package:flutter/material.dart';
import 'package:themoviedb/constants.dart';
import 'package:themoviedb/routes.dart';
import 'package:themoviedb/sign_in_screen.dart';
import 'dart:io';



class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }

}



void main() async {
  HttpOverrides.global = MyHttpOverrides();
  runApp(const MyApp());
   WidgetsFlutterBinding.ensureInitialized();
   ErrorWidget.builder = (FlutterErrorDetails details) => Container();
    runApp ( const MyApp() );
}







class MyApp extends StatelessWidget  {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var myLocale = const Locale('en', 'NG'); 
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      locale: myLocale,
      title: 'TheMoviewDB',
       theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: primaryColor,
        fontFamily: 'Georgia',
        textTheme:  const TextTheme(
            displayLarge: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
            titleLarge: TextStyle(fontSize: 30.0, fontStyle: FontStyle.italic),
            bodyMedium: TextStyle(fontSize: 18.0, fontFamily: 'Hind'),
          ),
        ),
      // home: SplashScreen(),
      // We use routeName so that we dont need to remember the name
      initialRoute: SignInScreen.routeName,
      routes: routes,
    );
  }
}



