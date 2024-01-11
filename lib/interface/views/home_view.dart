import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:movie_app/interface/views/home_view_tabs/favorite_movies_screen.dart';

import '../utils/themes/app_theme.dart';
import 'home_view_tabs/watch_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<Widget> tabs = [
    WatchView(),
    FavoriteMovies(),
  ];
  int _current = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[_current],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
            color: darkPurple,
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(30), topRight: Radius.circular(30))),
        child: GNav(
            selectedIndex: 0,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            onTabChange: (i) {
              setState(() {
                _current = i;
              });
            },
            activeColor: Colors.white,
            color: Colors.white54,
            tabs: const [
              GButton(icon: Icons.ondemand_video_rounded),
              GButton(icon: Icons.favorite),
            ]),
      ),
    );
  }
}
