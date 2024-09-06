import 'package:flutter/widgets.dart';
import 'package:themoviedb/home_screen.dart';
import 'package:themoviedb/movie_detail_screen.dart';
import 'package:themoviedb/sign_in_screen.dart';
// We use name route
// All our routes will be available here
final Map<String, WidgetBuilder> routes = {
  SignInScreen.routeName: (context) => const SignInScreen(),
  HomeScreen.routeName: (context) => const HomeScreen(),
  MovieDetailScreen.routeName: (context) => const MovieDetailScreen(),
};