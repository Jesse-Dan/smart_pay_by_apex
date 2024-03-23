String getFirstNonNullItem(Map<String, dynamic> params) {
  final StringBuffer result = StringBuffer();

  params.forEach((key, value) {
    if ((value as List).isNotEmpty) {
      result.writeln(value[0]);
    }
  });

  return result.toString();
}
