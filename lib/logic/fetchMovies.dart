import 'package:http/http.dart' as http;
import 'package:movie_app/models/movieModels.dart';


class FetchMovies {

  static Future <List<MovieModel>> getMovies() async {
    Map<String, String> headers = {
      'Content-Type': 'application/json;charset=UTF-8',
      'Charset': 'utf-8'
    };

    try{
      final response = await http.get(Uri.http('192.168.1.108','/movies/getmovies.php'), headers: headers);
      if(200 == response.statusCode){
        final List<MovieModel> movies = movieModelFromJson(response.body);
        return movies;

      } else{
        print("Not able to load");
        print(response.body);
        // ignore: deprecated_member_use
        return List<MovieModel>();
      }
    }
    catch(e)
    {
      print(e);
      // ignore: deprecated_member_use
      return List<MovieModel>();
    }
  }
}