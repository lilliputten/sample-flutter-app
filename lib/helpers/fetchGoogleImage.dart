import 'dart:convert';
import 'package:http/http.dart' as http;

import '../constants/apis.dart' as apis;

Future<String> fetchGoogleImage(String search) async {
  final urlString = apis.googleImageUrlTemplate
      .replaceAll('{apiKey}', apis.googleApiKey)
      .replaceAll('{cseId}', apis.googleCseId)
      .replaceAll('{search}', search);
  final urlObject = Uri.parse(urlString);
  final response = await http.get(urlObject);

  if (response.statusCode == 200) {
    final decoded = jsonDecode(response.body) as Map<String, dynamic>;
    final items = decoded['items'] as List;
    final item = items[0];
    final link = item['link'].toString();
    print('Found image: $link');
    return link;
  } else {
    throw Exception('Failed to loa image');
  }
}
