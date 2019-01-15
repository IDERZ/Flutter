class Product {
  String code;
  String name;

  static Product fromJson(Map<String, dynamic> mapping) {
    if (mapping == null || mapping.isEmpty) {
      return null;
    }

    Product product = new Product();
    product.code = mapping['productCode'];
    product.name = mapping['productName'];

    return product;
  }

  String toString() {
    return code + " - " + name;
  }
}