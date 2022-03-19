
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:nyt_viewer_v1/models/content.dart';


class Networking {

  final String url;

  Networking(this.url);

  Future<Content> getData() async {
    var passedUrl = Uri.parse(url);
    http.Response response = await http.get(passedUrl);
    
    if (response.statusCode == 200) {
      print('Working');
      return Content.fromJson(jsonDecode(response.body));
    } else {
      print('Not working');
      throw Exception('Failed to load data');
    }
  }
  

}