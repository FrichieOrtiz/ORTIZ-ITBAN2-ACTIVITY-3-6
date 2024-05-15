import 'dart:convert';
import 'dart:io';

Future<String> getRandomCatFact() async {
  HttpClient client = HttpClient();
  final uri = Uri.parse('https://catfact.ninja/fact');

  try {
    HttpClientRequest request = await client.getUrl(uri);
    HttpClientResponse response = await request.close();
    if (response.statusCode == 200) {
      String responseBody = await response.transform(utf8.decoder).join();
      final Map<String, dynamic> data = json.decode(responseBody);
      return data['fact'];
    } else {
      throw Exception('Failed to fetch cat fact: ${response.statusCode}');
    }
  } finally {
    client.close();
  }
}

void main() async {
  try {
    final catFact = await getRandomCatFact();
    print('Random Cat Fact: $catFact');
  } catch (e) {
    print('Error: $e');
  }
}
