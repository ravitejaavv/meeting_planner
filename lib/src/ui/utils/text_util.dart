
class TextUtil {
  static bool isEmpty(String str) {
    if(str == null) return true;
    if(str.trim().length == 0) return true;
    return false;
  }
}
