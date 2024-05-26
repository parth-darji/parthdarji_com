part of 'home_bloc.dart';

@immutable
sealed class HomeEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class GetAppsEvent extends HomeEvent {}
