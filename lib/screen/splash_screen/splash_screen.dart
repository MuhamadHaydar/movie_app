import 'package:flutter/material.dart';
import 'package:movie_app/constants/ui_constants.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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
            UiConstants.appName,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20),
          )
        ],
      ),
    );
  }
}
