import 'package:flutter/material.dart';

class DetilGambar extends StatelessWidget {
  final String urlImage;
  final String size;
  //String detilUrl=("");
  // final String urutan;
  const DetilGambar({Key? key, required this.urlImage, required this.size})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Gambar'),
      ),
      body: Center(
        child: Column(
          children: [
            Image.network(urlImage, fit: BoxFit.cover, width: 320, height: 320),
            Text('300X300'),
            Text('sumber gambar'),
            Text(urlImage),
          ],
        ),
      ),
    );
  }
}