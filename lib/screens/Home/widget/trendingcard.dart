import 'package:flutter/material.dart';
import '../../../models/bookmodel.dart';

class Trendingcard extends StatelessWidget {
  final Book book;
  const Trendingcard({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    double rating = book.rating;
    int filledStars = rating.toInt();
    bool hasHalfStar = rating - filledStars >= 0.5;
    return Card(
      margin: EdgeInsets.all(8.0),
      child: ListTile(
        contentPadding: EdgeInsets.all(8.0),
        leading: Image.asset(
          book.imageUrl,
          width: 50, // Increased width
          height: 100, // Increased height
          fit: BoxFit.fill,
        ),
        title: Text(
          book.title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 4.0),
            Text(book.description),
            SizedBox(height: 8.0),
            Row(
              children: List.generate(
                filledStars,
                (index) => Icon(
                  Icons.star,
                  color: Colors.amber,
                  size: 12, // Adjust star size
                ),
              )..addAll([
                  if (hasHalfStar)
                    Icon(
                      Icons.star_half,
                      color: Colors.amber,
                      size: 12,
                    ),
                ]),
            ),
          ],
        ),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '\$${book.price.toStringAsFixed(2)}',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
