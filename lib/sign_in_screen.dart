import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:themoviedb/api.dart';
import 'package:themoviedb/constants.dart';
import 'package:themoviedb/home_screen.dart';
import 'package:themoviedb/size_config.dart';
import 'package:url_launcher/url_launcher.dart';



class SignInScreen extends StatefulWidget {
  static String routeName = "/sign_in";

  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  bool btnSignIn = true;

  @override
  Widget build(BuildContext context) {

    SizeConfig().init(context);



    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title:  Center(
          child: Text(
            "The Movie Database", 
            style: GoogleFonts.nunito(color: Colors.white, fontSize: 22, fontStyle: FontStyle.normal ))),
      ),
      body: SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: getProportionateScreenHeight(200)),
                Text(
                  "Welcome!",
                   style: GoogleFonts.nunito(color: Colors.black, fontSize: 50, fontStyle: FontStyle.normal),
                ),
                SizedBox(height: getProportionateScreenWidth(30)),
                Text(
                  "Millions of movies, TV shows and people to discover. Explore now",
                  style: GoogleFonts.nunito(color: Colors.black, fontSize: 20, fontStyle: FontStyle.italic),
                  textAlign: TextAlign.center,
                ),

                SizedBox(height: getProportionateScreenWidth(70)),

                TextButton(
                  onPressed: () async {
                     Navigator.pushNamed(context, HomeScreen.routeName);
                  }, 
                  style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.cyan.shade800), 
                    foregroundColor: const MaterialStatePropertyAll(Colors.white),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 100),
                    child: Text('Continue', style: TextStyle(fontSize: 15),),
                  )
                ),
                
                
                SizedBox(height: getProportionateScreenWidth(35)),  
              ],
            ),
          ),
        ),
      ),
    )
    );
  }
}