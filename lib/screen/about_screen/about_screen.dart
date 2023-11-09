import 'package:flutter/material.dart';
import 'package:movie_app/constants/color_constants.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Icon(
            Icons.remove_red_eye,
            size: 60,
            color: ColorConstants.darkPurpleColor,
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'Eye Movie Application',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'Movie application that provides popular movies and let your set your favorite movies',
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
