import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:lingerie_store_project/models/product_model.dart';

// Future<List<ProductModel>> fetchProducts() async {
Future<List<ProductModel>> fetchProducts() async {
  final response =
      await http.get(Uri.parse('http://192.168.1.3:8080/products'));

  if (response.statusCode == 200) {
    final List<dynamic> data = jsonDecode(response.body);

    return data.map((row) {
      return ProductModel(
        productImagePath: row["enlaceImagen"] ?? "", // Ensure a default value
        productName: row["nombre"] ?? "No name",
        shortDescription: row["descripcion"] ?? "No description",
        price: row["precio"] is int
            ? row["precio"]
            : int.tryParse(row["precio"].toString()) ?? 0,
        size: row["talla"] ?? "N/A",
        discount: row["descuento"] is int
            ? row["descuento"]
            : int.tryParse(row["descuento"].toString()) ?? 0,
      );
    }).toList();
  } else {
    throw Exception("Failed to fetch products");
  }
}
