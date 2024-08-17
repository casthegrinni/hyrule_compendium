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

  void _handleLogin(BuildContext context, String email, String password) async {
    final result = await controller.doLogin(email, password);

    if (!context.mounted) {
      return;
    }
    if (result.success) {
      goToResultPage(context);
    } else {
      _showAlert(context, 'Attention', result.error ?? 'Unexpected error');
    }
  }

  void _handleSignIn(
      BuildContext context, String email, String password) async {
    final result = await controller.createAccount(email, password);

    if (!context.mounted) {
      return;
    }
    if (result.success) {
      goToResultPage(context);
    } else {
      _showAlert(context, 'Attention', result.error ?? 'Unexpected error');
    }
  }

  void _showAlert(BuildContext context, String title, String body) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(body),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

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
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: DefaultTextfield(
                    text: 'Email', controller: emailController),
              ),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: DefaultTextfield(
                  text: 'Password',
                  obscureText: true,
                  controller: passwordController,
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
                    _handleLogin(
                        context, emailController.text, passwordController.text);
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
                    _handleSignIn(
                        context, emailController.text, passwordController.text);
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
