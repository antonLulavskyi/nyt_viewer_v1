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
            final listOfResults = snapshot.data!.results!;
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: listOfResults.length,
                itemBuilder: (context, index) {
                  var imageDataPath = listOfResults[index].media![2].url!;
                  return NewsfeedItem(
                    index: index,
                    imagePath: imageDataPath,
                    listOfResults: listOfResults,
                  );
                },
              );
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }
            return const SizedBox(
              height: 40,
              width: 40,
              child: Center(
                child: LinearProgressIndicator(),
              ),
            );
          },
        ),
      ),
    );
  }
}
