import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_card_swipper/flutter_card_swiper.dart';
import 'package:movie_app/logic/fetchMovies.dart';
import 'package:movie_app/models/movieModels.dart';
import 'package:movie_app/screens/detailsScreen.dart';

class MovieCards extends StatefulWidget {
  @override
  _MovieCardsState createState() => _MovieCardsState();
}

class _MovieCardsState extends State<MovieCards> {

  List<MovieModel> _movies;

  @override
  void initState() {
    super.initState();
    FetchMovies.getMovies().then((movies) {
      setState(() {
        _movies = movies;
        print("LOADED");
      });
    });
  }

  @override
  Widget build(BuildContext context) {
        return SizedBox(
          height: 250,
          child: ListView.builder(
            itemCount: null == _movies ? 0 : _movies.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              MovieModel movie = _movies[index];
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(

                        builder: (context) => DetailsScreen(name: movie.movieTitle, description: movie.description, releaseDate: movie.releaseDate, runtime: movie.runtime, bgimg: movie.backdropPath, posterimg: movie.posterPath, production: movie.productionCompanies, genre: movie.genre, rating: movie.voteAverage, link: movie.movieLink),
                      ),
                    );
                  },
                  child: Container(
                      decoration:
                      BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(
                            25)),
                        child: Card(
                          child: CachedNetworkImage(
                            height: 200,
                            width: 150,
                            imageUrl: movie.posterPath,
                            fit: BoxFit.cover,
                            errorWidget: (context, url, error) =>
                                Icon(Icons.error),
                          ),
                        ),
                      ),
                    ),

                ),
              );
            }
          ),
        );

  }
}
