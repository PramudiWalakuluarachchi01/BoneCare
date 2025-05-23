import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PostImageViewScreen extends StatelessWidget {
  final List<String> imageList;
  const PostImageViewScreen({
    super.key,
    required this.imageList,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(60, 0, 0, 0),
          centerTitle: true,
          iconTheme: const IconThemeData(color: Color.fromARGB(255, 255, 255, 255)),
          title: const Text(
            'Images',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 255, 255, 255),
            ),
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: imageList.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.symmetric(vertical: 5),
                    child: Image.network(
                      imageList[index],
                      loadingBuilder: (BuildContext context, Widget child,
                          ImageChunkEvent? loadingProgress) {
                        if (loadingProgress == null) {
                          return child; // Image is fully loaded, return the image widget
                        } else {
                          return Container(
                            width: double.infinity,
                            height: 150,
                            color: Colors.black,
                            child: const Center(
                              child: CupertinoActivityIndicator(
                                color: Colors.black,
                              ),
                            ),
                          );
                        }
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
