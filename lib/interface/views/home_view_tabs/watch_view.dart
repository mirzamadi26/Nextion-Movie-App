import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/watch_controller.dart';
import '../../utils/constants/fixed_constants.dart';
import '../../utils/constants/paddings.dart';
import '../../utils/constants/text_constants.dart';
import '../../utils/constants/widgets/simple_shimer.dart';
import '../../utils/constants/widgets/movie_list_widget.dart';

class WatchView extends StatelessWidget {
  WatchView({super.key});
  final watchViewController = Get.put(WatchViewController());

  @override
  Widget build(BuildContext context) {
    Size s = getSize(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black87),
        elevation: 1,
        leadingWidth: 0,
        toolbarHeight: 80,
        automaticallyImplyLeading: false,
        title: CustomText.normalText('Popular Movies', fontSize: 20),
      ),
      body: Stack(
        children: [

          //Get Popular Movies using FutureBuilder
          FutureBuilder(
            future: watchViewController.getPopularMovies(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: simpleShimmerLoading(s));
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else {
                return Center(
                  child: SizedBox(
                    height: s.height,
                    width: s.width * 0.95,
                    child: movieListWidget(
                      context: context,
                      movies: watchViewController.popularMovies,
                      size: s,
                      showIcon: true,
                    ),
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
