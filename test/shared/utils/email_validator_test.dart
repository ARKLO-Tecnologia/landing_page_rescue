import 'package:flutter_test/flutter_test.dart';
import 'package:rescue_pitchtech/shared/utils/email_validator.dart';

void main() {
  group('EmailValidator', () {
    test('aceita e-mails válidos', () {
      expect(EmailValidator.isValid('maria@hospital.com'), isTrue);
      expect(EmailValidator.isValid(' user@rescue.com.br '), isTrue);
    });

    test('rejeita e-mails inválidos', () {
      expect(EmailValidator.isValid('invalido'), isFalse);
      expect(EmailValidator.isValid('a@'), isFalse);
      expect(EmailValidator.isValid('@hospital.com'), isFalse);
    });
  });
}
