import '../Views/Cart/CartPage.dart';
import '../Views/Favorite/FavoritePage.dart';
import '../Views/Start/HomeScreenPage.dart';
import '../Views/Home/HomePage.dart';
import '../Views/Login/LoadingPage.dart';
import '../Views/Login/SignInPage.dart';
import '../Views/Login/SignupPage.dart';
import '../Views/Profile/ProfilePage.dart';
import 'package:flutter/material.dart';

Map<String, Widget Function(BuildContext context)> routes = {
  'loadingPage': (context) => LoadingPage(),
  'getStarted': (context) => HomeScreenPage(),
  'signInPage': (context) => SignInPage(),
  'signUpPage': (context) => SignUpPage(),
  'homePage': (context) => HomePage(),
  'cartPage': (context) => CartPage(),
  'favoritePage': (context) => FavoritePage(),
  'profilePage': (context) => ProfilePage(),
};
