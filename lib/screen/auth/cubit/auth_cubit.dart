import 'dart:convert';
import 'package:chatappclone/helper/cache_helper.dart';
import 'package:chatappclone/utils/constant.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

import '../../../model/auth/user.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  static AuthCubit get(context) => BlocProvider.of(context);
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController number = TextEditingController();
  TextEditingController password = TextEditingController();

  Future<void> register() async {
    try {
      emit(RegisterLoading());
      http.Response response = await http.post(
        Uri.parse("${Constants().baseUrl}${Constants().user}${Constants().register}"),
        headers: {
          "Content-Type": "application/json",
        },
        body: jsonEncode(<String, String>{
          "name": name.text.trim(),
          "email": email.text.trim(),
          "phone": number.text.trim(),
          "password": password.text.trim()
        }),
      );

      if (kDebugMode) {
        print(response.body);
      } // For debugging

      if (response.statusCode == 200) {
        Register registerResponse =
            Register.fromJson(jsonDecode(response.body));
        User? user = registerResponse.data?.user;
        // Emit success state
        print("idddddd ${user!.id}");
        emit(RegisterSuccess(user: user!));
        // Show success message
        Fluttertoast.showToast(
          msg: "Register Success",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0,
        );
        String? token =registerResponse.data?.user?.token;
        CacheHelper.saveData(key: "token", value: token);
        if (kDebugMode) {
          print(registerResponse.data?.user?.token);
        }
      } else {
        emit(RegisterError(error: jsonDecode(response.body)['msg']));
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      emit(RegisterError(error: e.toString()));
    }
  }
}
