import 'dart:ui';
import 'package:auto_orientation/auto_orientation.dart';
import 'package:flutter/services.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/screens/videoScreen.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class DetailsScreen extends StatefulWidget {

  String name;
  String description;
  String releaseDate;
  String runtime;
  String bgimg;
  String posterimg;
  String production;
  String genre;
  String rating;
  String link;

  DetailsScreen({Key key,this.name, this.description, this.releaseDate, this.genre, this.runtime, this.bgimg, this.posterimg, this.production, this.rating, this.link}) : super(key: key);
  
  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {

  @override
  void initState() {
    AutoOrientation.portraitUpMode();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    var rate = double.parse(widget.rating);
    var time = int.parse(widget.runtime);


      final int hour = time ~/ 60;
      final int minutes = time % 60;
      var totaltime =  ('${hour.toString().padLeft(2, "0")}h ${minutes.toString().padLeft(2, "0")}m');


    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.black45,

      body: SingleChildScrollView(

          child: Column(
            children: <Widget>[

              Stack(
                children: [

                  Hero(
                    transitionOnUserGestures: true,
                    tag: widget.name+"bg",
                    child: ShaderMask(
                      shaderCallback: (rect) {
                        return LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [Colors.black, Colors.transparent],
                        ).createShader(Rect.fromLTRB(0, 0, rect.width, rect.height));
                      },
                      blendMode: BlendMode.dstIn,
                      child: CachedNetworkImage(
                        height: height/2,
                        width: width,
                        imageUrl: widget.bgimg,
                        fit: BoxFit.cover,
                        errorWidget: (context, url, error) =>
                            Icon(Icons.error),
                      ),
                    ),
                  ),





                  Hero(
                    transitionOnUserGestures: true,
                    
                    tag: widget.name+"poster",
                    child: Padding(
                      padding: const EdgeInsets.only(top: 220.0),
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          height: height / 3,
                          width: width / 2,
                          decoration:
                          BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(
                                15)),
                            child: CachedNetworkImage(
                              imageUrl: widget.posterimg,
                              fit: BoxFit.cover,
                              errorWidget: (context, url, error) =>
                                  Icon(Icons.error),

                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              Hero(
                transitionOnUserGestures: true,
                tag: widget.name+"name",
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Material(
                        type: MaterialType.transparency,
                        child: Text(widget.name, style: GoogleFonts
                            .poppins(
                            fontSize: 32,
                            fontWeight: FontWeight.w700,
                            color: Colors.white.withOpacity(0.7)
                        ), textAlign: TextAlign.center,),
                      ),

                  ),
                ),
              ),

              SmoothStarRating(
                  allowHalfRating: true,
                  starCount: 5,
                  rating: rate,
                  size: 20.0,
                  isReadOnly: true,
                  filledIconData: Icons.star,
                  halfFilledIconData: Icons.star_half,
                  color: Colors.amber,
                  borderColor: Colors.amberAccent,
                  spacing:0.0
              ),


              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [


                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(totaltime, style: GoogleFonts
                          .poppins(
                          fontSize: 18,
                          fontWeight: FontWeight.w200,
                          color: Colors.white.withOpacity(0.8)
                      ), textAlign: TextAlign.center,),
                    ),

                  ),

                  Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(widget.production, style: GoogleFonts
                            .poppins(
                            fontSize: 18,
                            fontWeight: FontWeight.w200,
                            color: Colors.white.withOpacity(0.8)
                        ), textAlign: TextAlign.center,),
                      ),

                    ),


                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(widget.releaseDate, style: GoogleFonts
                          .poppins(
                          fontSize: 18,
                          fontWeight: FontWeight.w200,
                          color: Colors.white.withOpacity(0.8)
                      ), textAlign: TextAlign.center,),
                    ),

                  ),



                ],
              ),


              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(widget.description, style: GoogleFonts
                        .poppins(
                        fontSize: 18,
                        fontWeight: FontWeight.w200,
                        color: Colors.white.withOpacity(0.8)
                    ), textAlign: TextAlign.center,),
                  ),

                ),
              ),



            ],
          )

      ),

      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(18.0),
        child: Padding(
          padding: EdgeInsets.only(bottom: 18.0),
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => VideoScreen(link: widget.link, name: widget.name, poster: widget.posterimg),
                ),
              );
            },
            style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.red)),
            child: Text('Watch'),
          ),
        ),
      ),

    );
  }
}
