import 'package:flutter/material.dart';
import '../../../models/bookmodel.dart';
import '../../Detail/detail_screen.dart'; // Import your detail screen file

class BookSlider extends StatelessWidget {
  const BookSlider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return SizedBox(
      height: height * 0.28,
      child: ListView.builder(
        shrinkWrap: true,
        clipBehavior: Clip.hardEdge,
        scrollDirection: Axis.horizontal,
        itemCount: books.length, // Use the length of your book list
        itemBuilder: (BuildContext context, int index) {
          Book book = books[index];
          double rating = book.rating;
          int filledStars = rating.toInt();
          bool hasHalfStar = rating - filledStars >= 0.5;
          int totalStars = 5;

          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const DetailScreen(),
                ),
              );
            },
            child: Container(
              width: width * 0.28, // Adjust width here
              height: height * 0.2, // Adjust height here
              margin: const EdgeInsets.symmetric(
                horizontal: 8.0, // Add margin for spacing
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.all(0),
                    height: height * 0.18, // Adjust image height
                    width: width * 0.4, // Adjust image width
                    child: Image.asset(
                      book.imageUrl,
                      fit: BoxFit.fill,
                    ),
                  ),
                  const SizedBox(height: 8), // Add spacing
                  Text(
                    book.author,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontSize: 12),
                  ),
                  const SizedBox(height: 4), // Add spacing
                  Text(
                    book.title,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                  Row(
                    children: [
                      ...List.generate(
                        filledStars,
                        (index) => const Icon(
                          Icons.star,
                          color: Colors.amber,
                          size: 15, // Adjust star size
                        ),
                      ),
                      if (hasHalfStar)
                        const Icon(
                          Icons.star_half,
                          color: Colors.amber,
                          size: 15,
                        ),
                      ...List.generate(
                        totalStars - filledStars - (hasHalfStar ? 1 : 0),
                        (index) => const Icon(
                          Icons.star_border,
                          color: Colors.grey,
                          size: 15, // Adjust star size
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
