import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news/model/newsResponse/NewsResponse.dart';
import 'package:news/model/sourcesResponse/SourceResponse.dart';
class ApiManger{
  static const String baseUrl = 'newsapi.org';
  static const String apiKey = 'f4f949f1fef6467ca03b05af4d492650';
  static Future<SourceResponse> getSources (String categoryId)async{
    var uri = Uri.https(baseUrl,'v2/top-headlines/sources',
    {
      "apiKey" : apiKey,
      "category":categoryId
    });
  var response =  await http.get(uri);
  var json = jsonDecode(response.body);
  var sourcesResponse = SourceResponse.fromJson(json);
  return sourcesResponse;
  }
 static Future<NewsResponse> getNews(String? sourceId) async{
    //newsapi.org/v2/everything
    // for searching ?q=bitcoin&apiKey=f4f949f1fef6467ca03b05af4d492650
    var url = Uri.https(baseUrl , '/v2/everything',
        {
          "apiKey":apiKey,
          "sources": sourceId
        });
    var response = await http.get(url);
    var json = jsonDecode(response.body);
    var newsResponse = NewsResponse.fromJson(json);
    return newsResponse;

  }
}