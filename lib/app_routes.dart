import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:workapp/work_app/about_us/about_bind.dart';
import 'package:workapp/work_app/about_us/about_view.dart';
import 'package:workapp/work_app/add_task/task_view.dart';
import 'package:workapp/work_app/current_fetch_data/fetch_bind.dart';
import 'package:workapp/work_app/current_fetch_data/fetch_current.dart';
import 'package:workapp/work_app/home/home_bind.dart';
import 'package:workapp/work_app/home/home_view.dart';
import 'package:workapp/work_app/login/login_bind.dart';
import 'package:workapp/work_app/login/login_view.dart';
import 'package:workapp/work_app/signup/signup_bind.dart';
import 'package:workapp/work_app/signup/signup_view.dart';
import 'package:workapp/work_app/splash/splash_bind.dart';
import 'package:workapp/work_app/splash/splash_view.dart';

class AppRoutes {
  static String initialRoute = '/initial';
  static String splash = '/splash';
  static String login = '/login';
  static String signup = '/signup';
  static String home = '/home';
  static String fetchdata = '/fetchdata';
  static String aboutus = '/aboutus';
  static String addtask = '/addtask';

  static List<GetPage> page = [
    GetPage(
      name: initialRoute,
      page: () => SplashView(),
      binding: SplashBinding(),
    ),

    GetPage(name: login, page: () => LoginView(), binding: LoginBinding()),

    GetPage(name: signup, page: () => SignupView(), binding: SignupBind()),

    GetPage(name: home, page: () => HomeView(), binding: HomeBinding()),
    GetPage(name: fetchdata, page: () => FetchCurrent(), binding: FetchBind()),
    GetPage(
      name: aboutus,
      page: () => AboutUsScreen(),
      binding: AboutBinding(),
    ),

    GetPage(
      name: addtask,
      page: () => AddTask(),
      //binding: SplashBinding(),
    ),
  ];
}
