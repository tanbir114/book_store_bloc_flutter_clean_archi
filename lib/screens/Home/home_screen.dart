import 'package:flutter/material.dart';
import 'widget/trendingcard.dart';
import 'widget/trendingslider.dart';
import 'widget/book_slider.dart';
import 'widget/image_slider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentSlider = 0;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('Discover',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
        actions: <Widget>[
          Container(
            margin: EdgeInsets.only(right: width * .03),
            height: height * .05,
            width: width * .1,
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(8),
            ),
            child: IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {},
              color: Colors.white,
            ),
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: width * .05, right: width * .05),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: height * 0.03),
              ImageSlider(
                currentSlide: currentSlider,
                onChange: (value) {
                  setState(() {
                    currentSlider = value;
                  });
                },
              ),
              SizedBox(height: height * 0.03),
              const Text('Best Seller',
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20)),
              SizedBox(height: height * 0.01),
              const BookSlider(),
              SizedBox(height: height * 0.03),
              const Text('Trending',
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20)),
              SizedBox(height: height * 0.01),
              const Trendingslider(),
            ],
          ),
        ),
      ),
    );
  }
}
