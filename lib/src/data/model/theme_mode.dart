enum ThemeMode {
  dark("dark"),
  light("light");

  final String value;

  const ThemeMode(this.value);

  factory ThemeMode.fromString(String value) {
    if (value == "dark") {
      return ThemeMode.dark;
    }
    if (value == "light") {
      return ThemeMode.light;
    }
    throw const FormatException("invalid Theme Mode Value");
  }
}
