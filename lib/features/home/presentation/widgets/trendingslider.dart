import 'package:flutter/material.dart';
import '../../../../models/bookmodel.dart';
import 'trendingcard.dart';

class Trendingslider extends StatelessWidget {
  const Trendingslider({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: books.length,
      itemBuilder: (context, index) {
        Map<String, dynamic> book = books[index];
        return Trendingcard(book: book);
      },
    );
  }
}
