import 'package:flutter/material.dart';
import 'package:how/src/helper/enums.dart';
import 'package:how/src/helper/functions.dart';
import 'package:how/src/screen/home_screen/home_screen.dart';
import 'package:how/src/services/auth_service.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';


part 'login_store.g.dart';

class LoginStore = LoginBase with _$LoginStore;

abstract class LoginBase with Store {


  GlobalKey<State> observerKey = GlobalKey<State>();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  late SharedPreferences sharedPreferences;

  @observable
  StatusPage statusPage = StatusPage.success;

  Future<void> login() async {
    try {
      statusPage = StatusPage.loading;

      // if (formKey.currentState!.validate()) {
      //   Map<String, dynamic>? receivedAuthentication = await AuthService().login(emailController.text, passwordController.text);

      //   if (receivedAuthentication?['login'] != null) {
      //     sharedPreferences.setString('token', receivedAuthentication!['login']);
          
        
      //     Navigator.pushNamedAndRemoveUntil(observerKey.currentContext!, HomeScreen.routeName, (route) => false);
      //   } else {
      //     Functions.showScaffoldMessage(observerKey.currentContext!, 'Email ou senha incorretos', isError: true);
      //   }
      // }

      statusPage = StatusPage.success;
    } catch (err) {
      statusPage = StatusPage.error;
    }
  }
}