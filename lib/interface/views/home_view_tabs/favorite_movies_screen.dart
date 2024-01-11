import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../../data/models/movie_model.dart';
import '../../controllers/watch_controller.dart';
import '../../utils/constants/fixed_constants.dart';
import '../../utils/constants/text_constants.dart';
import '../../utils/constants/widgets/movie_list_widget.dart';
import '../../utils/constants/widgets/simple_shimer.dart';

class FavoriteMovies extends StatelessWidget {
  FavoriteMovies({super.key});
  final watchViewController = Get.put(WatchViewController());

  @override
  Widget build(BuildContext context) {
    Size s = getSize(context);
    return Material(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          iconTheme: const IconThemeData(color: Colors.black87),
          elevation: 1,
          leadingWidth: 0,
          toolbarHeight: 80,
          automaticallyImplyLeading: false,
          
          title: CustomText.normalText('Favorite Movies', fontSize: 20),
        ),

        //Get Favorite Movies using FutureBuilder
        body: FutureBuilder<List<MovieModel>>(
          future: watchViewController.getFavoriteMovies(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: simpleShimmerLoading(s));
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return Center(child: Text('No favorite movies.'));
            } else {
              return Stack(
                children: [
                  Center(
                    child: SizedBox(
                      height: s.height,
                      width: s.width * 0.95,
                      child: movieListWidget(
                          context: context,
                          movies: snapshot.data!,
                          size: s,
                          showIcon: false),
                    ),
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
