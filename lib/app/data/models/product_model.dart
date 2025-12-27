class ProductModel {
  final int id;
  final String name;
  final String image;
  final double price;
  final int quantity;

  ProductModel({
    required this.id,
    required this.name,
    required this.image,
    required this.price,
    required this.quantity,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      name: json['name'],
      image: json['image'],
      price: double.parse(json['price'].toString()),
      quantity: json['quantity'],
    );
  }
}
