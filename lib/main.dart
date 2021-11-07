import 'package:family_care_app/screens/home_screen.dart';
import 'package:flutter/material.dart';


void main() => runApp(App());

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  ThemeData _theme() {
    return ThemeData(
        primaryColor: Color(0xFFA2DCEE),
        scaffoldBackgroundColor: Color(0xFF9A9CEA),
        accentColor: Colors.purple,
        textTheme: TextTheme(bodyText2: TextStyle(color: Colors.white)));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: _theme(),
      home: HomeScreen(),
    );
  }
}

