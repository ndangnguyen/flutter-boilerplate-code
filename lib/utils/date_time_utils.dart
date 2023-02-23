import 'package:intl/intl.dart';

class DateTimeUtil {
  static const format_MMddHHmma = "MM/dd HH:mma";
  static const format_HHmmMMdd = "HH:mm dd/MM";
  static const format_HHmmMMddyyyy = "HH:mm dd/MM/yyyy";
  static const format_HHmmMMddyyyy1 = "HH:mm - dd/MM/yyyy";
  static const format_HHmmddMMyyyy = "HH:mm, dd/MM/yyyy";
  static const format_ddMM = "dd/MM";
  static const format_MMdd = "MM/dd";
  static const format_MMdd2 = "MM-dd";
  static const format_HHmm = "HH:mm";
  static const format_HHmm2 = "HH:mm MM-dd";
  static const format_ddMMyyyy = "dd/MM/yyyy";
  static const format_dMyyyy = "d/M/yyyy";
  static const format_Myyyy = "M, yyyy";
  static const format_MyyyyCalendar = "M - yyyy";
  static const format_EEE = "EEE";
  static const format_ddMMyyyyLottery = "dd-MM-yyyy";
  static const format_yyyyMMddTHHmmssZ = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'";
  static const format_yyyyMMdd = "yyyy-MM-dd";
  static const format_ddMMyyyHHmmss = "dd-MM-yyy HH:mm:ss";
  static const format_yyyyMMddHHmmss = "yyyy-MM-dd HH:mm:ss";
  static const format_HHmmyyyyMMdd = "HH:mm - yyyy-MM-dd";
  static const format_dd = "dd";

  static String formatString(String string,
      {required String inputFormat, required String outputFormat}) {
    final dateTime = DateFormat(inputFormat).parse(string, true).toLocal();
    return DateFormat(outputFormat).format(dateTime);
  }

  static String formatDateTime(DateTime dateTime, String outputFormat) {
    return DateFormat(outputFormat).format(dateTime);
  }

  static DateTime parseString(String string,
      {required String inputFormat, bool isUTC = false}) {
    return DateFormat(inputFormat).parse(string, isUTC);
  }

  static DateTime getStartWeekByDay(DateTime dateTime) {
    return dateTime.subtract(Duration(days: dateTime.weekday - 1));
  }

  static DateTime getEndWeekByDay(DateTime dateTime) {
    return dateTime
        .add(Duration(days: DateTime.daysPerWeek - dateTime.weekday));
  }

  static bool diffDate(DateTime oneDate, DateTime twoDate) {
    return oneDate.year == twoDate.year &&
        oneDate.month == twoDate.month &&
        oneDate.day == twoDate.day;
  }
}

extension MyDateUtils on DateTime {
  DateTime copyWith(
      {int? year,
      int? month,
      int? day,
      int? hour,
      int? minute,
      int? second,
      int? millisecond,
      int? microsecond}) {
    return DateTime(
      year ?? this.year,
      month ?? this.month,
      day ?? this.day,
      hour ?? this.hour,
      minute ?? this.minute,
      second ?? this.second,
      millisecond ?? this.millisecond,
      microsecond ?? this.microsecond,
    );
  }
}
