import 'package:flutter_credit_card_ui/models/Product.dart';

class ProductsRepository{

  List<Product>  fetchAllProducts() {

    return [
      new Product("assets/images/Bauchfleisch gewürzt.jpg", "Bauchfleisch gewürzt", 2.99, 250, 0),
      new Product("assets/images/Fleischspie.jpg", "Fleischspie", 2.35, 500, 1),
      new Product("assets/images/Kachelfleisch gewürzt.jpg", "Kachelfleisch gewürzt", 2.35, 500, 2),
      new Product("assets/images/Nackenkotlett gewürzt.jpg", "Nackenkotlett gewürzt", 1.99, 250, 3),
      new Product("assets/images/Rostbratwurst.jpg", "Rostbratwurst", 2.35, 500, 4),
      new Product("assets/images/Thüringer Rostbratwurst.jpg", "Thüringer Rostbratwurst", 1.99, 250, 5),
      new Product("assets/images/Zwiebeltasche.jpg", "Zwiebeltasche", 1.99, 250, 6),
    ];
  }
  
}