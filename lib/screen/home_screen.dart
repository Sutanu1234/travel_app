import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:travel_app/tab_indicator/popular_screen.dart';
import 'package:travel_app/tab_indicator/recomandation_screen.dart';

import '../tab_indicator/beaches_screen.dart';
import 'bottom_navigation.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final _pageController = PageController(viewportFraction: 0.877);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //bottomNavigationBar: BottomNavigation(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [

              // top nav icons container
              Container(
                height: 56,
                margin: EdgeInsets.only(top: 32, left: 24, right: 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 56,
                      width: 56,
                      //padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.black12.withOpacity(0.03),
                      ),
                      child: Icon(Icons.menu, size: 28, color: Colors.black45),
                    ),
                    Container(
                      height: 56,
                      width: 56,
                      //padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.black12.withOpacity(0.03),
                      ),
                      child: Icon(Icons.search, size: 28, color: Colors.black45),
                    ),
                  ],
                ),
              ),

              // nature latter
              Container(
                margin: EdgeInsets.only(top: 32),
                child: Text('Explore                \nthe Nature',
                style: GoogleFonts.playfairDisplay(
                  fontSize: 48,
                  fontWeight: FontWeight.w600,),
                ),
              ),

              // container for custom indicator
              Container(
                height: 32,
                margin: EdgeInsets.only(top: 32, left: 16),
                child: DefaultTabController(
                  length: 4,
                  child: TabBar(
                    labelPadding: EdgeInsets.only(left: 16, right: 16),
                  indicatorPadding: EdgeInsets.only(left: 16, right: 16),
                  isScrollable: true,
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.black38,
                  labelStyle: GoogleFonts.lato(
                    fontSize: 16,fontWeight: FontWeight.w600
                  ),
                    unselectedLabelStyle: GoogleFonts.lato(
                        fontSize: 16,fontWeight: FontWeight.w600
                    ),
                  tabs: [
                    Tab(child: Text('Recommended'),),
                    Tab(child: Text('Popular'),),
                    Tab(child: Text('New Destination'),),
                    Tab(child: Text('Hidden'),),
                  ],
                ),
                ),
              ),

              //recommendation section
              Container(
                height: 216,
                margin: EdgeInsets.only(top: 16),
                child: PageView(
                  physics: BouncingScrollPhysics(),
                  controller: _pageController,
                  scrollDirection: Axis.horizontal,
                  children: List.generate(
                      recommendations.length, (int index) => Container(
                    margin: EdgeInsets.only(right: 24),
                    height: 216,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(recommendations[index].image),
                      ),
                    ),

                    //name on the image
                    child: Stack(
                      children: [
                        Positioned(
                          bottom: 19.2,
                            left: 19.2,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(4),
                              child: BackdropFilter(
                                filter: ImageFilter.blur(
                                  sigmaY: 2 , sigmaX: 2
                                ),
                                child: Container(
                                  height: 48,
                                  padding: EdgeInsets.only(left: 16, right: 14),
                                  alignment: Alignment.centerLeft,
                                  child: Row(
                                    children: [
                                      Icon(Icons.location_on_outlined, color: Colors.white, size: 18),
                                      SizedBox(width: 8),
                                      Text(recommendations[index].name,
                                      style: GoogleFonts.lato(
                                        fontWeight: FontWeight.w700,
                                        color: Colors.white,
                                        fontSize: 16
                                      ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ))
                      ],
                    ),
                  )),
                ),
              ),

              // above image indicator
              Padding(padding: EdgeInsets.only(left: 28, top: 28),
              child: SmoothPageIndicator(
                controller: _pageController,
                count: recommendations.length,
                effect: ExpandingDotsEffect(
                  activeDotColor: Colors.blue,
                  dotColor: Colors.black26,
                  dotHeight: 4,
                  spacing: 8,
                  dotWidth: 12
                ),
              ),
              ),

              // popular categories

              Padding(padding: EdgeInsets.only(top: 48, left: 24, right: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("Popular Categories",
                  style: GoogleFonts.playfairDisplay(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87
                  ),
                  ),
                  Text("see all",
                    style: GoogleFonts.lato(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.black87
                    ),
                  ),
                ],
              ),
              ),

              // another popular section

              Container(
                margin: EdgeInsets.only(top: 32),
                height: 48,
                child: ListView.builder(
                  itemCount: populars.length,
                  scrollDirection: Axis.horizontal,
                  physics: BouncingScrollPhysics(),
                  padding: EdgeInsets.only(left: 24, right: 8),
                  itemBuilder: (context, index){
                    return Container(
                      margin: EdgeInsets.only(right: 16),
                      height: 48,
                      width: 156,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        //color: Color(populars[index].color),
                        color: Colors.orangeAccent.withOpacity(0.1),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(populars[index].image, scale: 0.82,),
                            SizedBox(width: 8),
                            Text(populars[index].name,
                            style: GoogleFonts.poppins(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Colors.black45
                            ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),

              // list view for beach section
              Container(
                margin: EdgeInsets.only(top: 32, bottom: 32),
                height: 124,
                child: ListView.builder(
                  itemCount: beaches.length,
                  padding: EdgeInsets.only(left: 24, right: 12 ),
                  scrollDirection: Axis.horizontal,
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context, index){
                    return Container(
                      height: 124,
                      width: 188,
                      margin: EdgeInsets.only(right: 16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(beaches[index].image),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      //bottomNavigationBar: NavigationScreen(),
    );
  }
}
