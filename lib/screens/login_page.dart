import 'package:flutter/material.dart';
import 'package:practice_list_view/controllers/login_controller.dart';
import 'package:practice_list_view/screens/components/default_button.dart';
import 'package:practice_list_view/screens/components/default_textfield.dart';
import 'package:practice_list_view/screens/result_page.dart';
import 'package:practice_list_view/utils/consts/colors.dart';
import 'package:practice_list_view/utils/consts/images.dart';
import 'package:practice_list_view/utils/theme.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final LoginController controller = LoginController();

  void goToResultPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ResultPage(),
      ),
    );
  }

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
                child: Column(
                  children: [
                    Text(
                      'Hyrule Compendium',
                      textAlign: TextAlign.center,
                      style: EntryDecoration.titleText.copyWith(
                        fontSize: 32,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 205, child: Image.asset(appLogo))
                  ],
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
                  onPressed: () {
                    goToResultPage(context);
                  },
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
