extension StringToInt on String {
  int get parseInt => int.parse(this);

  double get parseDouble => double.tryParse(this) ?? 0;
}
