import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/service/local_service.dart';

part 'settings_event.dart';
part 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  SettingsBloc() : super(SettingsInitial()) {
    on<UpdateSettingLocale>((event, emit) async {
      LocalService.setLocale(event.languageCode);
      emit(SettingsLanguageLoaded(
          currentLoadedLocal: Locale(event.languageCode)));
    });
  }
}
