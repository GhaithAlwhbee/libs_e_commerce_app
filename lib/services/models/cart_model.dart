class CartModel {
  final String productId;
  final Map<String, dynamic> productData;
  int quntity;
  CartModel({
    required this.productId,
    required this.productData,
    required this.quntity,
  });
}
