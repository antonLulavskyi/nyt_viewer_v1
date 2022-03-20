import 'package:flutter/material.dart';
import 'package:nyt_viewer_v1/models/content.dart';

class NewsfeedItem extends StatelessWidget {
  final List<Result>? listOfResults;
  final int index;
  final String imagePath;
  const NewsfeedItem(
      {Key? key,
      this.listOfResults,
      required this.index,
      required this.imagePath})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final title = listOfResults![index].title;
    //final bodyText = listOfResults![index].bodyText;
    return (title != '') ? SizedBox(
      height: screenSize.height * 0.2,
      child: Card(
        child: Row(
          children: [
            Container(
              margin: const EdgeInsets.only(left: 16),
              width: screenSize.width * 0.3,
              child: Image.network(imagePath),
            ),
            Column(
              children: [
                Container(
                  color: Colors.red,
                  height: screenSize.height * 0.09,
                  width: screenSize.width * 0.6,
                  child: Text('${listOfResults![index].title}', style: TextStyle(fontSize: 20),)),
              ],
            )
          ],
        ),
      ),
    ) : const SizedBox();
  }
}

