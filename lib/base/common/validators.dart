class Validators {
  /// Dont allow empty controller.
  static String? validateLogin(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter some text';
    }
    return null;
  }

  /// Dont allow empty controller or controller without '@' and '.'.
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }
    if (!value.contains('@') || !value.contains('.')) {
      return 'Please enter a viable email addresss';
    }
    return null;
  }

  /// Dont allow controller without length of 8 and containing atleast 1 of
  /// small letter, capital letter, number and symbol.
  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    }

    return null;
  }
}
