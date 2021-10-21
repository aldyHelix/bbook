import 'package:flutter/material.dart';
import '../models/ImageModel.dart';

class ImageList extends StatelessWidget {
  final List<ImageModel> _images;

  ImageList(this._images);

  Widget _renderImages() {
    if (_images.length == 0) return Text('No Images!');
    return ListView.builder(
        itemCount: _images.length,
        itemBuilder: (BuildContext context, int index) {
          return Text(_images[index].name);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: _renderImages(),
      ),
    );
  }
}
