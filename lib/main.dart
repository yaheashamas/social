import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social/core/bloc_observer.dart';
import 'package:social/core/components/constants.dart';
import 'package:social/core/network/local/cashe_helper.dart';
import 'package:social/core/network/remote/dio_helper.dart';
import 'package:social/core/theme/themeLight.dart';
import 'package:social/layout/Home_page.dart';
import 'package:social/modules/login/login_screen.dart';

void main() async {
  //on all functions then runAPP
  WidgetsFlutterBinding.ensureInitialized();
  //firebase
  await Firebase.initializeApp();
  //BLoC Observer
  BlocOverrides.runZoned(() {}, blocObserver: MyBlocObserver());
  //initial dio
  DioHelper.initializeInterceptors();
  //initial shared Preferences
  await CacheHelper.init();
  Widget widget;
  // CacheHelper.removeData(key: "uId");
  uId = CacheHelper.getString(key: "uId");
  uId != null ? widget = HomePage() : widget = LoginScreen();
  runApp(MyApp(widget: widget));
}

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  Widget widget;

  MyApp({
    required this.widget,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: themeLight,
      // darkTheme: themeLight,
      home: Scaffold(
        body: widget,
      ),
    );
  }
}
