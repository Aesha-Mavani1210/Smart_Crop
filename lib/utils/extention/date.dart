extension DeliveryDate on DateTime {
  static const List<String> _monthAbbrevitions = [
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'May',
    'Jun',
    'Jul',
    'Aug',
    'Sep',
    'Oct',
    'Nov',
    'Dec',
  ];
  String get formatDate {
    return "${_monthAbbrevitions[month - 1]} $day,$year";
  }
}