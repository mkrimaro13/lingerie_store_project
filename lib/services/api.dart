import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:lingerie_store_project/models/product_model.dart';

Future<List<ProductModel>> fetchProducts() async {
  final uri = Uri.parse('http://localhost:8080/products/grouped');

  try {
    final response = await http.get(uri);

    log("Status Code: ${response.statusCode}");
    log("Response Body: ${response.body}");

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);

      return data.map((row) {
        return ProductModel(
          reference: row["id"] ?? 0,
          productName: row["productName"] ?? "No name",
          productImagePath: row["productImagePath"] ?? "",
          price: row["price"] is int
              ? row["price"]
              : int.tryParse(row["price"].toString()) ?? 0,
          sizesAndAvailability:
              (row["sizesAndAvailability"] as Map<String, dynamic>?)?.map(
                    (key, value) => MapEntry(key, value as int),
                  ) ??
                  {},
          discount: row["discount"] is int
              ? row["discount"]
              : int.tryParse(row["discount"].toString()) ?? 0,
        );
      }).toList();
    } else {
      throw Exception("Failed to fetch products: ${response.statusCode}");
    }
  } catch (e) {
    log("Error fetching products: $e");
    throw Exception("Failed to fetch products: $e");
  }
}
