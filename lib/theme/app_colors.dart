part of 'theme.dart';

class AppColors {
  static Color blue = const Color(0xFF007AC3);
  static Color k141414 = const Color(0xFF141414);
  static Color darkBlue = const Color(0xFF020D24);

  static Color random() {
    return Color(Random().nextInt(0xffffffff)).withAlpha(0xff);
  }
}

extension ColorExt on Color {
  Color darken([double amount = .1]) {
    assert(amount >= 0 && amount <= 1);

    final hsl = HSLColor.fromColor(this);
    final hslDark = hsl.withLightness((hsl.lightness - amount).clamp(0.0, 1.0));

    return hslDark.toColor();
  }

  Color lighten([double amount = .1]) {
    assert(amount >= 0 && amount <= 1);

    final hsl = HSLColor.fromColor(this);
    final hslLight =
        hsl.withLightness((hsl.lightness + amount).clamp(0.0, 1.0));

    return hslLight.toColor();
  }
}
