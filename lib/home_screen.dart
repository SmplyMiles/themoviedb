


import 'dart:core';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:themoviedb/Api/movies_api.dart';
import 'package:themoviedb/Models/movies.dart';
import 'package:themoviedb/drawer.dart';
import 'package:themoviedb/movie_detail_screen.dart';
import 'package:themoviedb/size_config.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';


class HomeScreen extends StatefulWidget {
  static String routeName = "/home_screen";

 const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
final TextEditingController searchController = TextEditingController();
// one must always be true, means selected.
List <bool> isSelected = [true, false];




 List<Map <String, dynamic>> movieCategoriesList = [];



 Container singleMovieCategoryContainer () {
      
        
      // ignore: sized_box_for_whitespace
      return Container(
        height: 600,
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: movieCategoriesList.length,
          itemBuilder:(context, index) {
                     
              final String movieCategory = movieCategoriesList[index]['title'].toString();
              final List <Movie> moviesList = movieCategoriesList[index]['movies'];

             // ignore: sized_box_for_whitespace
             return Container(
                height: getProportionateScreenHeight(460),
                // decoration:BoxDecoration(border: Border.all(color: Colors.cyan.shade800), borderRadius: BorderRadius.circular(10)),
                child: Column(
                children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 0, top: 10, bottom: 20),
                      child: Align( alignment: Alignment.centerLeft, child: Text(movieCategory, style:  GoogleFonts.kdamThmorPro( color: Colors.cyan.shade900, fontSize: 26))),
                    ),
                    // ignore: sized_box_for_whitespace
                    Container(
                      height: getProportionateScreenHeight(360),
                      // decoration: BoxDecoration(color: Colors.cyan.shade50),
                      // padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20), vertical: getProportionateScreenHeight(30)),
                      child: ListView.builder(
                        itemCount: moviesList.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, int ind) {
                          return Container(
                            padding: const EdgeInsets.only(right: 15),
                            // height: getProportionateScreenHeight(300),
                            child: GestureDetector(
                              onTap:() {
                                  Navigator.pushNamed(context, MovieDetailScreen.routeName, arguments: {'movie': moviesList[ind]});
                              },
                              child: Column(
                                children: [
                                  Container(
                                      height: getProportionateScreenHeight(300),
                                      width: getProportionateScreenWidth(200),
                                      decoration:  BoxDecoration(
                                        image: DecorationImage (
                                          image: NetworkImage(moviesList[ind].posterPath), // Replace with the URL of your network image
                                          fit: BoxFit.contain, // Adjust the fit as needed
                                        ),
                                        // color: Colors.cyan.shade50
                                      ),
                                    ),
                                    SizedBox( 
                                      height: getProportionateScreenHeight(60),
                                      child: Column(
                                         children: [
                                            const Spacer(),
                                            Text(
                                              moviesList[ind].originalTitle.length>18 ? '${moviesList[ind].originalTitle.substring(0, 18)} ..' : moviesList[ind].originalTitle,
                                              style: const TextStyle(fontWeight: FontWeight.bold),
                                            ),
                                            Text(moviesList[ind].releaseDate ?? '---', style: const TextStyle(fontWeight: FontWeight.bold))
                                         ],
                                      ),
                                    )
                                ],
                              ),
                            ),
                          );
                        }
                      )
                    ),
                ],
                ),
            );

          }
        ),
      );
 
     // ignore: sized_box_for_whitespace
    //  return Container(
    //             height: getProportionateScreenHeight(400),
    //             // decoration:BoxDecoration(border: Border.all(color: Colors.cyan.shade800), borderRadius: BorderRadius.circular(10)),
    //             child: Column(
    //             children: [
    //                 Padding(
    //                   padding: const EdgeInsets.only(left: 0, top: 10, bottom: 5),
    //                   child: Align( alignment: Alignment.centerLeft, child: Text(movieCategory, style:  GoogleFonts.kdamThmorPro( color: Colors.cyan.shade900, fontSize: 30 ))),
    //                 ),
    //                 // ignore: sized_box_for_whitespace
    //                 Container(
    //                   height: getProportionateScreenHeight(340),
    //                   // padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20), vertical: getProportionateScreenHeight(30)),
    //                   child: ListView.builder(
    //                     itemCount: moviesList.length,
    //                     scrollDirection: Axis.horizontal,
    //                     itemBuilder: (BuildContext context, int index) {
    //                       return Container(
    //                         padding: const EdgeInsets.only(right: 15),
    //                         // height: getProportionateScreenHeight(300),
    //                         child: Container(
    //                             // height: 200,
    //                             width: 200,
    //                             decoration:  BoxDecoration(
    //                               image: DecorationImage (
    //                                 image: NetworkImage(moviesList[index].posterPath), // Replace with the URL of your network image
    //                                 fit: BoxFit.contain, // Adjust the fit as needed
    //                               ),
    //                             ),
    //                           ),
    //                       );
    //                     }
    //                   )
    //                 ),
    //             ],
    //             ),
    //         );
 }

@override
Widget build(BuildContext context) {
	return Scaffold(
	appBar: AppBar(
		title: Center(
          child: Padding(
            padding: const EdgeInsets.only(left: 30),
            child: SvgPicture.asset(
                  "assets/images/logo-1.svg",
                  color:  Colors.cyan.shade100,
                  width: 50,
                ),
          ),
        ),
    actions: <Widget>[
        IconButton(
            icon: const Icon(Icons.account_circle_sharp),
            tooltip: 'Comment Icon',
            onPressed: () {},
          ), //IconButton
          IconButton(
            icon: const Icon(Icons.search),
            tooltip: 'Setting Icon',
            onPressed: () {},
          )
    ],
		backgroundColor: Colors.cyan.shade700,
	),
	body: SingleChildScrollView(
      child: Column(
        children: [

          Stack(
            children: [
                  Container(
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/app-banner-1.png'),
                          // scale: 0.1  
                          fit: BoxFit.cover
                        )
                      ),
                      height: 450,
                  ),
                  SizedBox(
                    height: 450,
                    //  color: Colors.amberAccent,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 20),
                      child: Column(
                          children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text('Welcome.', style: GoogleFonts.kdamThmorPro(
                                  color: Colors.white,
                                  fontSize: 50
                                )),
                              ),
                              Text('Millions of movies,Tv shows and people to discover. Explore now.', style: GoogleFonts.lato(
                                color: Colors.white,
                                fontSize: 39
                              )), 
                              const SizedBox(height: 25),
                              Container(
                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(40), color: Colors.white),
                                child: Row(
                                  children: [
                                    Container(
                                      width: 230,
                                      padding: const EdgeInsets.symmetric( horizontal: 25, vertical:5),
                                      child: TextFormField(
                                        controller: searchController,
                                        keyboardType: TextInputType.text,
                                        decoration: const InputDecoration(
                                          hintText: "Search....",
                                          hintStyle: TextStyle(color: Colors.black)
                                      ),
                                      ),
                                      ),
                                    const Spacer(),
                                    Container(
                                      decoration: BoxDecoration(color: Colors.cyan.shade400, borderRadius: BorderRadius.circular(40)),
                                      padding: const EdgeInsets.all(20),
                                      child: const Text('Search', style: TextStyle(fontSize: 16, color: Colors.white),),
                                    )
                                  ],
                                ),
                              )
                          ],
                      ),
                    ),
                  )
            ],
          ),

          Container(
            // height: 600,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Consumer(
              builder: (context, ref, child) {
                 if (movieCategoriesList.isNotEmpty) {
                      return singleMovieCategoryContainer();
                 } else {
                      return FutureBuilder(
                            future: MoviesApi().loadHomeData(), 
                            builder:(context, snapshot) {

                                if (snapshot.connectionState == ConnectionState.waiting || snapshot.connectionState == ConnectionState.active) {
                                    return SizedBox(
                                        height: getProportionateScreenWidth(200),
                                        child: const Center(child: CircularProgressIndicator()));
                                } else if (snapshot.hasError) {
                                    return Text('Error: ${snapshot.error}');
                                } else if (snapshot.connectionState == ConnectionState.done) {

                                      final response = snapshot.data;
                                      if (response!.isNotEmpty) {  

                                            final moviesData = response['data'];   
                                      
                                            for (var i = 0; i < moviesData.length; i++) {
                                              final String movieCategory = moviesData[i]['title'].toString();
                                              final List <dynamic> moviesArray = moviesData[i]['movies'];
                                                      List<Movie> moviesList = [];
                                                    for (var index = 0; index < moviesArray.length; index++) {
                                                        final Movie movie = Movie(
                                                            id: moviesArray[index]['_id'], 
                                                            backdropPath: moviesArray[index]['backdrop_path'], 
                                                            genres: moviesArray[index]['genres'].toString(), 
                                                            originalTitle: moviesArray[index]['original_title'], 
                                                            overview: moviesArray[index]['overview'], 
                                                            posterPath: moviesArray[index]['poster_path'], 
                                                            releaseDate: moviesArray[index]['release_date'], 
                                                            title: moviesArray[index]['title'], 
                                                            contentType: moviesArray[index]['contentType'],
                                                            youtubeTrailer: moviesArray[index]['youtube_trailer'],
                                                            voteAverage: moviesArray[index]['vote_average']
                                                        );
                                                        moviesList.add(movie);
                                                    }
                                                    log(moviesList.toString());
                                                    movieCategoriesList.add({'title': movieCategory, 'movies': moviesList});
                                            } 


                                            return singleMovieCategoryContainer();
                                      } else {
                                            return const Center(
                                              child: Align(
                                                alignment: Alignment.center,
                                                child: Text('Soemthing went wrong, please try again ...'),
                                              ),
                                            );
                                      }

                                }

                                return const Center();
                            },
                          );
                 }
              },
            ),
          )
          
        ],
      ),
  ),
	drawer: drawer(context)
	);
}
}
