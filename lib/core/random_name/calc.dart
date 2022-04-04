import 'dart:math';
import 'dart:typed_data';

import 'name.dart';

class RandomName {
  ///**方法2*/
  static String randomName(bool simple, int len) {
    int surNameLen = surName.length;
    int doubleSurNameLen = doubleSurName.length;
    int wordLen = word.length;

    String sb = '';
    Random random = Random();
    if (simple) {
      sb += surName[random.nextInt(surNameLen)];
      int surLen = sb.length;
      for (int i = 0; i < len - surLen; i++) {
        if (sb.length <= len) {
          sb += word[random.nextInt(wordLen)];
        }
      }
    } else {
      sb += doubleSurName[random.nextInt(doubleSurNameLen)];
      int doubleSurLen = sb.length;
      for (int i = 0; i < len - doubleSurLen; i++) {
        if (sb.length <= len) {
          sb += word[random.nextInt(wordLen)];
        }
      }
    }

    // print('sb====$sb');
    return sb;
  }

  ///**方法1*/
  static String getRandomJianHan(int len) {
    String randomName = "";
    for (int i = 0; i < len; i++) {
      String str;
      Random random = Random();
      int highPos = (176 + random.nextInt(39).abs()); // 获取高位值
      int lowPos = (161 + random.nextInt(93).abs()); // 获取低位值

      // print('highPos=$highPos');
      // print('lowPos=$lowPos');
      Uint8List b = Uint8List(2);
      b[0] = ByteData(highPos).getUint8(0);
      b[1] = ByteData(lowPos).getUint8(0);
      str = b.asMap().toString();
      randomName += str;
    }
    return randomName;
  }
}
