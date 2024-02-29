import 'package:easaac_project/home/home.dart';
import 'package:easaac_project/login/login_screen.dart';
import 'package:easaac_project/settings/setting_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'controllers/signin_controller.dart';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SignInController()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true, colorScheme: ColorScheme.fromSeed(seedColor: Colors.white)
          .copyWith(background: Colors.white,),

      ),
      routes: {
          HomeScreen.routeName : (context) =>  HomeScreen(url: '',),
          SettingScreen.routeName : (context) => const SettingScreen(),
          LoginScreen.routeName : (context) => LoginScreen(),

      },
      initialRoute: LoginScreen.routeName ,
    );
  }
}
