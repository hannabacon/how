import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:how/src/helper/enums.dart';
import 'package:mobx/mobx.dart';

part 'create_user_store.g.dart';

class CreateUserStore = CreateUserBase with _$CreateUserStore;

abstract class CreateUserBase with Store {
  CreateUserBase() {
    // getData();
  }

  GlobalKey<State> observerKey = GlobalKey<State>();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController responsibleName = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  @observable
  StatusPage statusPage = StatusPage.loading;

//   @action
//   Future<void> register() async {
//     try {
//       statusPage = StatusPage.loading;

//       if (formKey.currentState!.validate()) {
//         if (passwordController.text != confirmPasswordController.text) {
//           statusPage = StatusPage.success;
//           Functions.showScaffoldMessage(observerKey.currentContext!, 'As senhas não coincidem.', isError: true);
//           return;
//         }

//         /// Since the user and buyer do not depend on each other, use Future.wait
//         /// to perform both requests simultaneously,  thereby increasing the
//         /// performance of the application.

//         List<Map<String, dynamic>?> receivedDatas = await Future.wait([
//           UserService().createUser({'email': emailController.text, 'name': responsibleName.text, 'password': passwordController.text, 'phoneNumber': phoneController.text}),
//           BuyerService().createBuyer({'email': emailController.text,'phoneNumber': phoneController.text,'cnpj': cnpjController.text,'corporateReason': corporateReasonController.text,'fantasyName': fantasyNameController.text,'postalCode': postalCodeController.text,'state': selectedState,'city': selectedCity,'street': streetController.text,'number': numberController.text,'complement': complementController.text.isEmpty ? null : complementController.text}),
//         ]);

//         if (receivedDatas.isNotEmpty) {
//           Map<String, dynamic>? receivedBuyerUserData = await BuyerUserService().createBuyerUser({
//             'buyerId': receivedDatas[1]!['createBuyer']['id'],
//             'userId': receivedDatas[0]!['createUser']['id'],
//             'name': responsibleName.text,
//           });

//           if (receivedBuyerUserData != null) {
//             Functions.showScaffoldMessage(observerKey.currentContext!, 'Cadastro realizado com sucesso.');
//             Navigator.pop(observerKey.currentContext!);
//             return;
//           }
//         }
//       }

//       statusPage = StatusPage.success;
//     } catch(err) {
//       statusPage = StatusPage.error;
//     }
//   }
// }
}
