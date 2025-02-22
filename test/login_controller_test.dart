import 'package:flutter_test/flutter_test.dart';
import 'package:practice_list_view/controllers/login_controller.dart';
import 'package:practice_list_view/utils/consts/login_constants.dart';

void main() {
  final controller = LoginController();

  test('Show error when password is not long enough', () {
    expect(controller.validatePassword('11'), errorSixCharacters);
    expect(controller.validatePassword('abc1'), errorSixCharacters);
    expect(controller.validatePassword('AbC123'), null);
  });
}
