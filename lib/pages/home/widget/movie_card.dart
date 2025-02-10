// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:movie_booking_app/domain/constant/ui_helper.dart';

class MovieCard extends StatelessWidget {
  final String movieImage;
  final String movieName;
  final String movieType;
  final VoidCallback onTap;

  const MovieCard({
    super.key,
    required this.movieImage,
    required this.movieName,
    required this.movieType,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        // Card decoration with border and rounded corners
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            width: 1,
            color: Colors.white,
          ),
        ),
        child: Stack(
          children: [
            // Movie image with rounded corners
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: UiHelper.assetImage(
                image: movieImage,
                boxFit: BoxFit.cover,
                height: 250,
                width: 200,
              ),
            ),
            Positioned(
              // Bottom overlay with movie name and type
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.only(left: 15),
                height: 50,
                width: 200,
                decoration: const BoxDecoration(
                  color: Colors.black45, // Semi-transparent background
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Movie name text
                    UiHelper.customText(
                      text: movieName,
                      height: 0,
                      fontsize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    // Movie type/genre text
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
      ),
    );
  }
}
