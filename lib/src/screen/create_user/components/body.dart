import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:how/src/helper/enums.dart';
import 'package:how/src/store/create_user_store.dart';
import 'package:how/src/widgets/receitas_button.dart';
import 'package:how/src/widgets/receitas_loading.dart';
import 'package:how/src/widgets/receitas_textfield.dart';

class Body extends StatelessWidget {
  final CreateUserStore store = CreateUserStore();

  Body({super.key});

  @override
  Widget build(BuildContext context) {
    // return Observer(
    //     key: store.observerKey,
        // builder: (context) {
        //   if (store.statusPage == StatusPage.loading) {
        //     return const ReceitasLoading();
        //   }

        //   if (store.statusPage == StatusPage.success) {
            return SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(bottom: 16),
                    child: Text(
                      'Para se cadastrar, preencha os campos abaixo.',
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Form(
                    key: store.formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 16),
                          child: ReceitasTextfield(
                            label: 'Email',
                            controller: store.emailController,
                            keyboardType: TextInputType.emailAddress,
                            obscureText: false,
                            autoFocus: false,
                            enabled: true,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 16),
                          child: ReceitasTextfield(
                            label: 'Nome completo',
                            controller: store.responsibleName,
                            keyboardType: TextInputType.emailAddress,
                            obscureText: false,
                            autoFocus: false,
                            enabled: true,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 16),
                          child: ReceitasTextfield(
                            label: 'Senha',
                            controller: store.passwordController,
                            keyboardType: TextInputType.emailAddress,
                            obscureText: false,
                            autoFocus: false,
                            enabled: true,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 16),
                          child: ReceitasTextfield(
                            label: 'Confirmar senha',
                            controller: store.confirmPasswordController,
                            keyboardType: TextInputType.emailAddress,
                            obscureText: false,
                            autoFocus: false,
                            enabled: true,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 16),
                          child: ReceitasButton(
                            label: 'Registrar',
                            width: MediaQuery.of(context).size.width,
                            onClick: () {},
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            );
          }

  //         return Container();
  //       });
  // }
}
