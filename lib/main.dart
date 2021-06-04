import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app_bloc/repositories/news_repository.dart';
import 'package:news_app_bloc/views/splash_screen.dart';

import 'blocs/newsbloc/news_bloc.dart';
import 'blocs/newsbloc/news_states.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<NewsBloc>(
          create: (context) => NewsBloc(
              initialState: NewsInitState(), newsRepositoty: NewsRepository()),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            scaffoldBackgroundColor: Colors.white,
            textTheme: GoogleFonts.poppinsTextTheme(
              Theme.of(context).textTheme,
            )),
        home: SplashScreen(),
      ),
    );
  }
}
