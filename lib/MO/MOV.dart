// ignore: avoid_web_libraries_in_flutter
//import 'dart:html';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

import 'package:movies2/MD/MODE.dart';

class move extends StatelessWidget {
  final List<Movie> movieList = Movie.getmovies();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: CircleAvatar(
          child: Text(
            "M",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        title: Text(
          "Movies",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
        ),
        centerTitle: true,
        backgroundColor: Colors.blueGrey.shade900,
      ),
      backgroundColor: Colors.blueGrey.shade900,
      body: ListView.builder(//we will use list view builder if we want to navigate from one route to other.
          itemCount: movieList.length,
          itemBuilder: (BuildContext context, int index) {
            return Stack(children: <Widget>[
              realcard(movieList[index], context),
              Positioned(
                  top: 10.0, child: movieImage(movieList[index].images[0])),
            ]);
//            return Card(
//              borderOnForeground: true,
//              clipBehavior: Clip.antiAlias,
//              elevation: 20.0,
//              color: Colors.white,
//              child: ListTile(
//                  dense: true,
//                  leading: CircleAvatar(
//
//                    //backgroundColor: Colors.blueGrey,
//                    child: Container(
//                      width: 200,
//                        height: 150,
//                      decoration: BoxDecoration(
//                        borderRadius: BorderRadius.circular(13.9),
//                        image: DecorationImage(
//                          image:NetworkImage(
//                            movieList[index].images[0],
//
//                          ),
//                          fit: BoxFit.cover
//                        )
//                      ),
////                      child: Text(
////                        "H",
////                        style: TextStyle(
////                            fontWeight: FontWeight.bold,
////                            fontSize: 18.0,
////                            color: Colors.white),
////                      ),
//                    ),
//                  ),
//                  trailing: Text(
//                    "...",
//                    style: TextStyle(
//                        fontWeight: FontWeight.bold, color: Colors.black),
//                  ),
//                  title: Text(
//                    movieList[index].title,
//                    style: TextStyle(
//                        fontWeight: FontWeight.bold,
//                        fontSize: 18.0,
//                        color: Colors.black),
//                  ),
//                  onTap: () => {
//                        Navigator.push(
//                            context,
//                            MaterialPageRoute(
//                                builder: (context) => navigator(
//
//                                  movies:movieList[index],//This is a movie object object.A movie object is an object which
//                                  // is present inside an array
//                                    )))
//                        //builder is a widget which accepts the context so that it
//                        // knows where to act and a function to act upon
//                      }
//                  //debugPrint("tapped")},
//                  ),
//            );
          }),
    );
  }

  Widget realcard(Movie movie, BuildContext context) {
    return InkWell(
      child: Container(
        margin: EdgeInsets.only(left: 60.0),
        width: MediaQuery.of(context)
            .size
            .width, //this will dynamically set up the width
        height: 120.0,
        child: Card(
          elevation: 10.9,
          color: Colors.blueGrey.shade900,
          child: Padding(
            padding: const EdgeInsets.only(left: 54.0, top: 8.0, bottom: 8.0),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Flexible(
                        child: Text(
                          movie.title,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 20.0),
                        ),
                      ),
                      Text(
                        "Ratings: ${movie.imbrating}/10",
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Text(
                        "Release: ${movie.released}",
                        style: TextStyle(color: Colors.white),
                      ),
                      //Text("Runtime: ${movie.runtime}"),
                      Text(
                        "Rated: ${movie.rated}",
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
      onTap: () => {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => navigator(
                      movies:
                          movie, //This is a movie object object.A movie object is an object which
                      // is present inside an array
                    ))),
      },
    );
  }

  Widget movieImage(String url) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
              image: NetworkImage(url ??
                  'https://www.google.com/url?sa=i&url=http%3A%2F%2Fleeford.in%2Fimage-not-found%2F&psig=AOvVaw2oAWSGkVBw64js1Yj-QYno&ust=1590579338326000&source=images&cd=vfe&ved=0CAIQjRxqFwoTCND66_W30ekCFQAAAAAdAAAAABAI'),
              fit: BoxFit.cover)),
    );
  }
}

class navigator extends StatelessWidget {
  final String moviename;
  final Movie movies;

  const navigator({Key key, this.moviename, this.movies})
      : super(key: key); //Here the key Parameter is an
  // optional one.Because we are using the {} (Paranthesis}.if we have used curely brackets
  // then we would have to pass 2 Parameters.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.blueGrey.shade900,
//        leading: CircleAvatar(
//          child: Text(
//            "N",
//            style: TextStyle(
//                //fontStyle: FontStyle.italic,
//              fontWeight: FontWeight.bold,
//                color: Colors.white,
//                backgroundColor: Colors.blueGrey.shade900),
//          ),
//        ),
          title: Text(
            "Navigator",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
        backgroundColor: Colors.grey,
        body: ListView(
          children: <Widget>[
            Moviethumbnails(
              thumbnail: movies.images[0],
            ),
            movieposter(
              movies: movies,
            ),
            moviedetailscast(
              movies: movies,
            ),
            Line(),
            Posters(posters: movies.images)
          ],
        )

//      body: Container(
//        child: Center(
//          child: RaisedButton(
//              child: Text(
//                "${movies.director}",
//                style: TextStyle(fontWeight: FontWeight.bold),
//              ),
//              onPressed: () {
//                Navigator.pop(context); //this will take back to the homepage
//              }),
//        ),
//      ),
        );
  }
}

class Moviethumbnails extends StatelessWidget {
  final String thumbnail;

  const Moviethumbnails({Key key, this.thumbnail}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: <Widget>[
        Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Container(
              // margin: EdgeInsets.only(top: 60),
              width: MediaQuery.of(context).size.width,
              height: 190,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(thumbnail), fit: BoxFit.cover)),
            ),
            Icon(
              Icons.play_circle_outline,
              size: 100,
              color: Colors.white,
            )
          ],
        ),
        Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
            //this gives us the shady effect.
            //we can use the hex colors here.
            // Colors.blueGrey.shade200,
            Color(0x00f5f5f5),
            Color(0xfff5f5f5)
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
          height: 80.0,
        )
      ],
    );
  }
}

class movieposter extends StatelessWidget {
  final Movie movies;

  const movieposter({Key key, this.movies}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: <Widget>[
          MoviePoster(poster: movies.images[0].toString()),
          SizedBox(
            width: 16,
          ),
          
          Expanded(
            child: moviedetailheader(movies: movies),
          )
        ],
      ),
    );
  }
}

class moviedetailheader extends StatelessWidget {
  final Movie movies;

  const moviedetailheader({Key key, this.movies}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          "${movies.year} . ${movies.genre}".toUpperCase(),
          style: TextStyle(fontWeight: FontWeight.w400, color: Colors.cyan),
        ),
        Text(
          "${movies.title}",
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 32),
        ),
        Text.rich(TextSpan(
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.w300),
            children: <TextSpan>[
              TextSpan(
                  text: movies.plot,
                  style: TextStyle(fontWeight: FontWeight.w300, fontSize: 13)),
              TextSpan(text: "More...", style: TextStyle(color: Colors.cyan))
            ]))
      ],
    );
  }
}

class MoviePoster extends StatelessWidget {
  final String poster;

  const MoviePoster({Key key, this.poster}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
        child: ClipRect(
      child: Container(
        width: MediaQuery.of(context).size.width / 4,
        height: 160,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(poster), fit: BoxFit.cover)),
      ),
    ));
  }
}

class moviedetailscast extends StatelessWidget {
  final Movie movies;

  const moviedetailscast({Key key, this.movies}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        children: <Widget>[
          MovieField(fields: "Cast: ", value: movies.actors),
          MovieField(fields: "Director: ", value: movies.director),
          MovieField(
            fields: "Language: ",
            value: movies.language,
          )
        ],
      ),
    );
  }
}

class MovieField extends StatelessWidget {
  final String fields;
  final String value;

  const MovieField({Key key, this.fields, this.value}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          "$fields",
          style: TextStyle(
              fontSize: 12, fontWeight: FontWeight.w500, color: Colors.black38),
        ),
        Expanded(
            child: Text(
          "$value",
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.w300, fontSize: 12),
        ))
      ],
    );
  }
}

class Line extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Container(
        height: 0.5,
        color: Colors.black,
      ),
    );
  }
}

class Posters extends StatelessWidget {
  final List<String> posters;

  const Posters({Key key, this.posters}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Text(
            "More Movie Posters".toUpperCase(),
            style: TextStyle(fontSize: 14, color: Colors.black),
          ),
        ),
        Container(
          height: 200,
          child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => ClipRect(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        width: MediaQuery.of(context).size.width / 4,
                        height: 200,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(posters[index]),
                                fit: BoxFit.cover)),
                      ),
                    ),
                  ),
              separatorBuilder: (context, index) => SizedBox(
                    width: 5,
                  ),
              itemCount: posters.length),
          //Separater Builder separates the posters from each other so that they don't intersect.
        )
      ],
    );
  }
}
