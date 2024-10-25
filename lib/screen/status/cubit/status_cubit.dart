import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'status_state.dart';

class StatusCubit extends Cubit<StatusState> {
  StatusCubit() : super(StatusInitial());

  static StatusCubit get(context) => BlocProvider.of(context);

}
