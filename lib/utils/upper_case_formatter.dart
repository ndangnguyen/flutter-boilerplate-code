import 'package:flutter/services.dart';

class UpperCaseTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    return TextEditingValue(
      text: newValue.text.toUpperCase().trimLeft(),
      selection: TextSelection.fromPosition(TextPosition(offset: newValue.text.length)),
    );
  }
}
