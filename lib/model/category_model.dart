class Category {
  final String title;
  final String image;

  Category({
    required this.title,
    required this.image,
  });
}

final List<Category> categories = [
  Category(title: 'Shoes', image: 'shoes.jpg'),
  Category(title: 'Shirts', image: 'shirt.png'),
  Category(title: 'Belts', image: 'belt.jpg'),
  Category(title: 'Laptop', image: 'laptop.jpg'),
  Category(title: 'watches', image: 'watch.jpg'),
  Category(title: 'Makeup', image: 'makeup.jpg'),
  Category(title: 'Grocery', image: 'grocery.jpg'),
];
