import 'package:get/get.dart';

class Product {
  int id;
  String name;
  int price;
  var quantity = 0.obs;

  Product(this.id, this.name, this.price);
}
