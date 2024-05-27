import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/page.dart';
import '../../domain/usecases/get_apps.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetApps getApps;

  HomeBloc({required this.getApps}) : super(HomeInitial()) {
    on<HomeEvent>((event, emit) async {
      emit(HomeLoading());
    });

    on<LoaderCompletedEvent>((event, emit) async {
      try {
        final pages = await getApps.call();
        emit(HomeReadyToRender(pages));
      } catch (e) {
        emit(HomeError(e.toString()));
      }
    });

    on<ChangePageEvent>((event, emit) async {
      int nextIndex = event.upcomingIndex;

      for (var data in event.pages) {
        data.isSelected = false;
      }

      event.pages[nextIndex].isSelected = true;

      emit(HomeReadyToRender(event.pages));
    });
  }
}
