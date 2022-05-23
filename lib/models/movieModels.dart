// To parse this JSON data, do
//
//     final movieModel = movieModelFromJson(jsonString);

import 'dart:convert';

List<MovieModel> movieModelFromJson(String str) => List<MovieModel>.from(json.decode(str).map((x) => MovieModel.fromJson(x)));

String movieModelToJson(List<MovieModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MovieModel {
  MovieModel({
    this.the0,
    this.the1,
    this.the2,
    this.the3,
    this.the4,
    this.the5,
    this.the6,
    this.the7,
    this.the8,
    this.the9,
    this.the10,
    this.the11,
    this.id,
    this.movieId,
    this.movieTitle,
    this.description,
    this.genre,
    this.releaseDate,
    this.runtime,
    this.voteAverage,
    this.productionCompanies,
    this.backdropPath,
    this.posterPath,
    this.movieLink,
  });

  String the0;
  String the1;
  String the2;
  String the3;
  String the4;
  String the5;
  String the6;
  String the7;
  String the8;
  String the9;
  String the10;
  String the11;
  String id;
  String movieId;
  String movieTitle;
  String description;
  String genre;
  String releaseDate;
  String runtime;
  String voteAverage;
  String productionCompanies;
  String backdropPath;
  String posterPath;
  String movieLink;

  factory MovieModel.fromJson(Map<String, dynamic> json) => MovieModel(
    the0: json["0"],
    the1: json["1"],
    the2: json["2"],
    the3: json["3"],
    the4: json["4"],
    the5: json["5"],
    the6: json["6"],
    the7: json["7"],
    the8: json["8"],
    the9: json["9"],
    the10: json["10"],
    the11: json["11"],
    id: json["id"],
    movieId: json["movie_id"],
    movieTitle: json["movie_title"],
    description: json["description"],
    genre: json["genre"],
    releaseDate: json["release_date"],
    runtime: json["runtime"],
    voteAverage: json["vote_average"],
    productionCompanies: json["production_companies"],
    backdropPath: json["backdrop_path"],
    posterPath: json["poster_path"],
    movieLink: json["movie_link"],
  );

  Map<String, dynamic> toJson() => {
    "0": the0,
    "1": the1,
    "2": the2,
    "3": the3,
    "4": the4,
    "5": the5,
    "6": the6,
    "7": the7,
    "8": the8,
    "9": the9,
    "10": the10,
    "11": the11,
    "id": id,
    "movie_id": movieId,
    "movie_title": movieTitle,
    "description": description,
    "genre": genre,
    "release_date": releaseDate,
    "runtime": runtime,
    "vote_average": voteAverage,
    "production_companies": productionCompanies,
    "backdrop_path": backdropPath,
    "poster_path": posterPath,
    "movie_link": movieLink,
  };
}
