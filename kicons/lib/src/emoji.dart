import 'package:flutter/widgets.dart';
import 'package:kicons/kicons.dart';

/// 表情Icon
class EmojiIcon {
  static const String _family = "Emoji";

  EmojiIcon._();

  static const IconData angry =
      IconData(0xeaf4, fontFamily: _family, fontPackage: package);
  static const IconData astonished =
      IconData(0xeaf5, fontFamily: _family, fontPackage: package);
  static const IconData confounded =
      IconData(0xeaf6, fontFamily: _family, fontPackage: package);
  static const IconData confused =
      IconData(0xeaf7, fontFamily: _family, fontPackage: package);
  static const IconData crying =
      IconData(0xeaf8, fontFamily: _family, fontPackage: package);
  static const IconData dizzy =
      IconData(0xeaf9, fontFamily: _family, fontPackage: package);
  static const IconData expressionless =
      IconData(0xeafa, fontFamily: _family, fontPackage: package);
  static const IconData heart_eyes =
      IconData(0xeafb, fontFamily: _family, fontPackage: package);
  static const IconData laughing =
      IconData(0xeafc, fontFamily: _family, fontPackage: package);
  static const IconData nerd_smile =
      IconData(0xeafd, fontFamily: _family, fontPackage: package);
  static const IconData open_mouth =
      IconData(0xeafe, fontFamily: _family, fontPackage: package);
  static const IconData rage =
      IconData(0xeaff, fontFamily: _family, fontPackage: package);
  static const IconData rolling_eyes =
      IconData(0xeb00, fontFamily: _family, fontPackage: package);
  static const IconData sad =
      IconData(0xeb01, fontFamily: _family, fontPackage: package);
  static const IconData simple_smile =
      IconData(0xeb02, fontFamily: _family, fontPackage: package);
  static const IconData slightly_smile =
      IconData(0xeb03, fontFamily: _family, fontPackage: package);
  static const IconData smirk =
      IconData(0xeb04, fontFamily: _family, fontPackage: package);
  static const IconData stuck_out_tongue =
      IconData(0xeb05, fontFamily: _family, fontPackage: package);
  static const IconData wink_smile =
      IconData(0xeb06, fontFamily: _family, fontPackage: package);
  static const IconData worried =
      IconData(0xeb07, fontFamily: _family, fontPackage: package);

  /// 返回IconData列表
  static List<IconData> toList() {
    final result = <IconData>[];
    for (int i = 0xeaf4; i <= 0xeb07; i++) {
      result.add(IconData(i, fontFamily: _family, fontPackage: package));
    }
    return result;
  }
}
