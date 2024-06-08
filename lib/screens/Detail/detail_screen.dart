import 'package:flutter/material.dart';
import 'Widget/bookdescription.dart';
import 'Widget/bookdetails.dart';
import 'Widget/customDivider.dart';
import 'Widget/tabbarsection.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 221, 225, 228),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(8),
                child: SizedBox(
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(Icons.close), // Replace with cross icon
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              Column(
                children: [
                  Stack(
                    clipBehavior: Clip.none,
                    alignment: Alignment.topCenter,
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: height * 0.1),
                        width: width,
                        constraints: BoxConstraints(
                          minWidth: width,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 10,
                              offset: Offset(0, 5),
                            ),
                          ],
                        ),
                        child: Container(
                          margin: EdgeInsets.only(top: height * .1),
                          child: Column(
                            children: [
                              SizedBox(height: 35),
                              Text(
                                'Edward Humes',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Text(
                                'Door To Door',
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                              SizedBox(height: 10),
                              customDivider(width: width * 0.8),
                              SizedBox(height: 10),
                              TabBarSection(),
                              SizedBox(height: 10),
                              BookDetails(),
                              SizedBox(height: 10),
                              BookDescription(),
                              SizedBox(height: 15),
                              ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.blue,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 100, vertical: 15),
                                  textStyle: const TextStyle(
                                      fontSize: 16, color: Colors.white),
                                ),
                                child: const Text('Buy Now'),
                              ),
                              const SizedBox(height: 25),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        top: -height * 0.075,
                        child: Container(
                          height: height * 0.35,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black12
                                    .withOpacity(.4), // Shadow color
                                spreadRadius: -40, // Spread radius
                                blurRadius: 10, // Blur radius
                                offset: Offset(
                                    0, 10), // Offset in x and y directions
                              ),
                            ],
                          ),
                          child: Image.asset(
                            'assets/images/books/Tattletale.png', // Replace with your image URL or asset
                            height: 150,
                          ),
                        ),
                      ),
                      SizedBox(height: 8)
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
