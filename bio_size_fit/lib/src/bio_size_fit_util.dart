import 'dart:ui';
import 'package:flutter/material.dart';

class BioSizeFit {
  static double? physicalWidth;
  static double? physicalHeight;

  static double? screenWidth;
  static double? screenHeight;

  static double? dpr;
  static double? statusHeight;
  static double? safeHeight;
  static const double appBarHeight = kToolbarHeight;
  static double tabBarHeight = kBottomNavigationBarHeight;

  static double? rpx;
  static double? px;

  static void initialize({double standardSize = 1170}) {
    //1、获取手机物理分辨率
    physicalWidth = window.physicalSize.width;
    physicalHeight = window.physicalSize.height;

    //2、获取dpr
    dpr = window.devicePixelRatio;

    //3、获取宽度和高度
    screenWidth = physicalWidth! / dpr!;
    screenHeight = physicalHeight! / dpr!;

    //4、状态栏高度
    statusHeight = window.padding.top / dpr!;

    //5、底部安全区高度
    safeHeight = window.padding.bottom / dpr!;

    //6、计算rpx
    rpx = screenWidth! / standardSize;
    px = screenWidth! / standardSize * 2; //*2得去掉 ？
  }

  static double setRpx(double size) => rpx! * size;

  static double setPx(double size) => px! * size;
}

//int 类型的扩展
extension IntFit on int {
  double get px => BioSizeFit.setPx(toDouble());

  double get rpx => BioSizeFit.setRpx(toDouble());
}

//double 类型的扩展
extension DoubleFit on double {
  double get px => BioSizeFit.setPx(this);

  double get rpx => BioSizeFit.setRpx(this);
}
