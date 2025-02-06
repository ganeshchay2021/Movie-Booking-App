import 'package:flutter/material.dart';
import 'package:movie_booking_app/domain/constant/ui_helper.dart';

class MovieCard extends StatelessWidget {
  final String movieImage;
  final String movieName;
  final String movieType;

  const MovieCard({
    super.key,
    required this.movieImage,
    required this.movieName,
    required this.movieType,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          width: 1,
          color: Colors.white,
        ),
      ),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(
              10,
            ),
            child: UiHelper.assetImage(
              image: movieImage,
              boxFit: BoxFit.cover,
              height: 250,
              width: 200,
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.only(left: 15),
              height: 50,
              width: 200,
              decoration: const BoxDecoration(
                color: Colors.black45,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  UiHelper.customText(
                    text: movieName,
                    height: 0,
                    fontsize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  UiHelper.customText(
                    text: movieType,
                    fontsize: 15,
                    color: const Color.fromARGB(173, 255, 255, 255),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
