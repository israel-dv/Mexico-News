import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mexico_news/src/models/Notice.dart';
import 'package:mexico_news/src/utils/Settings.dart';


class NewsProvider {

  String url      = 'newsapi.org';
  String country  = 'mx';

  List<Notice> _popular = List();

  final _popularStreamController = StreamController<List<Notice>>.broadcast();
  final _tabStreamController = StreamController<int>.broadcast();

  Function(List<Notice>) get popularSink => _popularStreamController.sink.add;
  Function(int) get tabSink => _tabStreamController.sink.add;

  Stream<List<Notice>> get popular => _popularStreamController.stream;
  Stream<int> get tab => _tabStreamController.stream;

  void disposeStream(){
    _popularStreamController?.close();
  }

  Future<List<Notice>> popularNews(int index) async {

    String category = index == 1 ? 'science' :
                      index == 2 ? 'sports' :
                      index == 3 ? 'entertainment' :
                      index == 4 ? 'business' :
                      index == 5 ? 'health' :
                      index == 6 ? 'technology' : '';

    final params = index == 0 ?
                  { 'country': country, 'apiKey' : Settings.apiKey} :
                  { 'country': country,  'apiKey' : Settings.apiKey,  'category' : category};

    final uri = Uri.https(url, '/v2/top-headlines', params);
    final response    = await http.get(uri);
    final decodeData  = json.decode(response.body);

    final news = News.formJsonList(decodeData['articles']);

    return news.items;

  }

}