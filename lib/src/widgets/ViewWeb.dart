import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:mexico_news/src/models/Notice.dart';

class ViewWeb extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    final Notice notice = ModalRoute.of(context).settings.arguments;

    print(notice.author);

    return WebviewScaffold(
      url: notice.url,
      withZoom: true,
      appBar: AppBar(
        title: Text(notice.author  == '' || notice.author == null ? '...' : notice.author, style: TextStyle(color: Colors.white)),
      ),
      initialChild: Container(
        height: size.height,
        width: size.width,
        child: Center(
          child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation(Colors.tealAccent)),
        ),
      ),
    );

  }
}