import 'package:flutter/material.dart';

class MyGallery extends StatefulWidget {
  @override
  _MyGalleryState createState() => _MyGalleryState();
}

class _MyGalleryState extends State<MyGallery> {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 3,
      children: List.generate(
          30,
          (index) =>
              Image.network('https://picsum.photos/id/$index/150/150.jpg')),
    );
  }
}
