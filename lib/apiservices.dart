import 'dart:convert';
import 'package:http/http.dart' as http;
import 'catfact.dart';

Future<Catfact?> fetchCatFact() async {
  final url = Uri.parse('https://catfact.ninja/fact');
  try {
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return Catfact.fromJson(data);
    } else {
      return null;
    }
  } catch (e) {
    return null;
  }
}
