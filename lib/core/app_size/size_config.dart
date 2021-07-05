// import 'package:flutter/material.dart';
// import 'package:flutter/cupertino.dart';

// class SizeConfig {
//   static double _width;
//   static double _height;
//   static double _blockSizeHorizontal = 0;
//   static double _blockSizeVertical = 0;

//   static double textMul;
//   static double imgMul;
//   static double heightMul;
//   static double widthMul;
//   static bool isPortrait = true;
//   static bool isMobilePortrait = false;

//   SizeConfig(BoxConstraints constraints, Orientation orientation) {
    
//     if (orientation == Orientation.portrait) {
//       _width = constraints.maxWidth;
//       _height = constraints.maxHeight;
//       isPortrait = true;
//       if (_width < 450.0) {
//         isMobilePortrait = true;
//       }
//     } else {
//       _width = constraints.maxHeight;
//       _height = constraints.maxWidth;
//       isPortrait = false;
//       isMobilePortrait = false;
//     }

//     _blockSizeHorizontal = _width / 100;
//     _blockSizeVertical = _height / 100;

//     textMul = _blockSizeVertical;
//     imgMul = _blockSizeHorizontal;
//     heightMul = _blockSizeVertical;
//     widthMul = _blockSizeHorizontal;

//     print('height: $_height');
//     print('width: $_width');
//     print('text multiplier: $textMul');
//     print('image multiplier: $imgMul');
//     print('height multiplier: $heightMul');
//     print('width multiplier: $widthMul');
//     print('potrait: $isPortrait');
//   }
// }