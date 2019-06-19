import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:hello_word/routes/authenticationScreen.dart';
// import 'routes/homeScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DynamicTheme(
      defaultBrightness: Brightness.light,
      data: (brightness) => ThemeData(
        primarySwatch: Colors.deepPurple,
        // scaffoldBackgroundColor: Color(0xEFFFFFFF),
        brightness: brightness,
      ),
      themedWidgetBuilder: (context, theme) {
        return MaterialApp(
          title: 'Flutter Demo',
          theme: theme,
          home: AuthenticationScreen(),
        );
      }
    );
  }
}