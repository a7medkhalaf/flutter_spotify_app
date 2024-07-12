extension ToCamelCase on String {
  String toCamelCase() {
    return split(RegExp(r'_|-'))
        .map((String word) => word[0].toUpperCase() + word.substring(1))
        .join(' ');
  }
}
