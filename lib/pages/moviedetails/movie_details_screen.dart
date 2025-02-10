// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:movie_booking_app/domain/constant/ui_helper.dart';
import 'package:movie_booking_app/pages/moviedetails/widgets/time_slot_widget.dart';

class MovieDetailsScreen extends StatefulWidget {
  final String movieImage;
  final String movieName;
  final String movieType;
  final String movieDescription;
  final int moviePrice;

  const MovieDetailsScreen({
    super.key,
    required this.movieImage,
    required this.movieName,
    required this.movieType,
    required this.movieDescription,
    required this.moviePrice,
  });

  @override
  State<MovieDetailsScreen> createState() => _MovieDetailsScreenState();
}

class _MovieDetailsScreenState extends State<MovieDetailsScreen> {
  List<String> getFormatedDates() {
    final now = DateTime.now();
    final formatter = DateFormat('EEE d');
    return List.generate(7, (index) {
      final date = now.add(Duration(days: index));
      return formatter.format(date);
    });
  }

  int track = 0;
  bool one = false, two = false, three = false;

  @override
  Widget build(BuildContext context) {
    final date = getFormatedDates();
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      //page app bar
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.only(left: 5),
          child: UiHelper.customBackButton(
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
      ),
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            //movie banner
            Container(
              child: UiHelper.assetImage(
                  image: widget.movieImage,
                  height: height / 2,
                  width: width,
                  boxFit: BoxFit.cover),
            ),
            //movie booking details
            Container(
              padding: const EdgeInsets.only(top: 20, left: 20),
              width: width,
              margin: EdgeInsets.only(top: height / 2.4),
              decoration: const BoxDecoration(
                color: Color(0xff1e232c),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(
                    30,
                  ),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //movie name
                  UiHelper.customText(
                    text: widget.movieName,
                    color: Colors.white,
                    fontsize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                  //Movie type text
                  UiHelper.customText(
                    text: widget.movieType,
                    fontsize: 18,
                    fontWeight: FontWeight.w500,
                    color: const Color.fromARGB(174, 255, 255, 255),
                  ),

                  const SizedBox(
                    height: 20,
                  ),
                  //about movie
                  UiHelper.customText(
                    text: widget.movieDescription,
                    fontsize: 17,
                    fontWeight: FontWeight.w500,
                    color: const Color.fromARGB(174, 255, 255, 255),
                  ),

                  const SizedBox(
                    height: 10,
                  ),

                  UiHelper.customText(
                      text: "Select Date",
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                      fontsize: 20),

                  const SizedBox(
                    height: 10,
                  ),
                  //sekect date area
                  SizedBox(
                    height: 60,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: date.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          borderRadius: BorderRadius.circular(10),
                          onTap: () {
                            setState(() {
                              track = index;
                            });
                          },
                          child: Container(
                            width: 100,
                            margin: const EdgeInsets.only(right: 15),
                            padding: const EdgeInsets.all(10),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: track == index
                                      ? Colors.white
                                      : Colors.black,
                                  width: 5),
                              borderRadius: BorderRadius.circular(10),
                              color: const Color(0xffedb41d),
                            ),
                            child: UiHelper.customText(
                              text: date[index],
                              color: Colors.black,
                              fontsize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        );
                      },
                    ),
                  ),

                  const SizedBox(
                    height: 10,
                  ),
                  //time slot text
                  UiHelper.customText(
                      text: "Select Time Slot",
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                      fontsize: 20),

                  const SizedBox(
                    height: 10,
                  ),

                  //time slot arear
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            one = true;
                            two = false;
                            three = false;
                            setState(() {});
                          },
                          child: TimeSlotWidget(
                            time: "08:00 PM",
                            cntColor:
                                one ? Colors.white : const Color(0xff1e232c),
                            textCOlor: one ? Colors.black : Colors.white,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            one = false;
                            two = true;
                            three = false;
                            setState(() {});
                          },
                          child: TimeSlotWidget(
                            time: "11:00 PM",
                            cntColor:
                                two ? Colors.white : const Color(0xff1e232c),
                            textCOlor: two ? Colors.black : Colors.white,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            one = false;
                            two = false;
                            three = true;
                            setState(() {});
                          },
                          child: TimeSlotWidget(
                            time: "01:00 AM",
                            cntColor:
                                three ? Colors.white : const Color(0xff1e232c),
                            textCOlor: three ? Colors.black : Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SingleChildScrollView(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 160,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                color: Colors.white,
                              )),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.add,
                                  color: Colors.white,
                                ),
                              ),
                              UiHelper.customText(
                                text: "1",
                                color: const Color(0xffedb41d),
                                fontsize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.remove,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: 215,
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: const Color(0xffedb41d),
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: Colors.white,
                              width: 4,
                            ),
                          ),
                          child: Column(
                            children: [
                              UiHelper.customText(
                                text: "Total: Rs.${widget.moviePrice}",
                                fontsize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                              UiHelper.customText(
                                text: "Book Now",
                                fontsize: 26,
                                fontWeight: FontWeight.bold,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
