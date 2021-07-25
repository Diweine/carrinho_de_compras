import '../../exports_libs.dart';

class AppColors {
  static const Color verde = Color.fromRGBO(62, 129, 93, 1);
  static const Color cinza = Color.fromRGBO(242, 245, 250, 1);
  static const Color cinzaescuro = Color.fromRGBO(207, 209, 212, 1);
  static const Color vermelho = Color.fromRGBO(235, 78, 66, 0.8);
}

Map<int, Color> color = {
  50: Color.fromRGBO(62, 129, 93, .1),
  100: Color.fromRGBO(62, 129, 93, .2),
  200: Color.fromRGBO(62, 129, 93, .3),
  300: Color.fromRGBO(62, 129, 93, .4),
  400: Color.fromRGBO(62, 129, 93, .5),
  500: Color.fromRGBO(62, 129, 93, .6),
  600: Color.fromRGBO(62, 129, 93, .7),
  700: Color.fromRGBO(62, 129, 93, .8),
  800: Color.fromRGBO(62, 129, 93, .9),
  900: Color.fromRGBO(62, 129, 93, 1),
};

MaterialColor colorCustom = MaterialColor(0xFF3e815d, color);
