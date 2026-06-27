abstract final class EmailValidator {
  static final RegExp _pattern = RegExp(
    r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
  );

  static bool isValid(String email) => _pattern.hasMatch(email.trim());
}
