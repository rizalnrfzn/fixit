import 'package:intl/intl.dart';

String toKiloMeter(double distance) {
  final km = (distance / 1000).toStringAsFixed(2);

  return km.replaceAll('.', ',');
}

String toMinute(double duration) {
  final minute = (duration / 60).ceil().toStringAsFixed(0);

  return minute;
}

String toDateTime(DateTime date) {
  return DateFormat('hh:mm\ndd-MM-yyyy').format(date.toLocal()).toString();
}

String toThousand(int number) {
  // Format the number with thousand separators
  final format = NumberFormat.decimalPattern(
      'id'); // 'id' untuk menggunakan tanda koma sebagai pemisah ribuan
  return format.format(number);
}
