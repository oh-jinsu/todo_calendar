import 'package:flutter/material.dart';
import 'package:todo/pages/home.dart';
import 'package:todo/storage/sqflite.dart';
import 'package:todo/theme/color.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initDatabase();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
      theme: ThemeData(
        colorScheme: const ColorScheme.light(
          primary: Color(0xFFBBDEFB),
          onPrimary: Colors.white,
          secondary: Color(0xFFBBDEFB),
          onSecondary: Colors.white,
          background: ColorTheme.surface,
          onBackground: ColorTheme.body,
          surface: ColorTheme.surface,
          onSurface: ColorTheme.body,
          error: ColorTheme.error,
          onError: Colors.white,
        ),
        dividerTheme: const DividerThemeData(color: ColorTheme.border),
        appBarTheme: AppBarTheme(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          foregroundColor: ColorTheme.body,
          elevation: 0.0,
          iconTheme: const IconThemeData(
            color: ColorTheme.body,
          ),
        ),
        textTheme: const TextTheme(
          bodyMedium: TextStyle(
            fontSize: 16.0,
          ),
        ).apply(
          bodyColor: ColorTheme.body,
        ),
        iconTheme: const IconThemeData(
          color: ColorTheme.body,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom().merge(
            ButtonStyle(
              shape: MaterialStateProperty.resolveWith(
                (states) => RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              elevation: MaterialStateProperty.resolveWith((states) => 0.0),
            ),
          ),
        ),
      ),
      builder: (context, child) => MediaQuery(
        data: MediaQuery.of(context).copyWith(
          textScaleFactor: 1.0,
        ),
        child: child!,
      ),
    );
  }
}
