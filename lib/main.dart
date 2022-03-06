import 'package:flutter/material.dart';
import 'package:preferences_app/screens/screens.dart';

import 'package:preferences_app/share_preferences/preferences.dart';

void main() async {
  // le decimos a Flutter que nos deje pasar!
  WidgetsFlutterBinding.ensureInitialized();
  //! EL MAIN LO HAGO ASYNCRONO PARA PODER LLAMAR EL PREFERENCES.INIT
  await Preferences.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: HomeScreen.routerName,
      routes: {
        HomeScreen.routerName: (_) => const HomeScreen(),
        SettingsScreen.routerName: (_) => const SettingsScreen(),
      },
      theme: Preferences.isDarkmode ? ThemeData.dark() : ThemeData.light(),
    );
  }
}
