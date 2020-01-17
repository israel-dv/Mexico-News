import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mexico_news/src/models/Notice.dart';
import 'package:mexico_news/src/provider/NewsProvider.dart';
import 'package:mexico_news/src/widgets/ListNews.dart';

class Home extends StatefulWidget {

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin{

  final _newsProvider = NewsProvider();
  TabController _tabController;
  int index;
  @override
  void initState() {
    _tabController = TabController(length: 7, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return //DefaultTabController(
      //length: 7,
       Scaffold(
        appBar: AppBar(
          title: Text('IMDev News'),
          bottom: TabBar(
            onTap: (index){
              setState(() {});
              _newsProvider.tabSink(index);
            },
            isScrollable: true,
            controller: _tabController,
            tabs: [
              Tab(text: 'Top'),
              Tab(text: 'Ciencia'),
              Tab(text: 'Deportes'),
              Tab(text: 'Entretenimiento'),
              Tab(text: 'Negocios'),
              Tab(text: 'Salud'),
              Tab(text: 'Tecnología')
            ],
          ),
        ),
        body: Container(
          height: size.height,
          width: size.width,
          padding: EdgeInsets.symmetric(horizontal: 5),
          child: _cardSwiper(size),
        ),
      //),
    );

  }

  Widget _cardSwiper(Size size){

    return StreamBuilder<int>(
      stream: _newsProvider.tab,
      builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
        return FutureBuilder(
            future: _newsProvider.popularNews(snapshot.data),
            builder: (BuildContext context, AsyncSnapshot<List<Notice>> snapshot){
              return snapshot.hasData ? ListNews(size: size, news: snapshot.data,)
                  : Center(child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),),);

            }
        );
      }
    );

  }
}
