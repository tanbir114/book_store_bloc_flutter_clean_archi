// ignore_for_file: public_member_api_docs, sort_constructors_first
class BookDataModel {
  String id; // New field for book ID
  String imageUrl;
  String title;
  String author;
  String description; // Field for book description
  double rating;
  double price;

  BookDataModel({
    required this.id,
    required this.imageUrl,
    required this.title,
    required this.author,
    required this.description,
    required this.rating,
    required this.price,
  });
}
