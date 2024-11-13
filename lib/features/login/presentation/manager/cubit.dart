import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_strucutre_project/core/remote/service.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/models/login_model.dart';
import '../../data/repo_impl/repo_impl.dart';
import 'state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.api) : super(LoginStateInitial());
  ServiceApiLogin api;

  LoginModel? userModel;
  final TextEditingController forget = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController pass = TextEditingController();
  //register
  final TextEditingController name = TextEditingController();
  final TextEditingController mobile = TextEditingController();
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();
  final TextEditingController resetPass = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey();
  Future<void> loginAuth(BuildContext context) async {
    var pref = await SharedPreferences.getInstance();

    emit(LoadingLoginAuth());
    final response = await api.loginAuth(
      phone: email.text,
      password: pass.text,
    );

    response.fold(
            (l) {
          emit(ErrorLoginAuth());
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("حدث خطأ"),
              backgroundColor: Colors.red,
            ),
          );
        },
            (r) async {
          // emit(LoadingLoginAuth());

          // if(r.value==true){
          //   email.clear();
          //   pass.clear();
          //   SharedPreferences prefs = await SharedPreferences.getInstance();
          //   prefs.setString('auth-token', r.data?.accessToken.toString() ?? "");
          //   Preferences.instance.setUser(r).then((value) {
          //     userModel = r;
          //     Navigator.pushNamedAndRemoveUntil(
          //       context,
          //       Routes.mainRoute,
          //           (route) => false,
          //     );
          //     successGetBar(r.value?.toString());
          //   });
          //   Preferences.instance.getUserModel();
          //   // Emit success state
          //   emit(LoadedLoginAuth());
          //   pref.setBool('onBoarding', true);
          // }


        }
    );
  }

}
