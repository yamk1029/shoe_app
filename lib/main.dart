import 'package:flutter/material.dart';
import 'package:khalti_flutter/khalti_flutter.dart';
import 'package:shoe_app/loginsignup/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return KhaltiScope(
      publicKey: 'test_public_key_dc74e7a5b6d54d3293a4bbd65b1e3d63',
      builder: (context, navKey) {
        return MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          navigatorKey: navKey,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor:
                    Colors.deepPurple, // For "Reset Khalti MPIN" etc.
              ),
            ),
          ),

          home: const Login(),
          localizationsDelegates: const [KhaltiLocalizations.delegate],
        );
      },
    );
  }
}
