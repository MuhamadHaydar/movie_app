import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:movie_app/bloc/database_bloc.dart';
import 'package:movie_app/constants/ui_constants.dart';
import 'package:movie_app/repository/movie_repository.dart';
import 'package:movie_app/screen/splash_screen/splash_screen.dart';
import 'package:movie_app/service/database_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Here we Initialize Database.
  await DatabaseHelper().initDatabase();

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();

  static void setLocale(BuildContext context, Locale newLocal) {
    _MyAppState? state = context.findAncestorStateOfType<_MyAppState>();
    state?.setLocale(newLocal);
  }
}

class _MyAppState extends State<MyApp> {
  Locale? _locale;

  setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: UiConstants.appName,
      debugShowCheckedModeBanner: false,
      debugShowMaterialGrid: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: _locale,
      builder: (context, child) {
        return RepositoryProvider(
          create: (context) => MovieRepository(),
          child: BlocProvider(
            create: (context) => DatabaseBloc(),
            child: child!,
          ),
        );
      },
      home: SplashScreen(),
    );
  }
}
