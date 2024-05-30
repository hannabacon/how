import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:how/src/helper/enums.dart';
import 'package:mobx/mobx.dart';

part 'my_profile_store.g.dart';

class MyProfileStore = MyProfileBase with _$MyProfileStore;

abstract class MyProfileBase with Store {
  MyProfileBase() {
    // getData();
  }

  late int userId;

  GlobalKey<State> observerKey = GlobalKey<State>();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Map<String, dynamic> user = {};
  Map<String, dynamic> seller = {};

  TextEditingController corporateNameController = TextEditingController();
  TextEditingController fantasyNameController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController cnpjController = TextEditingController();
  TextEditingController postalCodeController = TextEditingController();
  TextEditingController districtController = TextEditingController();
  TextEditingController streetController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController complementController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
 
  @observable
  StatusPage statusPage = StatusPage.loading;

  @observable
  String selectedState = '';

  @observable
  String selectedCity = '';

  // @action
  // Future<void> getData() async {
  //   try {
  //     statusPage = StatusPage.loading;
      
  //     sharedPreferences = await SharedPreferences.getInstance();

  //     userId = sharedPreferences.getInt('userId')!;

  //     Map<String, dynamic>? receivedSellerUser = await SellerUserService().showBuyerByUserId(userId);

  //     if (receivedSellerUser?['showSellerUserByUserId'] != null) {
  //       seller = receivedSellerUser!['showSellerUserByUserId'];

  //       corporateNameController.text = seller['seller']['corporateReason'];
  //       fantasyNameController.text = seller['seller']['fantasyName'];
  //       nameController.text = seller['name'];
  //       cnpjController.text = seller['seller']['cnpj'];
  //       postalCodeController.text = seller['seller']['postalCode'];
  //       phoneController.text = seller['seller']['phoneNumber'];
  //       emailController.text = seller['seller']['email'];
  //       streetController.text = seller['seller']['street'];
  //       numberController.text = seller['seller']['number'];
  //       complementController.text = seller['seller']['complement'];
  //       selectedState = seller['seller']['state'];
  //       selectedCity = seller['seller']['city'];
  //     }

  //     statusPage = StatusPage.success;
  //   } catch(err) {
  //     statusPage = StatusPage.error;
  //   }
  // }

  // @action
  // Future<void> saveData() async {
  //   try {
  //     statusPage = StatusPage.loading;
      
  //     if (formKey.currentState!.validate()) {
  //       await Future.delayed(const Duration(seconds: 2));
  //     }

  //     statusPage = StatusPage.success;
  //   } catch(err) {
  //     statusPage = StatusPage.error;
  //   }
  // }
}