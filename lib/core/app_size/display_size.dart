import 'package:flutter/cupertino.dart';

enum ScreenType { Handset, Tablet, Desktop, Watch }

class SizeFactor {
  static double desktop = 900;
  static double tablet = 600;
  static double handset = 300;
}

ScreenType getSizeFactor(BuildContext context) {
  double deviceWidth = MediaQuery.of(context).size.shortestSide;
  if (deviceWidth > SizeFactor.desktop) return ScreenType.Desktop;
  if (deviceWidth > SizeFactor.tablet) return ScreenType.Tablet;
  if (deviceWidth > SizeFactor.handset) return ScreenType.Handset;
  return ScreenType.Watch;
}

enum ScreenSize { Small, Normal, Large, ExtraLarge }
ScreenSize getSize(BuildContext context) {
  double deviceWidth = MediaQuery.of(context).size.shortestSide;
  if (deviceWidth > 900) return ScreenSize.ExtraLarge;
  if (deviceWidth > 600) return ScreenSize.Large;
  if (deviceWidth > 300) return ScreenSize.Normal;
  return ScreenSize.Small;
}