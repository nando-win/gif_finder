import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _search;

  String trendingsUrl =
      'https://api.giphy.com/v1/gifs/trending?api_key=WTiUHKO5XWmka034QGQslXW4cDPEuGJz&limit=25&rating=g';

  _getGifs() async {
    http.Response response;

    if (_search == null) response = await http.get(trendingsUrl);
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
