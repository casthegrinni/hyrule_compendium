import 'package:flutter_test/flutter_test.dart';
import 'package:practice_list_view/controllers/login_controller.dart';
import 'package:practice_list_view/utils/consts/login_constants.dart';

void main() {
  final controller = LoginController();

  test('Show error when password is Empty', () {
    expect(controller.validatePassword(''), errorLoginEmpty);
  });

  test('Show error when password is not long enough', () {
    expect(controller.validatePassword('a'), errorLoginSixCharacters);
    expect(controller.validatePassword('11'), errorLoginSixCharacters);
    expect(controller.validatePassword('abc1'), errorLoginSixCharacters);
    expect(controller.validatePassword('abc15'), errorLoginSixCharacters);
    expect(controller.validatePassword('a'), errorLoginSixCharacters);
  });

  test('Show error when only have numbers', () {
    expect(controller.validatePassword('123456'), errorLoginWithoutNumbers);
  });
}
