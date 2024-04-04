class CoffeeShop {
  final String name;
  final String description;
  final List<Product> products;

  CoffeeShop({
    this.name = '',
    this.description = '',
    this.products = const [],
  });

  CoffeeShop copyWith({
    String? name,
    String? description,
    List<Product>? products,
  }) {
    return CoffeeShop(
      name: name ?? this.name,
      description: description ?? this.description,
      products: products ?? this.products,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'description': description,
      'products': products.map((product) => product.toJson()).toList(),
    };
  }

  factory CoffeeShop.fromJson(Map<String, dynamic> json) {
    return CoffeeShop(
      name: json['name'],
      description: json['description'],
      products: (json['products'] as List<dynamic>)
          .map((productJson) => Product.fromJson(productJson))
          .toList(),
    );
  }
  double calculateIncome() {
    double totalIncome = 0.0;
    for (Product product in products) {
      totalIncome += product.price;
    }
    return totalIncome;
  }

  static double calculateTotalIncome(List<CoffeeShop> coffeeShops) {
    double totalIncome = 0.0;
    for (CoffeeShop shop in coffeeShops) {
      totalIncome += shop.calculateIncome();
    }
    return totalIncome;
  }
}

class Product {
  final String name;
  final double price;
  final String consumption;
  final ConsumptionPeriod consumptionPeriod;

  Product({
    required this.name,
    required this.price,
    required this.consumption,
    required this.consumptionPeriod,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'price': price,
      'consumption': consumption,
      'consumptionPeriod': consumptionPeriod.name,
    };
  }

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      name: json['name'],
      price: json['price'],
      consumption: json['consumption'],
      consumptionPeriod:
          ConsumptionPeriod.values.byName(json['consumptionPeriod']),
    );
  }
}

enum ConsumptionPeriod { weekly, monthly }
