import 'package:flutter/material.dart';

import '../constants/index.dart';

class GlobalStyles {
  static TextStyle stylesTitleAppBar(isDarkMode) {
    return TextStyle(
        fontSize: 24,
        fontFamily: AppFonts.roboto,
        color: Colors.white,
        fontWeight: FontWeight.bold);
  }

  static final TextStyle stylesTitleAppBarNoColor =
      TextStyle(fontSize: 24, color: Colors.white, fontFamily: AppFonts.roboto);

  static final EdgeInsets paddingPageLeftRight =
      EdgeInsets.symmetric(horizontal: 12);
  static final EdgeInsets paddingPageLeftRight_4 =
      EdgeInsets.symmetric(horizontal: 4);
  static final EdgeInsets paddingPageLeftRight_15 =
      EdgeInsets.symmetric(horizontal: 15);
  static final EdgeInsets paddingPageLeftRight_25 =
      EdgeInsets.symmetric(horizontal: 25);
  static final EdgeInsets paddingPageLeftRight_45 =
      EdgeInsets.symmetric(horizontal: 45);
  static final EdgeInsets paddingAll = EdgeInsets.all(12);
  static final EdgeInsets paddingAll_8 = EdgeInsets.all(8);
  static final EdgeInsets paddingAll18 = EdgeInsets.all(18);
  static final EdgeInsets paddingAll25 = EdgeInsets.all(25);
  static final SizedBox sizedBoxHeight_10 = SizedBox(
    height: 10,
  );
  static final SizedBox sizedBoxHeight = SizedBox(
    height: 15,
  );
  static final SizedBox sizedBoxWidth = SizedBox(
    width: 15,
  );
  static final SizedBox sizedBoxWidth_5 = SizedBox(
    width: 5,
  );
  static final SizedBox sizedBoxWidth_30 = SizedBox(
    width: 30,
  );
  static final SizedBox sizedBoxWidth_35 = SizedBox(
    width: 35,
  );
  static final SizedBox sizedBoxHeight_25 = SizedBox(
    height: 25,
  );
  static final SizedBox sizedBoxHeight_50 = SizedBox(
    height: 50,
  );
  static final SizedBox sizedBoxHeight_75 = SizedBox(
    height: 75,
  );
  static final SizedBox sizedBoxHeight_100 = SizedBox(
    height: 100,
  );
  static final SizedBox sizedBoxHeight_125 = SizedBox(
    height: 125,
  );
  static final SizedBox sizedBoxHeight_150 = SizedBox(
    height: 150,
  );
}
