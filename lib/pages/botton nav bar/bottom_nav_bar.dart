import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:movie_booking_app/pages/booking/booking_screen.dart';
import 'package:movie_booking_app/pages/home/home_screen.dart';
import 'package:movie_booking_app/pages/profile/profile_screen.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int selectedIndex = 0; // Tracks the selected index for the bottom navigation.
  
  // List of pages to display based on the selected index.
  final List<Widget> pages = const [
    HomeScreen(),    // Home page
    BookingScreen(), // Booking page
    ProfileScreen()  // Profile page
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Using IndexedStack to manage different screens based on the selected index.
      body: IndexedStack(
        index: selectedIndex,
        children: pages, // Pages corresponding to the bottom nav items.
      ),
      
      // Curved bottom navigation bar with three items: Home, Booking, and Profile.
      bottomNavigationBar: CurvedNavigationBar(
        index: selectedIndex, // Highlights the selected navigation item.
        color: const Color(0xffedb41d), // Gold color for the nav bar.
        backgroundColor: Colors.black, // Background color for the nav bar.
        buttonBackgroundColor: const Color(0xffedb41d), // Button background color.
        
        // Navigation items with respective icons.
        items: const [
          Icon(Icons.home, size: 30, color: Colors.white), // Home icon
          Icon(Icons.book, size: 30, color: Colors.white), // Booking icon
          Icon(Icons.person, size: 30, color: Colors.white), // Profile icon
        ],
        
        // Function called when a navigation item is tapped.
        onTap: (index) {
          setState(() {
            selectedIndex = index; // Update selected index and change screen.
          });
        },
      ),
    );
  }
}
