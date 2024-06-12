// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Trendingcard extends StatelessWidget {
  Map<String, dynamic> book;
  Trendingcard({
    super.key,
    required this.book,
  });

  @override
  Widget build(BuildContext context) {
    double rating = book['rating'];
    int filledStars = rating.toInt();
    bool hasHalfStar = rating - filledStars >= 0.5;
    int totalStars = 5;

    return Card(
      margin: const EdgeInsets.all(8.0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border:
                    Border.all(color: Colors.white, width: 3.5), // White border
                borderRadius: BorderRadius.circular(12.0), // Circular corners
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    spreadRadius: 2,
                    blurRadius: 2,
                    // offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12.0), // Circular corners
                child: Image.asset(
                  book['imageUrl'],
                  width: 70, // Increased width
                  height: 100, // Increased height
                  fit: BoxFit.contain,
                ),
              ),
            ),
            const SizedBox(
                width: 16.0), // Add some spacing between the image and text
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    book['title'],
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4.0),
                  Text(
                    book['description'],
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 8.0),
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
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  '\$${book['price'].toStringAsFixed(2)}',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Color.fromARGB(255, 7, 134, 81),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
