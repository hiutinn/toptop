import 'package:chat_app_project/provider/gender_model.dart';
import 'package:chat_app_project/provider/loading_model.dart';
import 'package:chat_app_project/provider/save_model.dart';
import 'package:chat_app_project/views/pages/auth/auth_screen.dart';
import 'package:chat_app_project/provider/login_phone.dart';
import 'package:chat_app_project/views/pages/auth/login_phone_screen.dart';
import 'package:chat_app_project/views/pages/auth/login_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => GenderModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => LoadingModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => SaveModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => LoginPhoneProvider(),
          child: LoginWithPhoneNumber(),
        )
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          textTheme: GoogleFonts.varelaRoundTextTheme().copyWith(
            bodySmall: const TextStyle(fontFamily: "Tiktok_Sans"),
            bodyMedium: const TextStyle(fontFamily: "Tiktok_Sans"),
            bodyLarge: const TextStyle(fontFamily: "Tiktok_Sans")
          ),
      ),
      home: AuthScreen(),
    );
  }
}
