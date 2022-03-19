
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
    //print(results);
  }

}

class Result {
  String? section;
  String? subsection;
  String? title;
  String? bodyText;
  String? publishedDate;
  List<Media>? media;

  Result({this.section, this.subsection, this.title, this.bodyText, this.publishedDate, this.media});

  Result.fromJson(Map<String, dynamic> json) {
    section = json['section'];
    subsection = json['subsection'];
    title = json['title'];
    bodyText = json['abstract'];
    publishedDate = json['published_date'];
    var listOfMedia = json['multimedia'];
    if (listOfMedia != null) {
      media = [];
      for (var mediaElement in listOfMedia) {
       media!.add(Media.fromJson(mediaElement));
      }
    }
  }
}

class Media {
  String? url;
  String? caption;

  Media({this.url, this.caption});
  Media.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    caption = json['caption'];
  }
}
