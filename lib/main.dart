import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:school_app/blocs/student_bloc.dart';
import 'package:school_app/constant.dart';
import 'package:school_app/repositories/student_repository.dart';
import 'package:school_app/routes.dart';
import 'package:school_app/screen/splash_screen/splash_screen.dart';
import 'package:school_app/screen/home_screen/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [ BlocProvider(
      create: (_) => StudentBloc(repository: StudentRepository())..add(LoadData()),
    ),], child: MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Basmati School',
      theme: ThemeData.light().copyWith(
          scaffoldBackgroundColor: kPrimaryColor,
          primaryColor: kPrimaryColor,
          appBarTheme: AppBarTheme(
            color: kPrimaryColor,
            elevation: 0,
          ),
          textTheme:
          GoogleFonts.sourceSansProTextTheme(Theme.of(context).textTheme)
              .apply()
              .copyWith(
            bodyMedium:
            TextStyle(
                color: kTextWhiteColor,
                fontSize: 35.0,
                fontWeight: FontWeight.bold),

            bodyLarge: TextStyle(
                color: kTextWhiteColor,
                fontSize: 22.0,
                fontWeight: FontWeight.w500),
            bodySmall: TextStyle(
                color: kTextWhiteColor,
                fontSize: 18.0,
                fontWeight: FontWeight.w300),),
          //decoration for all the app
          inputDecorationTheme: InputDecorationTheme(
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
            //on focus change color
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: kPrimaryColor, width: 0.7),
            ),
            errorBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: kErrorBorderColor, width: 1.2),
            ),
            focusedErrorBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: kErrorBorderColor, width: 1.2),
            ),
          )),
      //first screen
      initialRoute: SplashScreen.routeName,
      routes: routes,
    ));
  }
}


