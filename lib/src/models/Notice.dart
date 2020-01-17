class Notice{

  String author;
  String title;
  String description;
  String url;
  String urlToImage;
  String content;
  Map<String, dynamic> source;

  Notice({
    this.title,
    this.author,
    this.description,
    this.url,
    this.urlToImage,
    this.content,
    this.source
  });

  factory Notice.fromJson(Map<String, dynamic> notice){
    return Notice(
      author      : notice['author'] ?? '',
      title       : notice['title'] ?? '',
      description : notice['description'] ?? '',
      url         : notice['url'] ?? '',
      urlToImage  : notice['urlToImage'] ?? '',
      content     : notice['content'] ?? '',
      source      : notice['source'] ?? ''
    );
  }

}

class News{

  List<Notice> items = List();

  News();

  News.formJsonList( List<dynamic> newsList){

    if ( newsList == null ) return;

    for(var item in newsList){

      final notice = Notice.fromJson(item);
      items.add(notice);
    }

  }

}