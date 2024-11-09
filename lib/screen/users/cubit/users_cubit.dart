import 'dart:convert';
import 'package:chatappclone/helper/cache_helper.dart';
import 'package:chatappclone/utils/constant.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

import '../../../model/auth/user.dart';
import '../../../model/auth/users.dart';

part 'users_state.dart';

class UsersCubit extends Cubit<UsersState> {
  UsersCubit() : super(UsersInitial());

  static UsersCubit get(context) => BlocProvider.of(context);
  List<Users> users = [];
Users?userss;
  Future<void> getUsers() async {
    try {
      emit(UsersLoading());
      http.Response response = await http.get(
        Uri.parse(
            "${Constants().baseUrl}${Constants().user}${Constants().users}"),
        headers: {
          "Content-Type": "application/json",
          "token": CacheHelper.getData(key: "token")
        },
      );

      if (kDebugMode) {
        print(response.body);
      } // For debugging

      if (response.statusCode == 200) {
        List<dynamic> usersResponse = jsonDecode(response.body); // Expecting a List
        users = usersResponse.map((user) => Users.fromJson(user)).toList();
        print(usersResponse);
        emit(UsersLoaded());
        Fluttertoast.showToast(
          msg: "get users success",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0,
        );
      } else {
        emit(UsersError(error: jsonDecode(response.body)['msg']));
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      emit(UsersError(error: e.toString()));
    }
  }
}
