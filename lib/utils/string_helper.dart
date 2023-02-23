import 'dart:convert';

import 'package:intl/intl.dart';

class StringHelper {
  static String formatCurrency(num amount) {
    return NumberFormat("###,###,###", "en_us").format(amount);
  }

  static String formatCurrencyEn(num amount) {
    return NumberFormat("###,###,###", "en_US").format(amount);
  }

  static String formatCurrencyVND(num amount, {String currencyUnit = 'VNĐ'}) {
    return NumberFormat("###,###,###", "en_US").format(amount) + " " + currencyUnit;
  }

  static String formatCurrencyD(num amount, {String currencyUnit = 'đ'}) {
    return NumberFormat("###,###,###.###", "en_US").format(amount) + " " + currencyUnit;
  }

  static num formatCoinToCurrency(num amount) {
    final currencyAmount = amount * 1000;
    return currencyAmount;
  }

  static String formatCoinToCurrencyVND(num amount) {
    final currencyAmount = amount * 1000;
    return formatCurrencyVND(currencyAmount);
  }

  static String formatCurrencyToCoin(num amount) {
    final currencyAmount = amount * 1000;
    return formatCurrency(currencyAmount);
  }

  static String formatPhoneNumber(String phone) {
    return phone.replaceAllMapped(RegExp(r'(\d{4})(\d{3})(\d+)'), (Match m) => "${m[1]} ${m[2]} ${m[3]}");
  }

  static String getInitials({String? string, int? limitTo}) {
    var buffer = StringBuffer();
    var split = string?.split(' ');
    if (split != null) {
      for (var i = 0; i < (limitTo ?? split.length); i++) {
        buffer.write(split[i][0]);
      }
    }
    return buffer.toString();
  }

  static String formatEllipsis(String amount, int limit) {
    if (amount.length > limit) {
      amount = amount.substring(0, limit) + "...";
    }
    return amount;
  }

  static String getRealUrl(String url) {
    try {
      return "https://" + url.substring(2);
    } catch (_) {
      return "";
    }
  }

  static String shortcutName(String name) {
    if (name.length > 6) {
      return name.substring(0, 6) + "****";
    }
    return name;
  }

  static String formatCoinWithoutZeroSuffix(num amount) {
    final coin = amount / 1000;
    try {
      return formatCurrency(coin.toInt());
    } catch (e) {
      return '';
    }
  }
}

extension StringExt on String {
  toJson() => jsonDecode(this);
}
