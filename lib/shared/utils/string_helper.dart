/// format map to query string
String getQueryStringFromMap(Map<String, dynamic> map) {
  String a = '';
  int i = 0;
  map.forEach((key, value) {
    if ((value is int && value != 0) || (value is String && value.isNotEmpty) || (value is List && value.isNotEmpty)) {
      if (i == 0) {
        a += '?$key=$value';
      } else {
        a += '&$key=$value';
      }
      i++;
    }
  });
  return a;
}

/// adding hash sign in number
String nationalDexNumber(int i) {
  if (i < 10) {
    return '#00$i';
  } else if (i < 100) {
    return '#0$i';
  } else {
    return '#$i';
  }
}
