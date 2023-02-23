extension BooleanExt on bool? {
  bool get isTrue => this != null && this == true;

  bool get isNotTrue => this != true;
}
