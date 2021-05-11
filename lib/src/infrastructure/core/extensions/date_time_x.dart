extension DateTimeX on DateTime {
  String get asFormattedString =>
      '${day < 10 ? '0$day' : '$day'}.${month < 10 ? '0$month' : '$month'}.$year';

  Map<String, dynamic> onlyDateToJson() => <String, dynamic>{
        'day': day,
        'month': month,
        'year': year,
      };

  Map<String, dynamic> dateAndTimeToJson() => <String, dynamic>{
        'minute': minute,
        'hour': hour,
        'day': day,
        'month': month,
        'year': year,
      };
}
