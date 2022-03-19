//import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:nyt_viewer_v1/models/content.dart';
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

// Remove const todo:
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: FutureBuilder<Content>(
          future: content,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return SizedBox(
                height: MediaQuery.of(context).size.height,
                child: ListView.builder(
                    itemCount: snapshot.data!.results!.length,
                    itemBuilder: (context, index) {
                      
                      var imageDataPath = snapshot.data!.results![index].media![1].url!;
                      String imagePath;

                      if (imageDataPath != null) {
                        imagePath = imageDataPath;
                      } else {
                        imagePath = "https://static01.nyt.com/images/2022/03/16/arts/16metopera2/16metopera2-thumbStandard.jpg";
                      }
                      return SizedBox(
                        height: MediaQuery.of(context).size.height * 0.3,
                        child: Card(
                          child: ListTile(
                            title:
                                Text('${snapshot.data!.results![index].title}'),
                            subtitle: Text(
                                '${snapshot.data!.results![index].bodyText}'),
                            leading: SizedBox(
                              width: 70,
                              child: Image.network(imagePath),
                            ),
                          ),
                        ),
                      );
                    }),
              );
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
