
class Content {
  int? numberOfResult;
  List<Result>? results;
  

  Content({this.numberOfResult, this.results});

  Content.fromJson(Map<String, dynamic> json) {
    numberOfResult = json['num_results'];
    var listOfJSON = json['results'];
    if (listOfJSON != null) {
      results = [];
      for (var result in listOfJSON) {
        results!.add(Result.fromJson(result));
      }
    }
  }

}

class Result {
  String? section;
  String? subsection;
  String? title;
  String? bodyText;
  String? publishedDate;
  List<Media>? media;
  bool isFavorite = false;

  Result({this.section, this.subsection, this.title, this.bodyText, this.publishedDate, this.media});

  Result.fromJson(Map<String, dynamic> json) {
    section = json['section'];
    subsection = json['subsection'];
    if (json['title'] != null) {
      title = json['title'];
    }
    if (json['abstract'] != null) {
      bodyText = json['abstract'];
    }
    
    publishedDate = json['published_date'];
    var listOfMedia = json['multimedia'];
    if (listOfMedia != null) {
      media = [];
      for (var mediaElement in listOfMedia) {
       media!.add(Media.fromJson(mediaElement));
      }
    }
    //print('List of Media - ${media!.length}');
  }
}

class Media {
  String? url;
  String? caption;

  Media({this.url, this.caption});
  Media.fromJson(Map<String, dynamic> json) {
    if (json['url'] != null) {
      url = json['url'];
    }
    if (json['caption'] != null) {
      caption = json['caption'];
    }
    
  }
}
