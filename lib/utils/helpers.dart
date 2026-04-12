class Helpers {

  // Formater une date
  static String formatDate(DateTime date) {
    return "${date.day}/${date.month}/${date.year}";
  }

  // Calcul semaine grossesse
  static int calculatePregnancyWeeks(DateTime startDate) {
    final difference = DateTime.now().difference(startDate);
    return (difference.inDays / 7).floor();
  }

  // Calcul prochaine règle
  static DateTime calculateNextPeriod(DateTime startDate, int cycleLength) {
    return startDate.add(Duration(days: cycleLength));
  }

}