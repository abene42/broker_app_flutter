import 'package:get/get_utils/src/extensions/string_extensions.dart';

class HelperClass {
  /// Change the first letters of each words into upper case
  static String capitalizeWords(String word) =>
      word.split(" ").map((str) => str.capitalize).join(" ");
}
