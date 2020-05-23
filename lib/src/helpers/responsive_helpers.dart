import 'package:flutter/material.dart';

EdgeInsetsGeometry responsivePadding(MediaQueryData media) {
  double deviceWidth = media.size.width;
  if (deviceWidth < 700) {
    return EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0);
  } else if (deviceWidth < 1200) {
    return EdgeInsets.symmetric(horizontal: 50.0, vertical: 25.0);
  } else if (deviceWidth < 1650) {
    return EdgeInsets.symmetric(horizontal: 80.0, vertical: 40.0);
  }
  return EdgeInsets.symmetric(horizontal: 100.0, vertical: 50.0);
}

int responsiveNumGridTiles(MediaQueryData size) {
  double deviceWidth = size.size.width;
  if (deviceWidth < 700) {
    return 1;
  } else if (deviceWidth < 1200) {
    return 2;
  } else if (deviceWidth < 1650) {
    return 3;
  }
  return 4;
}

double responsiveImageHeight(MediaQueryData size) {
  double deviceWidth = size.size.width;
  if (deviceWidth < 700) {
    return 250;
  } else if (deviceWidth < 1200) {
    return deviceWidth*0.25;
  } else if (deviceWidth < 1650) {
    return deviceWidth*0.2;
  }
  return deviceWidth*0.15;
}

double responsiveTitleHeight(MediaQueryData size) {
  double deviceWidth = size.size.width;
  if (deviceWidth < 700) {
    return 120.0;
  } else if (deviceWidth < 1200) {
    return deviceWidth*0.1;
  } else if (deviceWidth < 1650) {
    return deviceWidth*0.07;
  }
  return deviceWidth*0.05;
}
