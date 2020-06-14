import 'dart:async';

import 'package:flutter/material.dart';

class ListPage extends StatefulWidget {
  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  ScrollController  _scrollController = new ScrollController();

  List<int> _numbers = new List();
  int _lastNumber = 0;
  int _imagesPerRequest = 10;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();

    _addImages(_imagesPerRequest);
    _scrollController.addListener(() {
      if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent ) {
        // _addImages(_imagesPerRequest);
        fetchData();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lists'),
      ),
      body: Stack(
        children: <Widget>[
          _createList(context),
          _createLoading(),
        ],
      ) 
    );
  }

  Widget _createList(BuildContext context) {
    return RefreshIndicator(
      onRefresh: _getPage,

      child: ListView.builder(
        controller: ScrollController(),
        itemCount: _numbers.length,
        itemBuilder: (BuildContext context, int i) {
          final image = _numbers[i];

          return FadeInImage(
            image: NetworkImage('https://picsum.photos/500/300/?image=$image'),
            placeholder: AssetImage('assets/jar-loading.gif'),
          );
        },
      ),
    );
  }

  void _addImages(int quantity) {
    for (var i = 0; i < quantity; i++) {
      _lastNumber++;
      _numbers.add(_lastNumber);
    }
    setState(() {});
  }

  Future<Null> fetchData() async {
    _isLoading = true;
    setState(() {});

    final duration = Duration(seconds: 2);
    return new Timer( duration, responseHTTP);
  }

  void responseHTTP() {
    _isLoading = false;

    _scrollController.animateTo(
      _scrollController.position.pixels + 100,
      duration: Duration( milliseconds: 250),
      curve: Curves.fastOutSlowIn
    );

    _addImages(_imagesPerRequest);
  }

  Widget _createLoading() {
    if ( _isLoading ) {
      return Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
             CircularProgressIndicator(),
             SizedBox(
              height: 15.0,
             )
            ],
          )
        ],
      );
    }
    return Container();
  }

  Future<void> _getPage() async {
    final duration = new Duration( seconds: 2 );
    new Timer(duration, () {
      _numbers.clear();
      _lastNumber++;
      _addImages(_imagesPerRequest);
      setState(() {});
    });

    return Future.delayed(duration)
  }
}