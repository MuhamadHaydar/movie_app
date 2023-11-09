import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.settings),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(onPressed: () {}, child: Text('Kurdish')),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(onPressed: () {}, child: Text('English')),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(onPressed: () {}, child: Text('Arabic')),
          ],
        ),
      ),
    );
  }
}
