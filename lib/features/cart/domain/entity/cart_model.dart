// ignore_for_file: public_member_api_docs, sort_constructors_first
class CartDataModel {
  String id; // New field for book ID
  String imageUrl;
  String title;
  double price;
  int quantity;
  CartDataModel({
    required this.id,
    required this.imageUrl,
    required this.title,
    required this.price,
    required this.quantity,
  });
}
