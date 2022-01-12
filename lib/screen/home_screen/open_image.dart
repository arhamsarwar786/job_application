import 'package:flutter/material.dart';

class OpenImage extends StatelessWidget {
  final imageUrl;
  OpenImage(this.imageUrl);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.blue[900],),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Image.network(imageUrl),
      ),
    );
  }
}