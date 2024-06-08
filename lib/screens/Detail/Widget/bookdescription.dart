import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class BookDescription extends StatefulWidget {
  const BookDescription({Key? key}) : super(key: key);

  @override
  _BookDescriptionState createState() => _BookDescriptionState();
}

class _BookDescriptionState extends State<BookDescription> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Description',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          SizedBox(height: 10),
          RichText(
            text: TextSpan(
              text: isExpanded
                  ? 'Hooked unlocks consumer psychologies and reveals the "Hook Model" - a four-step process to build habits that stickkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk. '
                  : 'Hooked unlocks consumer psychologies and reveals the "Hook Model" - a four-step process to build habits that stick. ',
              style: TextStyle(
                color: Colors.grey,
              ),
              children: [
                if (!isExpanded)
                  TextSpan(
                    text: 'Read More',
                    style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        setState(() {
                          isExpanded = true;
                        });
                      },
                  ),
              ],
            ),
          ),
          if (isExpanded)
            InkWell(
              onTap: () {
                setState(() {
                  isExpanded = false;
                });
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                child: Text(
                  'Read Less',
                  style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
