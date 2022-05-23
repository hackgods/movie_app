import 'package:auto_orientation/auto_orientation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/const/colors.dart';
import 'package:movie_app/logic/fetchMovies.dart';
import 'package:movie_app/models/movieModels.dart';
import 'package:movie_app/screens/backgroundListView.dart';
import 'package:movie_app/screens/movieCards.dart';
import 'package:shimmer/shimmer.dart';
import 'package:flutter/services.dart';
class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  void initState() {
    AutoOrientation.portraitUpMode();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.black45,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("MOVIES", style: GoogleFonts.poppins(fontSize: 38,
                      fontWeight: FontWeight.w700,
                      color: Colors.white.withOpacity(0.7)),),

            )
          ],
        ),
        leading: Icon(
          Icons.menu,
        ),
        actions: <Widget>[
          Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {},
                child: Icon(
                  Icons.search,
                  size: 26.0,
                ),
              )
          ),
        ],
      ),

      body: SingleChildScrollView(

          child: Column(
            children: <Widget>[
              SizedBox(
                height: height,
                width: width,// constrain height
                child: BackgroundListView(),
              ),

              Padding(padding: EdgeInsets.all(38.0),),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Shimmer.fromColors(
                    baseColor: Colors.white.withOpacity(0.95),
                    highlightColor: Colors.grey.withOpacity(0.55),
                    child: Text("Newly Added", style: GoogleFonts
                        .poppins(
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                        color: Colors.white.withOpacity(0.7)
                    ), textAlign: TextAlign.left,),
                  ),
                ),
              ),
              Row(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(

                        gradient: new LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            colors: [
                              Colors.black.withOpacity(1),
                              AppColors.lightDark,
                            ]
                        )
                    ),
                      width: width,
                        child: MovieCards(),
                    ),

                ],
              ),



              Padding(padding: EdgeInsets.all(18.0),),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Shimmer.fromColors(
                    baseColor: Colors.white.withOpacity(0.95),
                    highlightColor: Colors.grey.withOpacity(0.55),
                    child: Text("Action", style: GoogleFonts
                        .poppins(
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                        color: Colors.white.withOpacity(0.7)
                    ), textAlign: TextAlign.left,),
                  ),
                ),
              ),
              Row(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(

                        gradient: new LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            colors: [
                              Colors.black.withOpacity(1),
                              AppColors.lightDark,
                            ]
                        )
                    ),
                    width: width,
                    child: MovieCards(),
                  ),

                ],
              ),


              Padding(padding: EdgeInsets.all(18.0),),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Shimmer.fromColors(
                    baseColor: Colors.white.withOpacity(0.95),
                    highlightColor: Colors.grey.withOpacity(0.55),
                    child: Text("Animation", style: GoogleFonts
                        .poppins(
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                        color: Colors.white.withOpacity(0.7)
                    ), textAlign: TextAlign.left,),
                  ),
                ),
              ),
              Row(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(

                        gradient: new LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            colors: [
                              Colors.black.withOpacity(1),
                              AppColors.lightDark,
                            ]
                        )
                    ),
                    width: width,
                    child: MovieCards(),
                  ),

                ],
              ),


            ],
          )

      ),

    );
  }
}
