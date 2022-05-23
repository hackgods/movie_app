import 'dart:ui';
import 'package:animate_do/animate_do.dart';
import 'package:flutter_card_swipper/flutter_card_swiper.dart';
import 'package:http/http.dart' as http;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/logic/fetchMovies.dart';
import 'package:movie_app/models/movieModels.dart';
import 'package:shimmer/shimmer.dart';

import 'detailsScreen.dart';

class BackgroundListView extends StatefulWidget {
  @override
  _BackgroundListViewState createState() => _BackgroundListViewState();
}

class _BackgroundListViewState extends State<BackgroundListView> {

  List<MovieModel> _movies;
  bool _loading = true;
  bool _error = false;

  @override
  void initState() {
    super.initState();
    FetchMovies.getMovies().then((movies) {
      setState(() {
        _movies = movies;
        print("LOADED");
        _loading = false;
      });
    });
  }


  @override
  Widget build(BuildContext context) {
    double width = MediaQuery
        .of(context)
        .size
        .width;
    double height = MediaQuery
        .of(context)
        .size
        .height;


    return _loading ? CircularProgressIndicator()
        : _error ? CircularProgressIndicator()
        : Swiper(
        control: new SwiperControl(
            size: 0
        ),
        itemCount: null == _movies ? 0 : _movies.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          MovieModel movie = _movies[index];
          return Stack(
              children: [
                Hero(
                  transitionOnUserGestures: true,
                  tag: movie.movieTitle+"bg",
                  child: CachedNetworkImage(
                    height: height,
                    width: width,
                    imageUrl: movie.backdropPath,
                    fit: BoxFit.cover,
                    errorWidget: (context, url, error) =>
                        Icon(Icons.error),
                  ),
                ),
                ClipRRect(
                  child: FadeIn(
                    duration: Duration(milliseconds: 700),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                      child: Container(
                        decoration: BoxDecoration(
                          //color: Colors.lightGreen
                            gradient: new LinearGradient(
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                                colors: [
                                  Colors.black.withOpacity(1),
                                  Colors.transparent,
                                ]
                            )
                        ),
                        alignment: Alignment.center,
                      ),
                    ),
                  ),
                ),


                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(

                        builder: (context) => DetailsScreen(name: movie.movieTitle, description: movie.description, releaseDate: movie.releaseDate, runtime: movie.runtime, bgimg: movie.backdropPath, posterimg: movie.posterPath, production: movie.productionCompanies, genre: movie.genre, rating: movie.voteAverage, link: movie.movieLink),
                      ),
                    );
                  },
                  child: Hero(
                    transitionOnUserGestures: true,
                    tag: movie.movieTitle+"poster",
                    child: Align(
                      alignment: Alignment.center,
                      child: Container(
                        height: height / 2,
                        width: width / 1.5,
                        decoration:
                        BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(
                              15)),
                          child: CachedNetworkImage(
                            imageUrl: movie.posterPath,
                            fit: BoxFit.cover,
                            errorWidget: (context, url, error) =>
                                Icon(Icons.error),

                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                Hero(
                  transitionOnUserGestures: true,
                  tag: movie.movieTitle+"name",
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 70.0),
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Material(
                          type: MaterialType.transparency,
                          child: Shimmer.fromColors(
                            baseColor: Colors.white.withOpacity(0.75),
                            highlightColor: Colors.grey.withOpacity(0.55),
                            child: Text(movie.movieTitle, style: GoogleFonts
                                .poppins(
                                fontSize: 32,
                                fontWeight: FontWeight.w700,
                                color: Colors.white.withOpacity(0.7)
                            ), textAlign: TextAlign.center,),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(26.0),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(movie.genre, style: GoogleFonts
                          .poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w200,
                          color: Colors.white.withOpacity(0.8)
                      ), textAlign: TextAlign.center,),
                    ),

                  ),
                ),


              ]
          );
        }
    );
  }
}