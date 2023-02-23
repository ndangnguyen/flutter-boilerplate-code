class VietnameseCurrencyReader {
  static const _arrayNumber = ['không', 'một', 'hai', 'ba', 'bốn', 'năm', 'sáu', 'bảy', 'tám', 'chín'];

  static String _redDozens(int number, full) {
    var stringNumber = '';
    final dozen = (number / 10).floor();
    final unit = number % 10;
    if (dozen > 1) {
      stringNumber = ' ${_arrayNumber[dozen]} mươi';
      if (unit == 1) {
        stringNumber += ' mốt';
      }
    } else if (dozen == 1) {
      stringNumber = ' mười';
      if (unit == 1) {
        stringNumber += ' một';
      }
    } else if (full && unit > 0) {
      stringNumber = ' lẻ';
    }
    if (unit == 5 && dozen > 1) {
      stringNumber += ' lăm';
    } else if (unit > 1 || (unit == 1 && dozen == 0)) {
      stringNumber += ' ' + _arrayNumber[unit];
    }
    return stringNumber;
  }

  static String _block(int number, full) {
    var stringNumber = '';
    final hundred = (number / 100).floor();
    number %= 100;
    if (full || hundred > 0) {
      stringNumber = ' ${_arrayNumber[hundred]} trăm';
      stringNumber += _redDozens(number, true);
    } else {
      stringNumber = _redDozens(number, false);
    }
    return stringNumber;
  }

  static String _redMillions(int number, full) {
    var stringNumber = '';
    final milion = (number / 1000000).floor();
    number %= 1000000;
    if (milion > 0) {
      stringNumber = '${_block(milion, full)} triệu';
      full = true;
    }
    final thousand = (number / 1000).floor();
    number %= 1000;
    if (thousand > 0) {
      stringNumber += '${_block(thousand, full)} nghìn';
      full = true;
    }
    if (number > 0) {
      stringNumber += _block(number, full);
    }
    return stringNumber;
  }

  static String convertToWords(int number) {
    if (number == 0) return _arrayNumber[0];
    var stringNumber = '';
    var hauto = '';
    var bilion = 0;
    do {
      bilion = number % 1000000000;
      number = (number / 1000000000).floor();
      if (number > 0) {
        stringNumber = _redMillions(bilion, true) + hauto + stringNumber;
      } else {
        stringNumber = _redMillions(bilion, false) + hauto + stringNumber;
      }
      hauto = ' tỷ';
    } while (number > 0);
    stringNumber = stringNumber.trim();
    stringNumber = stringNumber[0].toUpperCase() + stringNumber.substring(1);
    return stringNumber;
  }
}
