import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:school_app/blocs/library_bloc.dart';
import 'package:school_app/blocs/student_bloc.dart';
import 'package:school_app/constant.dart';
import 'package:school_app/repositories/library_repository.dart';
import 'package:school_app/repositories/student_repository.dart';
import 'package:school_app/routes.dart';
import 'package:school_app/screen/splash_screen/splash_screen.dart';

void main() {
  setupHttpOverrides();
  setupLocator();
  runApp(const MyApp());
}

void setupHttpOverrides() {
  HttpOverrides.global = MyHttpOverrides();
}

void setupLocator() {
  // Add any dependency injection or service locator setup here
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port) => true;
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => LibraryBloc(repository: LibraryRepository())..add(LoadData()),
        ),
        BlocProvider(
          create: (_) => StudentBloc(repository: StudentRepository())..add(LoadStudentData()),
        ),
        // Add any additional bloc providers here
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Basmati School',
        theme: ThemeData.light().copyWith(
          scaffoldBackgroundColor: kPrimaryColor,
          primaryColor: kPrimaryColor,
          appBarTheme: const AppBarTheme(
            color: kPrimaryColor,
            elevation: 0,
          ),
          textTheme: GoogleFonts.sourceSansProTextTheme(Theme.of(context).textTheme).apply().copyWith(
            bodyMedium: const TextStyle(
              color: kTextWhiteColor,
              fontSize: 35.0,
              fontWeight: FontWeight.bold,
            ),
            bodyLarge: const TextStyle(
              color: kTextWhiteColor,
              fontSize: 22.0,
              fontWeight: FontWeight.w500,
            ),
            bodySmall: const TextStyle(
              color: kTextWhiteColor,
              fontSize: 18.0,
              fontWeight: FontWeight.w300,
            ),
          ),
          inputDecorationTheme: const InputDecorationTheme(
            labelStyle: TextStyle(
              fontSize: 15.0,
              color: kTextLightColor,
              height: 8.5,
            ),
            hintStyle: TextStyle(
              fontSize: 16.0,
              color: kTextBlackColor,
              height: 8.5,
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: kTextLightColor, width: 0.7),
            ),
            border: UnderlineInputBorder(
              borderSide: BorderSide(color: kTextLightColor),
            ),
            disabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: kTextLightColor),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: kPrimaryColor, width: 0.7),
            ),
            errorBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: kErrorBorderColor, width: 1.2),
            ),
            focusedErrorBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: kErrorBorderColor, width: 1.2),
            ),
          ),
        ),
        initialRoute: SplashScreen.routeName,
        routes: routes,
      ),
    );
  }
}
