class Orders {
  late int id;
  late String orderDate;
  late String orderNumber;
  late String customerId;
  late String totalAmount;
  late Customer customer;

  Orders({
    required this.id,
    required this.orderDate,
    required this.orderNumber,
    required this.customerId,
    required this.totalAmount,
    required this.customer,
  });

  factory Orders.fromJson(Map<String, dynamic> json) {
    return Orders(
      id: json['id'] ?? 0,
      orderDate: json['OrderDate'] ?? '',
      orderNumber: json['OrderNumber'] ?? '',
      customerId: json['CustomerId'] ?? '',
      totalAmount: json['TotalAmount'] ?? '',
      customer: Customer.fromJson(json['customer'] ?? {}),
    );
  }
}

class Customer {
  late int id;
  late String firstName;
  late String lastName;
  late String city;
  late String country;
  late String phone;

  Customer({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.city,
    required this.country,
    required this.phone,
  });

  factory Customer.fromJson(Map<String, dynamic> json) {
    return Customer(
      id: json['id'] ?? 0,
      firstName: json['FirstName'] ?? '',
      lastName: json['LastName'] ?? '',
      city: json['City'] ?? '',
      country: json['Country'] ?? '',
      phone: json['Phone'] ?? '',
    );
  }
}
