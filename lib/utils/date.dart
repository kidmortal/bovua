class Utils {
  static String isoStringToDate(String? s) {
    if (s == null) return "";
    final date = DateTime.parse(s);
    return "${addZeroToLeft(date.day)}/${addZeroToLeft(date.month)}/${date.year}";
  }

  static String addZeroToLeft(int n) {
    return n < 10 ? "0$n" : "$n";
  }
}
