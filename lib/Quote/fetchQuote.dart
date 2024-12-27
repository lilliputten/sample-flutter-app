import 'dart:convert';
import 'package:http/http.dart' as http;

import 'Quote.dart';

Future<Quote> fetchQuote() async {
  // print(apis.googleApiKey);
  final response = await http.get(Uri.parse('https://api.quotable.io/random'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    var decoded = jsonDecode(response.body) as Map<String, dynamic>;
    var quote = Quote.fromJson(decoded);
    return quote;
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load quote');
  }
}
