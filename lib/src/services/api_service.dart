import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news_page/src/models/article_model.dart';

//HsG9HDXy3GOz2tnjMZt9593CL1R3O3rq
//https://api.nytimes.com/svc/topstories/v2/arts.json?api-key=HsG9HDXy3GOz2tnjMZt9593CL1R3O3rq

final _baseUrl = 'https://api.nytimes.com';
final _apiKey = 'HsG9HDXy3GOz2tnjMZt9593CL1R3O3rq';

class NewsService {
  fetchArticlesBySection(String section) async {
    final url = '$_baseUrl/svc/topstories/v2/$section.json?api-key=$_apiKey';
    try {
      final resp = await http.get(url);
      final newsResponse = newsModelFromJson(resp.body);
      List<Result> articles = [];
      articles.addAll(newsResponse.results);
      return articles;
    } catch (err) {
      throw err.toString();
    }
  }
}
