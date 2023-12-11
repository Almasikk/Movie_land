
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vk_copy/domain/api_client/api_client.dart';
import 'package:vk_copy/localization/localizations.dart';

import '../../domain/entity/movie.dart';
import '../../widgets/movies_slider.dart';
import '../../widgets/trending_slider.dart';

class NewHomeScreen extends StatefulWidget {
  const NewHomeScreen({Key? key}) : super(key: key);

  @override
  State<NewHomeScreen> createState() => _NewHomeScreenState();
}

class _NewHomeScreenState extends State<NewHomeScreen> {

  late Future<List<Movie>> trendingMovies;
  late Future<List<Movie>> topRatedMovies;
  late Future<List<Movie>> upcomingMovies;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    trendingMovies = Api().getTrendingMovies();
    topRatedMovies = Api().getTopRatedMovies();
    upcomingMovies = Api().getUpcomingMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text("MVLand"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        physics:  const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(MyLocalizations.trendMovie,style: GoogleFonts.aBeeZee(fontSize: 25),
              ),
              const SizedBox(height: 32,),
              SizedBox(
                child: FutureBuilder(
                    future: trendingMovies,
                    builder: (context,snapshot){
                      if(snapshot.hasError){
                        return Center(
                          child: Text(snapshot.error.toString()),
                        );
                      }else if(snapshot.hasData){
                        return TrendingSlider(snapshot: snapshot,);
                      }else{
                        return Center(child: CircularProgressIndicator(),);
                      }
                    }
                ),
              ),
              const SizedBox(height: 32,),
              Text(MyLocalizations.topRated,style: GoogleFonts.aBeeZee(fontSize: 25),),
              const SizedBox(height: 32,),
              SizedBox(
                child: FutureBuilder(
                    future: topRatedMovies,
                    builder: (context,snapshot){
                      if(snapshot.hasError){
                        return Center(
                          child: Text(snapshot.error.toString()),
                        );
                      }else if(snapshot.hasData){
                        return MoviesSlider(snapshot: snapshot,);
                      }else{
                        return Center(child: CircularProgressIndicator(),);
                      }
                    }
                ),
              ),
              const SizedBox(height: 32,),
              Text(MyLocalizations.upcoming,style: GoogleFonts.aBeeZee(fontSize: 25),),
              const SizedBox(height: 32,),
              SizedBox(
                child: FutureBuilder(
                    future: upcomingMovies,
                    builder: (context,snapshot){
                      if(snapshot.hasError){
                        return Center(
                          child: Text(snapshot.error.toString()),
                        );
                      }else if(snapshot.hasData){
                        return MoviesSlider(snapshot: snapshot,);
                      }else{
                        return Center(child: CircularProgressIndicator(),);
                      }
                    }
                ),
              ),
      SizedBox(height: 50,)
            ],
          ),
        ),
      ),
    );
  }
}


