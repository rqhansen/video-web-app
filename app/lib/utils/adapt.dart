import 'package:flutter/material.dart';
import 'dart:ui';

class Adapt {
  static MediaQueryData mediaQuery = MediaQueryData.fromWindow(window);
  static double _width = mediaQuery.size.width;
  static double _height = mediaQuery.size.height;
  static double _topBarH = mediaQuery.padding.top;
  static double _botBarH = mediaQuery.padding.bottom;
  static double _pixelRatio = mediaQuery.devicePixelRatio;

  // 设备宽和ui的设备宽度之比
  static var _ratio;

  static init(int number) {
      int uiWidth = number is int ? number : 750;
      _ratio = _width / uiWidth;
  }

  // fontSize,width.height,margin
  static px(number) {
      if(!(_ratio is double || _ratio is int)) {
        Adapt.init(750);
      }
      return _ratio * number;
  }


  static onePx() {
    return 1 / _pixelRatio;
  }

  static screenW() {
    return _width;
  }

  static screenH() {
    return _height;
  }

  static padTopH() {
    return _topBarH;
  }

  static padBotH() {
    return _botBarH;
  }
}