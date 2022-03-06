import 'package:flutter/material.dart';
import 'package:preferences_app/screens/screens.dart';

import 'package:preferences_app/share_preferences/preferences.dart';
import 'package:provider/provider.dart';
import 'package:preferences_app/providers/theme_provider.dart';

void main() async {
  // le decimos a Flutter que nos deje pasar!
  WidgetsFlutterBinding.ensureInitialized();
  //! EL MAIN LO HAGO ASYNCRONO PARA PODER LLAMAR EL PREFERENCES.INIT
  await Preferences.init();
  //ya se inicializo => ya es syncrono
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ThemeProvider(
            isDarkmode: Preferences.isDarkmode,
          ),
        )
      ],
      child: const MyApp(),
    ),
  );
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
      theme: Provider.of<ThemeProvider>(context).currentTheme,
    );
  }
}
