// DTO para el intercambio de información con fuentes externas
class ProductModel {
  final String productName;
  final String productImagePath;
  final String shortDescription;
  final int price;
  final String size;
  final int discount;
  final int availableUnits;

  ProductModel(
      {required this.productImagePath,
      required this.productName,
      required this.shortDescription,
      required this.price,
      required this.size,
      required this.discount,
      required this.availableUnits});
}
