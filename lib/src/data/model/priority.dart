import 'package:flutter/material.dart';

enum Priority {
  high("high"),
  medium("medium"),
  low("low");

  final String value;
  const Priority(this.value);

  factory Priority.parse(String value) {
    switch (value) {
      case "high":
        return Priority.high;
      case "medium":
        return Priority.medium;
      case "low":
        return Priority.low;
      default:
        throw const FormatException("Invalid String value");
    }
  }

  Color toColor() {
    switch (this) {
      case Priority.high:
        return Colors.red;

      case Priority.medium:
        return Colors.green;
      case Priority.low:
        return Colors.grey;
    }
  }
}
