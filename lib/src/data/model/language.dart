enum Language {
  english("en"),
  arabic("ar");

  final String code;
  const Language(this.code);
  factory Language.fromString(String value) {
    if (value == "en") {
      return Language.english;
    }
    if (value == "ar") {
      return Language.arabic;
    }
    throw const FormatException("invalid language code");
  }
}
