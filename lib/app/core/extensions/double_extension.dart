extension DoubleExtension on double {
  String toCurrency() => '\$${toStringAsFixed(2)}';
}
