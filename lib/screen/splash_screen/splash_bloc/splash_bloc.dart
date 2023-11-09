import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/service/local_service.dart';

part 'splash_event.dart';
part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(SplashLoading()) {
    on<LoadApplicationState>((event, emit) async {
      // Start with loading state
      emit(SplashLoading());
      try {
        Locale currentLoadedLocal = await LocalService.getLocale();
        emit(SplashLoaded(userLoadedLocal: currentLoadedLocal));
      } catch (e) {
        emit(SplashError());
      }
    });
  }
}
