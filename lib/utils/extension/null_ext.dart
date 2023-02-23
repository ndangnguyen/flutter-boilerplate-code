extension NullableNum on num? {
  num get nullToZero => this ?? 0;
}

extension NullableInt on int? {
  int get nullToZero => this ?? 0;
}

extension NullableDouble on double? {
  double get nullToZero => this ?? 0;
}

extension NullableString on String? {
  String get nullToEmpty => this ?? "";
}

extension NullableBool on bool? {
  bool get isTrue => this == true;

  bool get isNotTrue => this != true;
}

extension NullableNumDynamic on dynamic {
  num get nullToZero => this ?? 0;

  double get toDouble => double.tryParse(toString()) ?? 0;
}
