part of 'home_bloc.dart';

@immutable
sealed class HomeState extends Equatable {
  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
  final List<DrawerPage> pages;

  HomeLoaded(this.pages);

  @override
  List<Object> get props => [pages];
}

class HomeError extends HomeState {
  final String message;

  HomeError(this.message);

  @override
  List<Object> get props => [message];
}
