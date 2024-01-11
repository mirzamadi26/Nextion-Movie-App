import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../data/models/movie_model.dart';
import '../api_constants.dart';
import '../fixed_constants.dart';

Widget movieHeader(Size size, BuildContext context, MovieModel movie) {
  return Stack(children: [
    Center(
      child: CachedNetworkImage(
        imageUrl: '${ApiConstants.imageEndPoint}${movie.bg}',
        height: size.height * 0.5,
        fit: BoxFit.cover,
      ),
    ),
    Container(
      height: size.height * 0.5,
      width: double.infinity,
      decoration: const BoxDecoration(color: Colors.black26),
      child: SizedBox(
        width: size.width * 0.6,
        child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
          //  CustomText.bodyText(formattedDate, color: Colors.white),
          fixedVerticalSpace(10),
        ]),
      ),
    ),
  ]);
}
