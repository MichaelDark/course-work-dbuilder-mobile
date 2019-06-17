class DateFormat {
  String formatDate(DateTime date) {
    String day = date.day.toString();
    if (day.length == 1) {
      day = '0$day';
    }
    String month = date.month.toString();
    if (month.length == 1) {
      month = '0$month';
    }
    return '${date.year}-$month-$day';
  }
}
