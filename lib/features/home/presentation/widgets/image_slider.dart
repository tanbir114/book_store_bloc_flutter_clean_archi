import 'package:flutter/material.dart';

class ImageSlider extends StatelessWidget {
  final Function(int) onChange;
  final int currentSlide;
  const ImageSlider({
    Key? key,
    required this.currentSlide,
    required this.onChange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Stack(
      children: [
        Column(
          children: [
            Container(
              height:
                  screenWidth * 0.5, // Set height as a fraction of screen width
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(.7), // Shadow color
                    spreadRadius: -20, // Spread radius
                    blurRadius: 30, // Blur radius
                    offset: Offset(0, 26), // Offset in x and y directions
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: PageView(
                  scrollDirection: Axis.horizontal,
                  allowImplicitScrolling: true,
                  onPageChanged: onChange,
                  physics: const ClampingScrollPhysics(),
                  children: [
                    Image.asset(
                      "assets/images/slider_images/slide1.png",
                      fit: BoxFit.fill,
                    ),
                    Image.asset(
                      "assets/images/slider_images/slide2.png",
                      fit: BoxFit.fill,
                    ),
                    Image.asset(
                      "assets/images/slider_images/slide3.png",
                      fit: BoxFit.cover,
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: screenWidth * 0.05),
            SizedBox(height: screenWidth * 0.05),
          ],
        ),
        Positioned.fill(
          bottom: 0,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                3,
                (index) => AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  width: currentSlide == index ? 25 : 8,
                  height: 8,
                  margin: const EdgeInsets.only(right: 3),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: currentSlide == index ? Colors.blue : Colors.grey,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
