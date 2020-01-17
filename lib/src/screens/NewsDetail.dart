import 'package:flutter/material.dart';
import 'package:mexico_news/src/models/Notice.dart';

class NewsDetail extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final Notice _notice = ModalRoute.of(context).settings.arguments;
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          _appBar(_notice, size),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                _description(_notice),
              ]
            ),
          ),
        ],
      ),
    );
  }

  Widget _appBar(Notice notice, Size size){

    return SliverAppBar(
      elevation: 0.0,
      expandedHeight: size.height * 0.3,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: Text('México News'),
        background: FadeInImage(
          placeholder: AssetImage('assets/images/news.png'), 
          image: NetworkImage(notice.urlToImage),
          fit: BoxFit.fill,
        ),
      ),
    );

  }

  Widget _description(Notice notice){

    return Container(
      child: Text(notice.content),
    );

  }

}
