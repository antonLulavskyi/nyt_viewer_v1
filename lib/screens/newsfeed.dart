//import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:nyt_viewer_v1/models/content.dart';
import 'package:nyt_viewer_v1/widgets/newsfeed_item.dart';
import '../helpers/networking.dart';

class Newsfeed extends StatefulWidget {
  const Newsfeed({Key? key}) : super(key: key);

  @override
  State<Newsfeed> createState() => _NewsfeedState();
}

class _NewsfeedState extends State<Newsfeed> {
  final networkHelper = Networking(
      'https://api.nytimes.com/svc/news/v3/content/all/all.json?api-key=hNe2fecAA8b1L6syRjmbkfrIRGTSwRDE#');
  late Future<Content> content;

  @override
  void initState() {
    content = networkHelper.getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: SizedBox(
        width: screenSize.width,
        height: screenSize.height,
        child: FutureBuilder<Content>(
          future: content,
          builder: (context, snapshot) {
              return (snapshot.hasData) ? ListView.builder(
                itemCount: snapshot.data!.results!.length,
                itemBuilder: (context, index) {
                  String imageDataPath = '';
                  int mediaIndex;

                  // If a server respond without an image - render a default one.
                  if (snapshot.data!.results![index].media != null) {
                    mediaIndex = 3;
                    imageDataPath =
                        snapshot.data!.results![index].media![mediaIndex].url!;
                  } else {
                    imageDataPath =
                        'https://upload.wikimedia.org/wikipedia/commons/thumb/a/ac/No_image_available.svg/1024px-No_image_available.svg.png';
                  }
                  return NewsfeedItem(
                    index: index,
                    imagePath: imageDataPath,
                    listOfResults: snapshot.data!.results!,
                  );
                },
              ) : const SizedBox(
              height: 40,
              width: 40,
              child: Center(
                child: CircularProgressIndicator(),
              ),
             );
          },
        ),
      ),
    );
  }
}
