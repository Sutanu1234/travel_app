import 'package:flutter/material.dart';

class SelectedPageScreen extends StatelessWidget {
  // const SelectedPageScreen({super.key});

  final _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          color: Colors.black87,
          image: DecorationImage(
            image: AssetImage("assets/n4.jpeg"),
            fit: BoxFit.cover,
            opacity: 1,
          ),
        ),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 32, left: 24, right: 24),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 56,
                        width: 56,
                        //padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.black12.withOpacity(0.1),
                        ),
                        child: Icon(Icons.arrow_back_ios_new_outlined,
                            size: 28, color: Colors.white),
                      ),
                      Container(
                        height: 56,
                        width: 56,
                        //padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.black12.withOpacity(0.1),
                        ),
                        child: Icon(Icons.favorite_outline,
                            size: 28, color: Colors.white),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Container(
                      height: 56,
                      width: 56,
                      //padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.black12.withOpacity(0.1),
                      ),
                      child: Icon(Icons.share_outlined,
                          size: 28, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
