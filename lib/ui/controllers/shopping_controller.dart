import "package:f_shopping_app_r2_template/ui/pages/cambioName.dart";
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/parse_route.dart';
import 'package:loggy/loggy.dart';
import '../../domain/product.dart';

class ShoppingController extends GetxController {
  var user = "Double tap to enter user".obs;
  var locate = "Double tap to enter location".obs;
  var locate_sec = "".obs;

  var totti = 0.obs;
  var sum = 0.obs;
  // lista de productos
  final entries = <Product>[].obs;
  // el valor total de la compra

  get total => sum.value;

  @override
  void onInit() {
    super.onInit();
    // los dos elementos que vamos a tener en la tienda
    entries.add(Product(0, "Toy car", 10));
    entries.add(Product(1, "  Toy \nhouse", 20));
  }

  void calcularTotal() {
    sum.value = total;
    int newTotal = total;
    print("jasdjiasdasjd ${newTotal}");
  }

  agregarProducto(id) {
    logInfo('agregarProducto: $id');
    sum.value = sum.value + 1;
    calcularTotal();
  }

  quitarProducto(id) {
    logInfo('quitarProducto $sum $total');
    sum.value = sum.value - 1;
    if (sum < 0) {
      sum = 0.obs;
    }
    calcularTotal();
  }
}
