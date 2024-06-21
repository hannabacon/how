import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:how/src/helper/enums.dart';
import 'package:how/src/store/login_store.dart';
import 'package:how/src/widgets/receitas_button.dart';
import 'package:how/src/widgets/receitas_loading.dart';
import 'package:how/src/widgets/receitas_textfield.dart';

class Body extends StatelessWidget {
  final LoginStore store = LoginStore();

  Body({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Observer(
        key: store.observerKey,
        builder: (context) {
          if (store.statusPage == StatusPage.loading) {
            return const ReceitasLoading();
          }

          if (store.statusPage == StatusPage.success) {
            return SingleChildScrollView(
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                alignment: Alignment.center,
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 40),
                      child: Image.asset(
                        '/images/logonova.png',
                        height: 250,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 16, bottom: 40),
                      child: SizedBox(
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(bottom: 10),
                              child: Text(
                                'Realizar Login',
                                style: TextStyle(
                                  fontWeight: FontWeight.w800,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                            Text(
                              'Faça login para ter acesso ao How to Cook',
                              style: TextStyle(
                                color: Colors.grey,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Form(
                      key: store.formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 20, right: 10, left: 10),
                            child: ReceitasTextfield(
                              label: 'Email',
                              controller: store.emailController,
                              keyboardType: TextInputType.emailAddress,
                              obscureText: false,
                              autoFocus: false,
                              enabled: true,
                              width: MediaQuery.of(context).size.width,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 20, right: 10, left: 10),
                            child: ReceitasTextfield(
                              label: 'Senha',
                              controller: store.passwordController,
                              keyboardType: TextInputType.visiblePassword,
                              obscureText: true,
                              autoFocus: false,
                              enabled: true,
                              width: MediaQuery.of(context).size.width,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 30, right: 30, left: 10),
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: MouseRegion(
                                cursor: SystemMouseCursors.click,
                                child: GestureDetector(
                                  onTap: () {},
                                  child: const Text('Esqueci minha senha'),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 20, right: 20, left: 10),
                            child: ReceitasButton(
                              label: 'Entrar',
                              width: MediaQuery.of(context).size.width,
                              onClick: () => store.login(),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 20, right: 20, left: 10),
                            child: ReceitasButton(
                              label: 'Continuar sem conta',
                              width: MediaQuery.of(context).size.width,
                              onClick: () => Navigator.pushNamed(context, '/home'),
                            ),
                          ),
                           Padding(
                            padding: const EdgeInsets.only(bottom: 20, right: 20, left: 10),
                            child: ReceitasButton(
                              label: 'Criar conta',
                              width: MediaQuery.of(context).size.width,
                              onClick: () => Navigator.pushNamed(context, '/create-user'),
                              variant: 'secondary',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
          return Container();
        },
      ),
    );
  }
}
