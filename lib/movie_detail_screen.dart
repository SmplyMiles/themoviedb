


import 'dart:core';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:themoviedb/Models/movies.dart';
import 'package:themoviedb/drawer.dart';
import 'package:themoviedb/size_config.dart';


class MovieDetailScreen extends StatefulWidget {

  static String routeName = "/movie_detail_screen";
  const MovieDetailScreen({Key? key}) : super(key: key);

  @override
  State<MovieDetailScreen> createState() => _MovieDetailScreenState();
}

class _MovieDetailScreenState extends State<MovieDetailScreen> {
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
 
     
 }

@override
Widget build(BuildContext context) {
  
   // Retrieve the arguments passed from the previous screen
      final Map<String, dynamic> args = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>? ?? {};
      final Movie movie                = args['movie']; 
      log(movie.toString());


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
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(movie.backdropPath),
                          // scale: 0.1  
                          fit: BoxFit.cover,
                        )
                      ),
                      height: 250,
                  ),
                  Container(
                      decoration: const BoxDecoration(
                        color:  Color.fromRGBO(40, 137, 156, 0.757)
                      ),
                      height: 250,
                  ),
                  Container(
                    height: 250,
                    //  color: Colors.amberAccent,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 20),
                      child: Row(
                          children: [
                                  Container(
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: NetworkImage(movie.posterPath),
                                          // scale: 0.1  
                                          fit: BoxFit.cover,
                                        ),
                                        borderRadius: BorderRadius.circular(10)
                                      ),
                                      height: 250,
                                      width: 140,
                                  ),
                                  const Spacer(flex: 2)
                          ],
                      ),
                    ),
                  )
            ],
          ),
          SizedBox(
            height: getProportionateScreenHeight(60),
           child:  Column(
                    children: [
                      Spacer(),
                   Text(

                        (movie.originalTitle), style:  const TextStyle(fontSize: 29,  fontWeight: FontWeight.bold,)
                               ),
                     Text(
                    

                    movie.releaseDate ?? '---' , style: const TextStyle(fontWeight: FontWeight.bold) 

                     ),
                      
                    ],
           ),
         ),
        
       


        Container(
          height: 50,
          width: 420,
          color: const Color.fromARGB(255, 132, 131, 133),
          margin: const EdgeInsets.all(20),
          child:   Text(
          
                    movie.voteAverage ?? '---' , style: const TextStyle(fontWeight: FontWeight.bold)

                    ),

         ),
        

      Container(
        height: getProportionateScreenHeight(165),
        child: Column(
          children: [
            Align(
            alignment: Alignment.centerLeft,
              child: Text(
                  'Overview:', style: GoogleFonts.kdamThmorPro(
                                  color: const Color.fromARGB(255, 12, 12, 12),
                                  fontSize: 20, 
                      ),
              ),
              ),
              
           Text(          
            movie.overview.length>200 ? '${movie.overview.substring(0, 200)} ..' : movie.overview,
           )

           

//moviesList[ind].originalTitle.length>18 ? '${moviesList[ind].originalTitle.substring(0, 18)} ..' : moviesList[ind].originalTitle,

          ],
        )
      )

          
        ],
      ),
  ),

	drawer: drawer(context), //Drawer
	);
}
}
