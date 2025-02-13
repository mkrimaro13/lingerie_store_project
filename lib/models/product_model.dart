import 'package:lingerie_store_project/api/api.dart';

class ProductModel {
  final String productImagePath;
  final String productName;
  final String shortDescription;
  final int price;
  final String size;
  final int discount;

  ProductModel({
    required this.productImagePath,
    required this.productName,
    required this.shortDescription,
    required this.price,
    required this.size,
    required this.discount,
  });

  @override
  String toString() {
    return 'ProductModel(productImagePath: $productImagePath, productName: $productName, shortDescription: $shortDescription, price: $price, size: $size, discount: $discount%)';
  }
}


// List<ProductModel> products = [
//   ProductModel(
//       'https://images.unsplash.com/photo-1574539602047-548bf9557352?q=80&w=1965&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
//       'Aptenia',
//       'Soft and Comfy',
//       500),
//   ProductModel(
//       'https://images.unsplash.com/photo-1568663521381-33b7c467fda0?q=80&w=1922&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
//       'Welsh Mudwort',
//       'Soft and Comfy',
//       500),
//   ProductModel(
//       'https://plus.unsplash.com/premium_photo-1661629259850-9a893425f1f5?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
//       'Shrubby Thoroughwort',
//       'Soft and Comfy',
//       500),
//   ProductModel(
//       'https://images.unsplash.com/photo-1625023489823-c9c1e36d6f2b?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
//       'Tree Shield Lichen',
//       'Soft and Comfy',
//       500),
//   ProductModel(
//       'https://images.unsplash.com/photo-1584061634739-88035e420618?q=80&w=1935&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
//       'Marsh Parsley',
//       'Soft and Comfy',
//       500),
//   ProductModel(
//       'https://plus.unsplash.com/premium_photo-1675186049574-061fba2d243c?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
//       'Fragile Pinkfringe',
//       'Soft and Comfy',
//       500),
//   ProductModel(
//       'https://images.unsplash.com/photo-1628519555279-3eada894828b?q=80&w=1964&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
//       'Meesia Moss',
//       'Soft and Comfy',
//       500),
//   ProductModel(
//       'https://images.unsplash.com/photo-1590397041404-a0cfb285a2a6?q=80&w=1965&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
//       "Lady's Nightcap",
//       'Soft and Comfy',
//       500),
//   ProductModel(
//       'https://plus.unsplash.com/premium_photo-1683140483126-822729be146e?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
//       'Graceful Hawthorn',
//       'Soft and Comfy',
//       500),
//   ProductModel(
//       'https://images.unsplash.com/photo-1575186083127-03641b958f61?q=80&w=1965&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
//       'Yellow Milkvetch',
//       'Soft and Comfy',
//       500),
//   ProductModel(
//       'https://images.unsplash.com/photo-1599544593314-090522e0c29d?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
//       'Calymperes Moss',
//       'Soft and Comfy',
//       500),
//   ProductModel(
//       'https://images.unsplash.com/photo-1572358764342-612d02e2d2d2?q=80&w=1980&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
//       'Sedgeleaf Buckbrush',
//       'Soft and Comfy',
//       500),
// ];
