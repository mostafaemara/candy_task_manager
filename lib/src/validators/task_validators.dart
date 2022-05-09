import 'package:intl/intl.dart';
import 'task_errors.dart';

DateError dateValidator(String? value) {
  if (value == null) {
    return DateError.none;
  }
  if (value.isEmpty) {
    return DateError.empty;
  }
  try {
    DateFormat("yyyy-MM-dd HH:mm").parse(value);
  } catch (e) {
    return DateError.invalid;
  }
  return DateError.none;
}

FieldError fieldValidator(String? value) {
  if (value == null) {
    return FieldError.none;
  }
  if (value.isEmpty) {
    return FieldError.empty;
  }
  return FieldError.none;
}
