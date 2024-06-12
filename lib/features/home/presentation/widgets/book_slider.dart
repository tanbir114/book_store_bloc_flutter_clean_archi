// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:book_shop_ui/features/cart/domain/entity/cart_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../screens/Detail/detail_screen.dart';
import '../../domain/entity/home_product_data.dart';
import '../bloc/home_bloc.dart'; // Import your detail screen file

class BookSlider extends StatefulWidget {
  final List<BookDataModel> bookDataModel;
  final HomeBloc homeBloc;

  const BookSlider({
    super.key,
    required this.bookDataModel,
    required this.homeBloc,
  });

  @override
  State<BookSlider> createState() => _BookSliderState();
}

class _BookSliderState extends State<BookSlider> {
  // @override
  // void initState() {
  //   widget.homeBloc.add(HomeInitialEvent());
  //   super.initState();
  // }

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
        itemCount:
            widget.bookDataModel.length, // Use the length of your book list
        itemBuilder: (BuildContext context, int index) {
          BookDataModel book = widget.bookDataModel[index];
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
                  Stack(
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
                      Align(
                        alignment: Alignment.topRight,
                        child: InkWell(
                          onTap: () {
                            // context.read<CartBloc>().add(AddToCart(book));
                            widget.homeBloc
                                .add(HomeProductCartButtonClickedEvent(
                              clickedBook: CartDataModel(
                                id: book.id,
                                title: book.title,
                                imageUrl: book.imageUrl,
                                price: book.price,
                                quantity: 1,
                              ),
                            ));
                            print("Cart icon tapped!");
                          },
                          child: Container(
                            margin: const EdgeInsets.all(0),
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Colors.green,
                              shape: BoxShape.rectangle,
                              borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(
                                    8), // Radius to make the left bottom corner rounded
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.3),
                                  spreadRadius: 2,
                                  blurRadius: 5,
                                  offset: const Offset(
                                      2, 3), // changes position of shadow
                                ),
                              ],
                            ),
                            child: const Icon(
                              Icons.shopping_cart,
                              color: Colors.white,
                              size: 16,
                            ),
                          ),
                        ),
                      ),
                    ],
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
