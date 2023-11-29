class Products {
  late int id;
  // late int supplierId;
  // late int unitPrice;
  late String productName,supplierId,unitPrice;

  Products({
    required this.id,
    required this.supplierId,
    required this.productName,
    required this.unitPrice,
  });

  factory Products.fromJson(Map<String, dynamic> json) {
    return Products(
      id: json['id']??0,
      supplierId: json['SupplierId']??'',
      productName: json['ProductName']??'',
      unitPrice: json['UnitPrice']??'',
    );
  }
}
