class Book {
  String id; // New field for book ID
  String imageUrl;
  String title;
  String author;
  String description; // Field for book description
  double rating;
  double price; // Field for book price

  Book({
    required this.id,
    required this.imageUrl,
    required this.title,
    required this.author,
    required this.description,
    required this.rating,
    required this.price,
  });
}

final List<Map<String, dynamic>> books = [
  {
    'id': '1',
    'imageUrl': 'assets/images/books/Fatherhood.png',
    'title': 'FatherHood',
    'author': 'Marcus Berkmann',
    'description': 'A touching exploration of what it means to be a father.',
    'rating': 4.2,
    'price': 10.99,
  },
  {
    'id': '2',
    'imageUrl': 'assets/images/books/How To Be The Best In Time And Space.png',
    'title': 'The Time Travellers',
    'author': 'Stride Lottie',
    'description': 'A thrilling journey through time and space.',
    'rating': 3.8,
    'price': 12.99,
  },
  {
    'id': '3',
    'imageUrl': 'assets/images/books/The Zoo.png',
    'title': 'The Zoo',
    'author': 'Christopher Wilson',
    'description': 'An intriguing tale set in a zoo with unexpected events.',
    'rating': 4.5,
    'price': 15.99,
  },
  {
    'id': '4',
    'imageUrl': 'assets/images/books/In A Land Of Paper Gods.png',
    'title': 'In A Land Of Paper Gods',
    'author': 'Rebecca Mackenzie',
    'description': 'A story set in a mystical land of paper gods.',
    'rating': 4.0,
    'price': 14.99,
  },
  {
    'id': '5',
    'imageUrl': 'assets/images/books/Tattletale.png',
    'title': 'Tattletale',
    'author': 'Sarah J.',
    'description':
        'A gripping mystery that keeps you on the edge of your seat.',
    'rating': 4.7,
    'price': 13.99,
  },
  {
    'id': '6',
    'imageUrl': 'assets/images/books/The Fatal Tree.png',
    'title': 'The Fatal Tree',
    'author': 'Jake Amott',
    'description': 'A dark and thrilling tale of crime and punishment.',
    'rating': 4.3,
    'price': 11.99,
  },
  {
    'id': '7',
    'imageUrl': 'assets/images/books/Day Four.png',
    'title': 'Day Four',
    'author': 'Sarah',
    'description': 'A suspenseful story that unravels over four days.',
    'rating': 4.1,
    'price': 9.99,
  },
  {
    'id': '8',
    'imageUrl': 'assets/images/books/D2D.png',
    'title': 'Door To Door',
    'author': 'Edward Humes',
    'description': 'An insightful look into the world of sales and marketing.',
    'rating': 4.8,
    'price': 16.99,
  },
];
