import 'dart:ui';

class PiecewisePalette {
  // Basic colors should be private and never used outside this class. If you
  // need to use color, set it to another property in this class that defines
  // its function.
  static const Color _brightGray = Color(0xFFEFEFEF);
  static const Color _richBlack = Color(0xFF010104);
  static const Color _teaGreen = Color(0xFFBBFFC3);
  static const Color _shamrockGreen = Color(0xFF0EA461);
  static const Color _weldonBlue = Color(0xFF7E9CAA);

  // Here we define the color palette for the app, ONLY using the basic
  // colors above.
  static const Color text = _brightGray;
  static const Color background = _richBlack;
  static const Color primary = _teaGreen;
  static const Color secondary = _shamrockGreen;
  static const Color accent = _weldonBlue;
}
