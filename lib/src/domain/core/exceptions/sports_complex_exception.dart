class SportsComplexException implements Exception {
  SportsComplexException(this._description);

  final String _description;

  String get description => _description;

  @override
  String toString() => '$runtimeType("$_description")';
}
