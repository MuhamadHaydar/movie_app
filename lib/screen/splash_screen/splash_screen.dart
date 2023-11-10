import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:movie_app/constants/ui_constants.dart';
import 'package:movie_app/main.dart';
import 'package:movie_app/screen/navigation_screen/navigation_screen.dart';
import 'package:movie_app/screen/splash_screen/splash_bloc/splash_bloc.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => SplashBloc()..add(LoadApplicationState()),
        child: BlocListener<SplashBloc, SplashState>(
          listener: (context, state) {
            if (state is SplashLoading) {
              // Here we show loading snack bar
            } else if (state is SplashLoaded) {
              MyApp.setLocale(context, state.userLoadedLocal);
              // ScaffoldMessenger.of(context).showSnackBar(
              //   SnackBar(
              //     content: Text('Splash Data Loaded'),
              //   ),
              // );

              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => NavigationScreen()),
              );
            }
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Icon(
                Icons.play_lesson_rounded,
                size: 100,
                color: Colors.deepPurple,
              ),
              SizedBox(
                height: UiConstants.minDividerSpace,
              ),
              Text(
                AppLocalizations.of(context)!.app_name,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20),
              )
            ],
          ),
        ),
      ),
    );
  }
}
