part of 'splash_bloc.dart';

abstract class SplashEvent extends Equatable {
  const SplashEvent();
}

class LoadApplicationState extends SplashEvent {
  @override
  List<Object> get props => [];
}
