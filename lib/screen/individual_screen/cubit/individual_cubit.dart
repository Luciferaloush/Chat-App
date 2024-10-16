import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
part 'individual_state.dart';

class IndividualCubit extends Cubit<IndividualState> {
  IndividualCubit() : super(IndividualInitial());

  static IndividualCubit get(context) => BlocProvider.of(context);
  IO.Socket? socket;
  // void connect(){
  //   socket = IO.on
  // }
}
