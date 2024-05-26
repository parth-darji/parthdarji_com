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
      if (event is GetAppsEvent) {
        emit(HomeLoading());
        try {
          final apps = await getApps.call();
          emit(HomeLoaded(apps));
        } catch (e) {
          emit(HomeError(e.toString()));
        }
      }
    });
  }
}
