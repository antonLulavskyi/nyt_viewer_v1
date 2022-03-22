// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:nyt_viewer_v1/models/content.dart';
import 'package:intl/intl.dart';

class NewsfeedItem extends StatefulWidget {
  final Content data;
  final int index;
  final String imagePath;
  const NewsfeedItem(
      {Key? key,
      required this.data,
      required this.index,
      required this.imagePath})
      : super(key: key);

  @override
  State<NewsfeedItem> createState() => _NewsfeedItemState();
}

class _NewsfeedItemState extends State<NewsfeedItem> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final String title = widget.data.results![widget.index].title!;
    final String date = widget.data.results![widget.index].publishedDate!;
    bool isFavorite = widget.data.results![widget.index].isFavorite;

    DateTime? formattedDate;
    var format = DateFormat.yMMMMEEEEd();
    var dateString;
    formattedDate = DateTime.parse(date);
    dateString = format.format(formattedDate);

    return (title != '')
        ? SizedBox(
            height: screenSize.height * 0.2,
            child: Card(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: screenSize.width * 0.3,
                    child: Image.network(widget.imagePath),
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
                            title,
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
                                onPressed: () {
                                  setState(() {
                                    if (isFavorite == false) {
                                      widget.data.results![widget.index]
                                          .isFavorite = true;
                                    } else {
                                      widget.data.results![widget.index]
                                          .isFavorite = false;
                                    }
                                  });
                                },
                                icon: (widget
                                        .data.results![widget.index].isFavorite)
                                    ? const Icon(
                                        Icons.favorite,
                                        color: Colors.red,
                                      )
                                    : const Icon(
                                        Icons.favorite_outline_rounded,
                                        color: Colors.red,
                                      ),
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
