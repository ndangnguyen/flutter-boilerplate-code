import 'package:flutter/services.dart';

class TrimTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    return TextEditingValue(
      text: newValue.text.trim(),
      selection: TextSelection.fromPosition(TextPosition(offset: newValue.text.length)),
    );
  }
}
