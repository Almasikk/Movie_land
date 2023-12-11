import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vk_copy/app/app_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vk_copy/localization/localizations.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static Page page() => const MaterialPage<void>(child: HomeScreen());

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late SharedPreferences _prefs;
  String _userId = "";

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    _prefs = await SharedPreferences.getInstance();
    setState(() {
      _userId = _prefs.getString("userId") ?? "";
    });
  }

  @override
  Widget build(BuildContext context) {
    final user = context.select((AppBloc bloc) => bloc.state.user);
    return Scaffold(
      appBar: AppBar(
        title:  Text(MyLocalizations.profilePage),
        actions: [
          IconButton(
              onPressed: (){
              }, icon: const Icon(Icons.exit_to_app))
        ],
      ),
      body: Align(
        alignment: const Alignment(0, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 70.0,
              backgroundImage: NetworkImage(
                'https://example.com/profile_image.jpg', // Replace with the actual URL of the profile picture
              ),
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Name', // Replace with the user's name
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            Text("$_userId"),
            const SizedBox(height: 8.0),
            Text(
              user.email ?? "", // Replace with the user's email
              style: const TextStyle(fontSize: 16.0, color: Colors.grey),
            ),
            const SizedBox(height: 18,),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.facebook,color: Colors.blue,size: 40,),
                SizedBox(width: 50,),
                Icon(Icons.alternate_email,color: Colors.blue,size: 40,)
              ],
            ),
            const SizedBox(height: 16.0),
             Text(
              MyLocalizations.favorite, // Customize as needed
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: ListView(
                children: [
                   ListTile(
                    title: Text(MyLocalizations.movie1),
                    subtitle: Text(MyLocalizations.descmovie1),
                    // Add onTap functionality to navigate to movie details, etc.
                  ),
                   ListTile(
                    title: Text(MyLocalizations.movie2),
                    subtitle: Text(MyLocalizations.descmovie2),
                    // Add onTap functionality to navigate to movie details, etc.
                  ),
                   ListTile(
                    title: Text(MyLocalizations.movie3),
                    subtitle: Text(MyLocalizations.descmovie3),
                    // Add onTap functionality to navigate to movie details, etc.
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(

                      ),
                      onPressed: (){
                        context.read<AppBloc>().add(AppLogoutRequested());
                      },
                      child: Text(MyLocalizations.signOut))
                  // Add more ListTile widgets as needed
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
