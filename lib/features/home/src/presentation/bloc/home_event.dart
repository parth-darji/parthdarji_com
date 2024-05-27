part of 'home_bloc.dart';

@immutable
sealed class HomeEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class GetAppsEvent extends HomeEvent {}

class LoaderCompletedEvent extends HomeEvent {}

class ChangePageEvent extends HomeEvent {
  final int upcomingIndex;
  final List<DrawerPage> pages;
  ChangePageEvent(
    this.upcomingIndex, {
    required this.pages,
  });
}
