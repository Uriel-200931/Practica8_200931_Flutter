import 'dart:convert';

class Media {
  int id;
  double voteAverage;
  String title;
  String posterPath;
  String backdropPath;
  String overview;
  String releaseDta;
  List<dynamic> genreIds;
  factory Media(Map jsonMap) {
    return new Media.deserialize(jsonMap);
    try {
      return new Media.deserialize(jsonMap);
    } catch (ex) {
      throw ex;
    }
  }

  Media.deserialize(Map json)
      : id = json["id"].toInt(),
        voteAverage = json["Vote_average"].toDouble(),
        title = json["title"],
        posterPath = json["poster_Path"] ?? "",
        backdropPath = json["backdrop_Path"] ?? "",
        overview = json["overview"],
        releaseDta = json["release_Dta"],
        genreIds = json["genre_Ids"].toList();
}
