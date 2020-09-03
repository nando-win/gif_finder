import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _search;
  int _offSet = 0;

  String trendingsUrl =
      'https://api.giphy.com/v1/gifs/trending?api_key=WTiUHKO5XWmka034QGQslXW4cDPEuGJz&limit=25&rating=g';

  Future<Map> _getGifs() async {
    http.Response response;

    if (_search == null)
      response = await http.get(trendingsUrl);
    else
      response = await http.get(
          'https://api.giphy.com/v1/gifs/search?api_key=WTiUHKO5XWmka034QGQslXW4cDPEuGJz&q=$_search&limit=25&offset=$_offSet&rating=g&lang=en');

    return json.decode(response.body);
  }

  @override
  void initState() {
    super.initState();

    _getGifs().then((map) => print(map));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Image.network(
            'https://developers.giphy.com/static/img/dev-logo-lg.7404c00322a8.gif'),
        centerTitle: true,
      ),
      backgroundColor: Colors.black,
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(10.0),
            child: TextField(
              decoration: InputDecoration(
                labelText: "Pesquise aqui!",
                labelStyle: TextStyle(color: Colors.white),
                border: OutlineInputBorder(),
              ),
              style: TextStyle(color: Colors.white, fontSize: 18.0),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
