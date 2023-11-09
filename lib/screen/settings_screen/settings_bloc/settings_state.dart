part of 'settings_bloc.dart';

abstract class SettingsState extends Equatable {
  const SettingsState();
}

class SettingsInitial extends SettingsState {
  @override
  List<Object> get props => [];
}

class SettingsLanguageLoaded extends SettingsState {
  Locale currentLoadedLocal;

  SettingsLanguageLoaded({required this.currentLoadedLocal});

  @override
  List<Object> get props => [];
}
