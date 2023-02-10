import 'dart:convert';
import 'dart:convert' as convert;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:curl_generator/curl_generator.dart';

Future<String> Ask(String question) async {
  const url = 'https://api.openai.com/v1/completions';
  var header = {'Authorization': 'Bearer ', 'Content-Type': 'application/json'};
  var body = {
    "model": "text-davinci-003",
    "prompt": question,
    "temperature": 0,
    "max_tokens": 7
  };

  var response = await http.post(
      Uri.parse('https://api.openai.com/v1/completions'),
      body: jsonEncode(body),
      headers: header);

  var jsonResponse = convert.jsonDecode(response.body) as Map<String, dynamic>;

  return jsonResponse['choices'][0]['text'];
}
