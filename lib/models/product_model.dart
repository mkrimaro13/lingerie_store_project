// DTO para el intercambio de información con fuentes externas
class ProductModel {
  final int reference;
  final String productName;
  final String productImagePath;
  final int price;
  final Map<String, int> sizesAndAvailability;
  final int discount;

  ProductModel({
    required this.reference,
    required this.productImagePath,
    required this.productName,
    required this.price,
    required this.sizesAndAvailability,
    required this.discount,
  });
}
