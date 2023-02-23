class Validators {
  static String? validateLoginUserName(String? username) {
    final String text = (username ?? '').trim();

    if (text.isEmpty) {
      // return Strings.usernameEmpty;
    }
    if (text.length < 6) {
      // return Strings.usernameLength;
    }
    if (!RegExp(r"^[a-zA-Z 0-9\_]+$").hasMatch(text)) {
      // return Strings.usernameSpecial;
    }
    return null;
  }
}
