import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:signematic/models/movie.dart';

class MovieDetail extends StatelessWidget {
  final Movie movie;
  final String imgPath = 'https://image.tmdb.org/t/p/w500';

  MovieDetail(this.movie);

  @override
  Widget build(BuildContext context) {
    String path;
    double height = MediaQuery.of(context).size.height;
    if (movie.posterPath != null) {
      path = imgPath + movie.posterPath;
    } else {
      path =
          'https://images.freeimages.com/images/large-previews/5eb/movie-clapboard-1184339.jpg';
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(movie.title),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    colorFilter: ColorFilter.matrix(<double>[
                      0.2126,
                      0.7152,
                      0.0722,
                      0,
                      0,
                      0.2126,
                      0.7152,
                      0.0722,
                      0,
                      0,
                      0.2126,
                      0.7152,
                      0.0722,
                      0,
                      0,
                      0,
                      0,
                      0,
                      1,
                      0,
                    ]),
                    image: NetworkImage(path),
                    fit: BoxFit.cover,
                  ),
                ),
                padding: EdgeInsets.only(left: 16, right: 16, top: 10),
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.8),
                            spreadRadius: 1,
                            blurRadius: 2, // changes position of shadow
                          ),
                        ],
                      ),
                      child: Image.network(path),
                    ),
                    Text(
                      movie.title + ' (' + movie.date.year.toString() + ')',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    RichText(
                      text: TextSpan(
                        style: Theme.of(context).textTheme.bodyText2,
                        children: [
                          WidgetSpan(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 2.0),
                              child: Icon(Icons.star, color: Colors.yellow),
                            ),
                          ),
                          TextSpan(
                            text: movie.voteAverage.toString(),
                            style: TextStyle(fontSize: 23, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                padding: EdgeInsets.only(left: 16, right: 16, top: 10),
                child: Text(
                  'Overview',
                  style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.left,
                ),
              ),
              Container(
                child: Text(
                  '  ' + movie.overview,
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
                padding: EdgeInsets.only(left: 16, right: 16, top: 10),
              )
            ],
          ),
        ),
      ),
    );
  }
}
