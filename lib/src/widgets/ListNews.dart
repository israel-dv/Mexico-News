import 'package:flutter/material.dart';
import 'package:mexico_news/src/models/Notice.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:share/share.dart';

class ListNews extends StatelessWidget {
  final Size size;
  final List<Notice> news;

  ListNews({@required this.size, @required this.news});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height,
      width: size.width,
      child: ListView.builder(
          itemCount: news.length,
          itemBuilder: (BuildContext context, int index) {
            return _cardNew(context, size, news[index]);
          }),
    );
  }

  Widget _cardNew(BuildContext context, Size size, Notice notice) {
    final _card = Card(
      color: Colors.black38,
      child: Container(
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    notice.source['name'],
                    style: TextStyle(fontSize: 12),
                  ),
                  IconButton(
                      icon: Icon(
                        Icons.more_vert,
                        color: Colors.tealAccent
                      ),
                      onPressed: () => bottomSheet(context, notice))
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                  left: size.width * 0.05,
                  right: size.width * 0.05,
                  bottom: size.height * 0.02),
              child: Text(
                notice.title,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              height: size.height * 0.3,
              width: size.width,
              child: FadeInImage(
                placeholder: AssetImage('assets/images/news.png'),
                image: NetworkImage(notice.urlToImage),
                fit: BoxFit.fill,
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(
                  horizontal: size.width * 0.05, vertical: size.height * 0.03),
              child: Text(notice.description),
            ),
          ],
        ),
      ),
    );

    return GestureDetector(
      child: _card,
      onTap: () {
        print(notice.url);
        _launchUrl(notice.url);
      },
    );
  }

  bottomSheet(BuildContext context, Notice notice) {
    showModalBottomSheet(
        context: context,
        backgroundColor: Colors.black,
        builder: (BuildContext context) => Container(
              height: size.height * 0.2,
              width: size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ListTile(
                    title: Text(
                      'Compartir',
                      style: TextStyle(color: Colors.white),
                    ),
                    leading: Icon(Icons.share),
                    onTap: () { Share.share(notice.url); },
                  ),
                  ListTile(
                    title: Text(
                      'Cancelar',
                      style: TextStyle(color: Colors.white),
                    ),
                    leading: Icon(Icons.cancel),
                    onTap: () => Navigator.of(context).pop(),
                  ),
                ],
              ),
            ));
  }

  _launchUrl(String url) async {
    if(await canLaunch(url)) {
      await launch(url);
    }
    else {
      print('no se pudo');
      throw 'Could not launch $url';
    }
  }

}
