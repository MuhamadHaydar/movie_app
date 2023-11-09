import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:movie_app/main.dart';
import 'package:movie_app/screen/settings_screen/settings_bloc/settings_bloc.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  static Widget create(BuildContext context) {
    return BlocProvider(
      create: (context) => SettingsBloc(),
      child: SettingsScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    SettingsBloc settingsBloc = BlocProvider.of<SettingsBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.settings),
      ),
      body: BlocListener<SettingsBloc, SettingsState>(
        listener: (context, state) {
          // Here we have to update current language and store it.
          if (state is SettingsLanguageLoaded) {
            MyApp.setLocale(context, state.currentLoadedLocal);
            Navigator.pop(context);
          }
        },
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ElevatedButton(
                  onPressed: () {
                    // Here we add update current language event to settings bloc

                    settingsBloc.add(UpdateSettingLocale(languageCode: "fa"));
                  },
                  child: Text('Kurdish')),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                  onPressed: () {
                    // Here we add update current language event to settings bloc
                    settingsBloc.add(UpdateSettingLocale(languageCode: "en"));
                  },
                  child: Text('English')),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                  onPressed: () {
                    // Here we add update current language event to settings bloc
                    settingsBloc.add(UpdateSettingLocale(languageCode: "ar"));
                  },
                  child: Text('Arabic')),
            ],
          ),
        ),
      ),
    );
  }
}
