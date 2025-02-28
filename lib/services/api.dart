import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:collection/collection.dart';
import 'package:lingerie_store_project/models/product_model.dart';

// Future<List<ProductModel>> fetchProducts() async {
Future<List<ProductModel>> fetchProducts() async {
  final response =
      // await http.get(Uri.parse('http://192.168.1.3:8080/products'));
      await http.get(Uri.parse('http://localhost:8080/products'));

  if (response.statusCode == 200) {
    final List<dynamic> data = jsonDecode(response.body);

    return data.map((row) {
      return ProductModel(
          productName: row["nombre"] ?? "No name",
          productImagePath: row["enlaceImagen"] ?? "",
          shortDescription: row["descripcion"] ?? "No description",
          price: row["precio"] is int
              ? row["precio"]
              : int.tryParse(row["precio"].toString()) ?? 0,
          size: row["talla"] ?? "N/A",
          discount: row["descuento"] is int
              ? row["descuento"]
              : int.tryParse(row["descuento"].toString()) ?? 0,
          availableUnits: row["unidadesDisponibles"] is int
              ? row["unidadesDisponibles"]
              : int.tryParse(row["unidadesDisponibles"].toString()) ?? 0);
    }).toList();
  } else {
    throw Exception("Failed to fetch products");
  }
}

Future<Map<String, List<ProductModel>>> fetchAndGroupProductsByName() async {
  final response = await http.get(Uri.parse('http://localhost:8080/products'));

  if (response.statusCode == 200) {
    final List<dynamic> data = jsonDecode(response.body);

    // Parse the JSON data into a list of ProductModel instances
    final products = data.map((row) {
      return ProductModel(
        productName: row["nombre"] ?? "No name",
        productImagePath: row["enlaceImagen"] ?? "",
        shortDescription: row["descripcion"] ?? "No description",
        price: row["precio"] is int
            ? row["precio"]
            : int.tryParse(row["precio"].toString()) ?? 0,
        size: row["talla"] ?? "N/A",
        discount: row["descuento"] is int
            ? row["descuento"]
            : int.tryParse(row["descuento"].toString()) ?? 0,
        availableUnits: row["unidadesDisponibles"] is int
            ? row["unidadesDisponibles"]
            : int.tryParse(row["unidadesDisponibles"].toString()) ?? 0,
      );
    }).toList();

    // Group products by name using the groupBy function
    final groupedByName =
        groupBy(products, (ProductModel product) => product.productName);

    return groupedByName;
  } else {
    throw Exception("Failed to fetch products");
  }
}
