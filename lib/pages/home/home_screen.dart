import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_booking_app/domain/constant/assets.dart';
import 'package:movie_booking_app/domain/constant/ui_helper.dart';
import 'package:movie_booking_app/pages/home/widget/movie_card.dart';
import 'package:movie_booking_app/pages/movie%20details/movie_details_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // List of image assets for carousel
  final List<String> image = [
    Assets.infinity,
    Assets.salman,
    Assets.shahrukhMovies
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(top: 30, left: 30),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // User profile section with name and profile image
              Row(
                children: [
                  UiHelper.assetImage(
                    image: Assets.wave,
                    boxFit: BoxFit.cover,
                    height: 40,
                    width: 40,
                  ),
                  const SizedBox(width: 10),
                  UiHelper.customText(
                      text: "Hello, Ganesh",
                      color: Colors.white,
                      fontsize: 22,
                      fontWeight: FontWeight.bold),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(60),
                      child: UiHelper.assetImage(
                        image: Assets.boy,
                        boxFit: BoxFit.cover,
                        height: 60,
                        width: 60,
                      ),
                    ),
                  )
                ],
              ),
              // Welcome text
              UiHelper.customText(
                text: "Welcome To,",
                color: const Color.fromARGB(186, 255, 255, 255),
                fontsize: 18,
                fontWeight: FontWeight.bold,
              ),
              // App name "Filmy Fun"
              Row(
                children: [
                  UiHelper.customText(
                    text: "Filmy",
                    color: Colors.white,
                    fontsize: 36,
                    fontWeight: FontWeight.bold,
                  ),
                  UiHelper.customText(
                    text: "Fun",
                    color: const Color(0xffedb41d),
                    fontsize: 36,
                    fontWeight: FontWeight.bold,
                  ),
                ],
              ),
              const SizedBox(height: 10),
              // Image carousel with auto play
              CarouselSlider(
                options: CarouselOptions(
                  height: 270,
                  autoPlay: true,
                  aspectRatio: 16 / 9,
                  viewportFraction: 1,
                  enlargeCenterPage: true,
                  autoPlayAnimationDuration: const Duration(seconds: 2),
                ),
                items: image.map((i) {
                  return Builder(
                    builder: (BuildContext context) {
                      return SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: UiHelper.assetImage(
                            image: i,
                            boxFit: BoxFit.cover,
                          ),
                        ),
                      );
                    },
                  );
                }).toList(),
              ),
              const SizedBox(height: 20),
              // Section title for "Top Trending Movies"
              UiHelper.customText(
                text: "Top Trending Movies",
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontsize: 20,
              ),
              const SizedBox(height: 20),
              // Horizontal list of trending movies (MovieCard widgets)
              SizedBox(
                height: 260,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    MovieCard(
                      onTap: () {
                        Navigator.push(
                          context,
                          CupertinoPageRoute(
                            builder: (context) => const MovieDetailsScreen(
                              moviePrice: 350,
                                movieImage: Assets.infinity,
                                movieName: "Infinity War",
                                movieType: "Action, Adventure",
                                movieDescription:
                                    "The Avengers and their allies must be willing to sacrifies all in an attempt to defeat the powerful Thanos before his blitz of devastation and ruin puts an end to the universe"),
                          ),
                        );
                      },
                      movieImage: Assets.infinity,
                      movieName: "Infinity",
                      movieType: "Action, Adventure",
                    ),
                    const SizedBox(width: 20),
                    MovieCard(
                      onTap: () {
                        Navigator.push(
                          context,
                          CupertinoPageRoute(
                            builder: (context) => const MovieDetailsScreen(movieImage: Assets.pushpa, movieName: "Pushpa 2: The Rule", movieType: "Action, Adventure", movieDescription: " The Rule is a 2024 Indian Telugu-language action drama film[8] written and directed by Sukumar and produced by Mythri Movie Makers in association with Sukumar Writings.", moviePrice: 300,),
                          ),
                        );
                      },
                      movieImage: Assets.pushpa,
                      movieName: "Pushpa",
                      movieType: "Action, Adventure",
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
