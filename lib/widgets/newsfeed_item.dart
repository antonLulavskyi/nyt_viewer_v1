import 'package:flutter/material.dart';
import 'package:nyt_viewer_v1/models/content.dart';

class NewsfeedItem extends StatelessWidget {
  final List<Result>? listOfResults;
  final int index;
  final String imagePath;
  const NewsfeedItem({Key? key, this.listOfResults, required this.index, required this.imagePath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return SizedBox(
      height: screenSize.height * 0.3,
      child: Card(
        child: ListTile(
          title: Text('${listOfResults![index].title}'),
          subtitle: Text('${listOfResults![index].bodyText}'),
          leading: SizedBox(
            width: 70,
            child: Image.network(imagePath),
          ),
        ),
      ),
    );
  }
}
