import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:lifecycle_example/src/source.dart';

class InfiniteListState {
  InfiniteListState(this.state);

  LifecycleState state;
  bool _hasMore = true;
  int _pageNumber = 0;
  bool _error = false;
  bool _loading = true;
  final int _defaultPhotosPerPageCount = 10;
  final List<dynamic> _photos = [];
  final int _nextPageThreshold = 5;

  void initState() => getPhotos();

  Widget body() {
    if (_photos.isEmpty) {
      if (_loading) {
        return const Center(
            child: Padding(
          padding: EdgeInsets.all(8),
          child: CircularProgressIndicator(),
        ));
      } else if (_error) {
        return Center(
            child: InkWell(
          onTap: () {
            state.setState(() {
              _loading = true;
              _error = false;
              getPhotos();
            });
          },
          child: const Padding(
            padding: EdgeInsets.all(16),
            child: Text('Error while loading photos, tap to try agin'),
          ),
        ));
      }
    } else {
      return ListView.builder(
          itemCount: _photos.length + (_hasMore ? 1 : 0),
          itemBuilder: (context, index) {
            if (index == _photos.length - _nextPageThreshold) {
              getPhotos();
            }
            if (index == _photos.length) {
              if (_error) {
                return Center(
                    child: InkWell(
                  onTap: () {
                    state.setState(() {
                      _loading = true;
                      _error = false;
                      getPhotos();
                    });
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(16),
                    child: Text('Error while loading photos, tap to try again'),
                  ),
                ));
              } else {
                return const Center(
                    child: Padding(
                  padding: EdgeInsets.all(8),
                  child: CircularProgressIndicator(),
                ));
              }
            }
            final String photo = _photos[index];
            return LifeCycleWidget(
              child: Card(
                child: Column(
                  children: <Widget>[
                    Image.network(
                      photo,
                      fit: BoxFit.fitWidth,
                      width: double.infinity,
                      height: 160,
                    ),
                  ],
                ),
              ),
            );
          });
    }
    return Container();
  }

  Future<void> getPhotos() async {
    try {
      final response = await http.get(
          'https://jsonplaceholder.typicode.com/photos?_page=$_pageNumber');

//      final List<dynamic> photos = json.decode(response.body).map(fromJson).toList();
      final List<dynamic> photos =
          json.decode(response.body).map((dynamic i) {
        return i['url'];
      }).toList();

      state.setState(() {
        _hasMore = photos.length == _defaultPhotosPerPageCount;
        _loading = false;
        _pageNumber = _pageNumber + 1;
        _photos.addAll(photos);
      });
    } catch (e) {
      state.setState(() {
        _loading = false;
        _error = true;
      });
    }
  }

  String fromJson(dynamic json) => Map<String, dynamic>.from(json)['url'];
}
