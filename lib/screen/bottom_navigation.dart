import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travel_app/screen/selectpage_screen.dart';

import '../landing_pages/notification_screen.dart';
import '../landing_pages/profile_screen.dart';
import 'home_screen.dart';
import 'package:travel_app/landing_pages/favorit_screen.dart';

// class BottomNavigation extends StatefulWidget {
//   const BottomNavigation({super.key});
//
//   @override
//   State<BottomNavigation> createState() => _BottomNavigationState();
// }
//
// class _BottomNavigationState extends State<BottomNavigation> {
//
//   int _selectedIndex = 0;
//
//   void _onItemTapped(int index){
//     setState(() {
//       _selectedIndex = index;
//     });
//   }
//
//   var bottomNavStyle = GoogleFonts.lato(
//       fontSize: 12,
//       fontWeight: FontWeight.w500
//   );
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 86,
//         decoration: BoxDecoration(
//           color: Colors.white,
//           boxShadow: [
//             BoxShadow(
//               color: Colors.grey.withOpacity(0.3),
//               spreadRadius: 2,
//               blurRadius: 15,
//               offset: Offset(0, 5)
//             ),
//           ]
//         ),
//       child: BottomNavigationBar(
//         items: <BottomNavigationBarItem>[
//           BottomNavigationBarItem(
//             icon: _selectedIndex == 0
//                 ? new Icon(Icons.home,color: Colors.black38)
//                 : new Icon(Icons.home,color: Colors.black),
//           ),
//           BottomNavigationBarItem(
//             icon: _selectedIndex == 1
//                 ? new Icon(Icons.heart_broken,color: Colors.black38)
//                 : new Icon(Icons.heart_broken,color: Colors.black),
//           ),
//           BottomNavigationBarItem(
//             icon: _selectedIndex == 2
//                 ? new Icon(Icons.notifications,color: Colors.black38)
//                 : new Icon(Icons.notifications,color: Colors.black),
//           ),
//           BottomNavigationBarItem(
//             icon: _selectedIndex == 3
//                 ? new Icon(Icons.supervised_user_circle,color: Colors.black38)
//                 : new Icon(Icons.supervised_user_circle,color: Colors.black),
//           ),
//         ],currentIndex: _selectedIndex,
//         onTap: _onItemTapped,
//         backgroundColor: Colors.transparent,
//         type: BottomNavigationBarType.fixed,
//         selectedFontSize: 12,
//         showSelectedLabels: true,
//         showUnselectedLabels: true,
//         elevation: 0,
//       ),
//     );
//   }
// }


class NavigationScreen extends StatefulWidget {
  const NavigationScreen({super.key});

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  int pageIndex = 0;

  List<Widget> pages = [
    HomeScreen(),
    NotificationScreen(),
    FavoritScreen(),
    ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: pageIndex,
        children: pages,
      ),
      floatingActionButton: SafeArea(
        child: FloatingActionButton(
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => SelectedPageScreen(),));
          },
          child: Icon(Icons.qr_code,size: 20,),
          backgroundColor: Color(0xFFEF6969),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
        icons: [
          CupertinoIcons.home,
          CupertinoIcons.bell,
          CupertinoIcons.heart,
          CupertinoIcons.profile_circled,
        ],
        inactiveColor: Colors.black.withOpacity(0.5),
        activeColor: Color(0xFFEF6969),
        gapLocation: GapLocation.center,
        activeIndex: pageIndex,
        notchSmoothness: NotchSmoothness.softEdge,
        leftCornerRadius: 10,
        elevation: 0,
        onTap: (index){
          setState(() {
            pageIndex = index;
          });
        },
      ),
    );
  }
}

