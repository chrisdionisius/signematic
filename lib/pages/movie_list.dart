import 'package:flutter/material.dart';
import 'package:signematic/services/http_service.dart';

import 'movie_detail.dart';

class MovieList extends StatefulWidget {
  @override
  _MovieListState createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {
  int moviesCount;
  List movies;
  HttpService service;

  Future initialize() async {
    movies = [];
    movies = await service.getPopularMovies();
    setState(() {
      moviesCount = movies.length;
      movies = movies;
    });
  }

  @override
  void initState() {
    service = HttpService();
    initialize();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final src = 'https://image.tmdb.org/t/p/w500';
    return Scaffold(
      backgroundColor: const Color(0xff252c48),
      appBar: AppBar(
        title: Text("Popular Movies"),
      ),
      body: ListView.builder(
        itemCount: (this.moviesCount == null) ? 0 : this.moviesCount,
        itemBuilder: (context, int position) {
          return Card(
            color: Colors.white,
            elevation: 2.0,
            child: ListTile(
                leading: Image.network(src + movies[position].posterPath),
                title: Text(movies[position].title +
                    ' (' +
                    movies[position].date.year.toString() +
                    ')'),
                subtitle: Text(
                  'Rating = ' + movies[position].voteAverage.toString(),
                ),
                trailing: Icon(Icons.arrow_right),
                onTap: () {
                  MaterialPageRoute route = MaterialPageRoute(
                      builder: (_) => MovieDetail(movies[position]));
                  Navigator.push(context, route);
                }),
          );
        },
      ),
    );
  }
}
