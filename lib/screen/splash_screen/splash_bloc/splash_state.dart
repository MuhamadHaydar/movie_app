part of 'splash_bloc.dart';

abstract class SplashState extends Equatable {
  const SplashState();
}

class SplashLoading extends SplashState {
  @override
  List<Object> get props => [];
}

class SplashLoaded extends SplashState {
  // bool isLandingPageShown;
  Locale userLoadedLocal;

  SplashLoaded({required this.userLoadedLocal});

  @override
  List<Object> get props => [];
}

class SplashError extends SplashState {
  @override
  List<Object> get props => [];
}
