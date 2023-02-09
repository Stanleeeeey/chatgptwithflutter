import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:curl_generator/curl_generator.dart';

void Ask() async {
  const url = 'https://api.openai.com/v1/completions';
  const header = {
    'Authorization': "Bearer ",
    'Content-Type': 'application/json'
  };
  const body = {
    "model": "text-davinci-003",
    "prompt": "Say this is a test",
    "temperature": 0,
    "max_tokens": 7
  };

  var response = await http.post(
      Uri.parse('https://api.openai.com/v1/completions'),
      body: jsonEncode(body),
      headers: header);

  print(response);
}
