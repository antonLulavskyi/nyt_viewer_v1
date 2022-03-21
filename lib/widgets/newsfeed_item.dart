// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:nyt_viewer_v1/models/content.dart';
import 'package:intl/intl.dart';

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
    String? title;
    String publicationDate;
    DateTime? formattedDate;
    var format = DateFormat.yMMMMEEEEd();
    var dateString;

    if (listOfResults != null) {
      title = listOfResults![index].title;
      
    }
    if (listOfResults![index].publishedDate != null) {
      publicationDate = listOfResults![index].publishedDate!;
      formattedDate = DateTime.parse(publicationDate);
      dateString = format.format(formattedDate);
      
      }
    return (title != '')
        ? SizedBox(
            height: screenSize.height * 0.2,
            child: Card(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    
                    width: screenSize.width * 0.3,
                    child: Image.network(imagePath),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          
                          height: screenSize.height * 0.09,
                          width: screenSize.width * 0.6,
                          child: Text(
                            '$title',
                            style: const TextStyle(fontSize: 20),
                          ),
                        ),
                        SizedBox(
                          width: screenSize.width * 0.6,
                          
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                
                                child: Text('$dateString'),
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.favorite_outline_rounded, color: Colors.red,),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        : const SizedBox();
  }
}
