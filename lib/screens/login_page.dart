import 'package:flutter/material.dart';
import 'package:practice_list_view/controllers/login_controller.dart';
import 'package:practice_list_view/screens/components/default_button.dart';
import 'package:practice_list_view/screens/components/default_textfield.dart';
import 'package:practice_list_view/utils/consts/colors.dart';
import 'package:practice_list_view/utils/theme.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final LoginController controller = LoginController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor,
      appBar: AppBar(backgroundColor: mainColor),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Text(
                  'Hyrule Compendium',
                  textAlign: TextAlign.center, // Centraliza o texto
                  style: EntryDecoration.titleText.copyWith(
                    fontSize: 32,
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(height: 60),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.0),
                child: DefaultTextfield(
                  text: 'Email',
                ),
              ),
              const SizedBox(height: 16),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.0),
                child: DefaultTextfield(
                  text: 'Password',
                ),
              ),
              const SizedBox(height: 24),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                DefaultButton(
                  text: 'Login',
                  onPressed: () {},
                ),
                const SizedBox(height: 12),
                const SizedBox(
                    width: double.infinity,
                    child: Text(
                      'Or...',
                      textAlign: TextAlign.center,
                    )),
                const SizedBox(height: 12),
                DefaultButton(
                  text: 'Create account',
                  onPressed: () {
                    controller.createAccount(
                        'teste@hotmail.com', 'SenhaComplexa@100');
                  },
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
