
import 'dart:ui';

import 'package:flutter/material.dart';

class TextStyles {

  static TextStyle medBoldBlack = const TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 14,
  );

  static TextStyle bigBoldBlack = const TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 18,
  );

  static TextStyle smallGray = TextStyle(
    fontSize: 11,
    color: Colors.grey[400]
  );

  static TextStyle medGray = TextStyle(
      fontSize: 14,
      color: Colors.grey[400]
  );

  static TextStyle smallBlack = const TextStyle(
      fontSize: 11,
    overflow: TextOverflow.ellipsis
  );

  static TextStyle medBlack = const TextStyle(
      fontSize: 14,
      overflow: TextOverflow.ellipsis
  );

  static TextStyle bigBlack = const TextStyle(
      fontSize: 18,
  );
}