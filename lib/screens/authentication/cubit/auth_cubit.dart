import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qazonamozlar/screens/authentication/state/auth_state.dart';
import 'package:qazonamozlar/services/get_storage/storage_service.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(SignUpState());

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future signUp(BuildContext context, String email, String password) async {
    try {
      emit(AuthLoading());

      Response res = await Dio().post(
        'http://192.168.27.2:1337/api/auth/local/register',
        data: {
          "username": "${DateTime.now()}",
          "email": email,
          "password": password
        },
      );
      if (res.statusCode == 200) {
        await GetStorageService.instance.box.write("token", res.data['jwt']);
        await GetStorageService.instance.box.write("userID", res.data['user']["id"]);
        print(GetStorageService.instance.box.read("userID"));
        
        // Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
        print("royxatdan otdi");

        emit(SignUpState());
      } else {
        // MyMessenger.messenger(context, "Error while signing up", Colors.red);
        // emit(AuthError(errorText: "Error while signing up"));
        print("xato");

      }
    } catch (e) {
      // MyMessenger.messenger(context, "Error while signing up", Colors.red);
        // emit(AuthError(errorText: "Error while signing up"));
        print("xato");

    }
  }

  Future signIn(BuildContext context, String email, String password) async {
    try {
      emit(AuthLoading());

      Response res =
          await Dio().post('http://192.168.27.2:1337/api/auth/local', data: {
        "identifier": email,
        "password": password,
      });
      if (res.statusCode == 200) {
        await GetStorageService.instance.box.write("token", res.data['jwt']);
        // Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
        emit(SignInState());
        print("tizimga kirdi");
      } else {
        // MyMessenger.messenger(context, "Error while signing in", Colors.red);
        // emit(AuthError(errorText: "Error while signing in"));
        print("xato1");

      }
    } catch (e) {
      // MyMessenger.messenger(context, "Error while signing in", Colors.red);
        // emit(AuthError(errorText: "Error while signing in"));
        emit(AuthError(errorText: "xatobor"));
        print("xato2");

    }
  }

  changeState(AuthState state) {
    emit(state);
    emailController.clear();
    passwordController.clear();
  }
}
