import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
part 'home_screen_state.dart';

class HomeScreenCubit extends Cubit<HomeScreenState> {
  HomeScreenCubit(TickerProvider vsync) : super(HomeScreenInitial()) {
    controller = TabController(length: 4, vsync: vsync);
  }

  static HomeScreenCubit get(context) => BlocProvider.of(context);

  late TabController controller;

  @override
  Future<void> close() {
    controller.dispose();
    return super.close();
  }
}