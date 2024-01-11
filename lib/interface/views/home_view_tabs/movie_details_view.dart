import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/models/movie_model.dart';
import '../../controllers/watch_controller.dart';
import '../../utils/constants/fixed_constants.dart';
import '../../utils/constants/paddings.dart';
import '../../utils/constants/text_constants.dart';
import '../../utils/constants/widgets/movie_header.dart';

class MovieDetailsView extends StatelessWidget {
  MovieDetailsView({super.key, required this.movie});
  final MovieModel movie;
  final watchViewController = Get.find<WatchViewController>();
  @override
  Widget build(BuildContext context) {
    // watchViewController.getGenresOfMovie(movie.id.toString());
    Size size = getSize(context);
    String formattedDate =
        '${months[movie.releaseDate.split('-')[1]]} ${movie.releaseDate.split('-').last}, ${movie.releaseDate.split('-').first}';
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back_ios_new_rounded,
              color: Colors.white,
            )),
        title:
            CustomText.boldText(movie.title, color: Colors.white, fontSize: 20),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: SizedBox(
        height: size.height,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: size.height * 0.5,
                // width: size.width,
                child: Hero(
                    tag: movie.id,
                    child: Material(child: movieHeader(size, context, movie))),
              ),
              SizedBox(
                child: Padding(
                  padding: AppPaddings.horizontalSymmetricPadding,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                     
                      fixedVerticalSpace(15),
                      CustomText.boldText('Release Date', fontSize: 20),
                      fixedVerticalSpace(15),
                      CustomText.smallText(
                        formattedDate,
                      ),
                      fixedVerticalSpace(15),
                      CustomText.boldText('Overview', fontSize: 20),
                      fixedVerticalSpace(15),
                      CustomText.smallText(
                        movie.overview,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

Map<String, String> months = {
  '01': 'January',
  '02': 'Feburary',
  '03': 'March',
  '04': 'April',
  '05': 'May',
  '06': 'June',
  '07': 'July',
  '08': 'August',
  '09': 'September',
  '10': 'October',
  '11': 'November',
  '12': 'December'
};
