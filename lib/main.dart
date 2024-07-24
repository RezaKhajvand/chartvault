import 'package:chartvault/const/borderradius.dart';
import 'package:chartvault/const/colors.dart';
import 'package:chartvault/const/router.dart';
import 'package:chartvault/di.dart';
import 'package:chartvault/firebase_options.dart';
import 'package:chartvault/signin/bloc/login_bloc.dart';
import 'package:chartvault/signin/signin_screen.dart';
import 'package:chartvault/news/bloc/news_bloc.dart';
import 'package:chartvault/signals/bloc/signals_bloc.dart';
import 'package:chartvault/signup/bloc/signup_bloc.dart';
import 'package:chartvault/workshop/bloc/workshop_bloc.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  FirebaseAnalytics analytics = FirebaseAnalytics.instance;
  await analytics.logEvent(name: 'Notcoin');
  await FirebaseMessaging.instance.requestPermission(provisional: true);
  await FirebaseMessaging.instance.subscribeToTopic("topic");
  await getItInit();

  // SystemChrome.setSystemUIOverlayStyle(
  //     const SystemUiOverlayStyle(statusBarColor: CustomColors.slate));
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LoginBloc(),
        ),
        BlocProvider(
          create: (context) => NewsBloc(),
        ),
        BlocProvider(
          create: (context) => WorkshopBloc(),
        ),
        BlocProvider(
          create: (context) => SignalsBloc(),
        ),
        BlocProvider(
          create: (context) => SignupBloc(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: router,
      theme: ThemeData(
        textTheme: const TextTheme(
          headlineLarge: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 20.0,
          ),
          headlineMedium: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w400,
            fontSize: 16.0,
          ),
          headlineSmall: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 14.0,
          ),
          bodyMedium: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w300,
            fontSize: 14.0,
          ),
          labelMedium: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 12.0,
          ),
          labelSmall: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w300,
            fontSize: 12.0,
          ),
          titleSmall: TextStyle(
            color: Colors.grey,
            fontWeight: FontWeight.w400,
            fontSize: 11.0,
          ),
          bodySmall: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 12.0,
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
            labelStyle: const TextStyle(
              color: Colors.grey,
              fontWeight: FontWeight.w300,
              fontSize: 14.0,
            ),
            prefixIconColor: Colors.white.withOpacity(0.5),
            focusedBorder: const UnderlineInputBorder(
                borderSide:
                    BorderSide(color: CustomColors.brightBlue, width: 2))),
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
          shape: const RoundedRectangleBorder(
              borderRadius: CustomRadius.cardRadius),
          backgroundColor: Colors.white,
          foregroundColor: CustomColors.brightBlue,
        )),
        outlinedButtonTheme: OutlinedButtonThemeData(
            style: OutlinedButton.styleFrom(
                side: const BorderSide(color: CustomColors.brightBlue),
                foregroundColor: CustomColors.brightBlue)),
        appBarTheme: const AppBarTheme(
          shadowColor: Colors.transparent,
          surfaceTintColor: Colors.transparent,
          foregroundColor: Colors.white,
          toolbarHeight: 60,
          titleTextStyle: TextStyle(
              color: Colors.white, fontWeight: FontWeight.w800, fontSize: 16.0),
        ),
        chipTheme: ChipThemeData(
          side: BorderSide.none,
          selectedColor: CustomColors.brightBlue,
          checkmarkColor: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
          shape: const RoundedRectangleBorder(
              borderRadius: CustomRadius.cardRadius),
          labelStyle: const TextStyle(
              color: Colors.white, fontSize: 14, fontWeight: FontWeight.w300),
          color: WidgetStateProperty.resolveWith(
            (states) {
              if (states.contains(WidgetState.selected)) {
                return CustomColors.brightBlue;
              } else {
                return CustomColors.slate;
              }
            },
          ),
        ),
        scaffoldBackgroundColor: Colors.transparent,
        colorScheme: ColorScheme.fromSeed(seedColor: CustomColors.brightBlue),
        useMaterial3: true,
      ),
    );
  }
}
