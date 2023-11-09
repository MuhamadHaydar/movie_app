part of 'settings_bloc.dart';

abstract class SettingsEvent extends Equatable {
  const SettingsEvent();
}

class UpdateSettingLocale extends SettingsEvent {
  String languageCode;

  UpdateSettingLocale({required this.languageCode});

  @override
  List<Object> get props => [];
}
