import 'package:flutter/material.dart';

import '../configs/configs.dart';

double sizeHeight(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

double sizeWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

class Labels {
  Labels._();
  static const String next = 'NEXT';
  static const String registration = 'REGISTRATION';
  static const String newAccount = 'New Account';
  static const String contextRegister =
      'Please fill in the data below to register \nyour account';
}

OutlineInputBorder primaryEnable = OutlineInputBorder(
  borderRadius: BorderRadius.circular(6),
  borderSide: const BorderSide(
    color: Palette.kGrey,
    width: 2,
  ),
);

OutlineInputBorder primaryBorder = OutlineInputBorder(
  borderRadius: BorderRadius.circular(6),
  borderSide: const BorderSide(
    color: Palette.kGrey,
    width: 2,
  ),
);
OutlineInputBorder primaryFocused = OutlineInputBorder(
  borderRadius: BorderRadius.circular(6),
  borderSide: const BorderSide(
    color: Palette.kDarkPink,
    width: 2,
  ),
);
