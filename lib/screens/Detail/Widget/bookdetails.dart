import 'package:book_shop_ui/screens/Detail/Widget/detailcolumn.dart';
import 'package:flutter/material.dart';

class BookDetails extends StatelessWidget {
  const BookDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(8),
          // boxShadow: const [
          //   BoxShadow(
          //     color: Colors.black12,
          //     blurRadius: 10,
          //     offset: Offset(0, 5),
          //   ),
          // ],
        ),
        padding: const EdgeInsets.all(16.0),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            DetailColumn(
              label: 'Rating',
              value: '4.5',
            ),
            DetailColumn(
              label: 'Pages',
              value: '289',
            ),
            DetailColumn(
              label: 'Cover',
              value: 'Hard',
            ),
            DetailColumn(
              label: 'Language',
              value: 'English',
            ),
          ],
        ),
      ),
    );
  }
}
