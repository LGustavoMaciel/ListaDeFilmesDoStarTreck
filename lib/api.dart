import 'package:http/http.dart' as http;

const baseUrl = "https://api.tvmaze.com/search/shows?q=";

class Api {
  static Future getMovie(search) async {
    var url = baseUrl + search;
    return await http.get(Uri.parse(url));
  }
}

class Movie {
  late int id;
  late String name;
  late String link;
  late String image;

  Movie(int id, String name, String link, String image) {
    this.id = id;
    this.name = name;
    this.link = link;
    this.image = image;
  }

  Movie.fromJson(Map json)
      : id = json['show']['id'],
        name = json['show']['name'],
        link = json['show']['url'],
        image = json['show']['image']['medium'];
}
