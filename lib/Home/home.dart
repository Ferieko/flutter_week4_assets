import 'package:flutter/material.dart';

import 'Detil_Gambar.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Flutter Gallery'),
        ),

        /// 1. Using GridView.builder
        body: GridView.builder(
            padding: const EdgeInsets.all(20.0),

            itemCount: 100,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(

              crossAxisCount: 3,
              mainAxisSpacing: 18.0,
              crossAxisSpacing: 18.0,

            ),
            itemBuilder: (context, index) {
              //link untuk mengarahkah ke halaman Detil Gambar
              return InkWell(
                onTap: () {
                  /// Contoh Debug
                  debugPrint(
                      "LOG_onTAP https://picsum.photos/id/$index/300/300 "
                  );

                  /// Contoh Navigasi
                  //Navigator.of(context).push(CupertinoPageRoute(
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (_) =>
                          DetilGambar(
                            urlImage: "https://picsum.photos/id/$index/200/300",
                            size: '300 x 300 $index',

                            //urutan: '$index',
                          )
                  )
                  );
                },
                child: Image.network(
                  "https://picsum.photos/id/$index/300/300",
                  loadingBuilder: (context, widget, event) {
                    if (event == null) {
                      return widget;
                    } else {
                      return const SizedBox(
                        height: 1.0,
                        width: 1.0,
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                  errorBuilder: (context, object, error) {
                    return const Icon(Icons.error_outline_outlined);
                    //return const Icon(Icons.error);
                  },
                ),
              );
            }));
  }
}
