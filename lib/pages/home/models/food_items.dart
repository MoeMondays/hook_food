class FoodItems {
  final int id;
  final String name;
  final double price;
  final String image;

  FoodItems({
    required this.id,
    required this.name,
    required this.price,
    required this.image,
  });

  @override
  String toString() {
    return 'id: $id, name: $name, price: $price';
  }
}
