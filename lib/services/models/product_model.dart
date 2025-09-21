class ProductModel {
  final int id;
  final String name;
  final String url;
  final double price;
  final String description;

  ProductModel({
    required this.id,
    required this.name,
    required this.url,
    required this.price,
    required this.description,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
    id: json["id"],
    name: json["name"],
    price: json["price"]?.toDouble(),
    description: json["description"],
    url: json["url"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "price": price,
    "description": description,
    "url": url,
  };
}
