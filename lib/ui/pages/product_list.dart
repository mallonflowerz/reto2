import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../domain/product.dart';
import '../Widgets/banner.dart';
import '../controllers/shopping_controller.dart';

class ProductList extends StatefulWidget {
  const ProductList({Key? key}) : super(key: key);

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  ShoppingController shoppingController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Stack(
              children: [const CustomBanner(50), customAppBar()],
            ),
            Obx((() => Expanded(
                  child: ListView.builder(
                      padding: const EdgeInsets.all(8),
                      itemCount: shoppingController.entries.length,
                      itemBuilder: (context, int index) {
                        return _row(shoppingController.entries[index], index);
                      }),
                ))),
          ],
        ),
      ),
    );
  }

  Widget customAppBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: () => Get.back(),
            child: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          ),
        )
      ],
    );
  }

  Widget _row(Product product, int index) {
    return _card(product);
  }

  Widget _card(Product product) {
    return Card(
      margin: const EdgeInsets.all(4.0),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        Text(product.name),
        Text("Price:\n  ${product.price.toString()}"),
        Column(
          children: [
            IconButton(
                onPressed: () {
                  shoppingController.agregarProducto(product.id);
                  if (product.price == 10) {
                    product.id = 0;
                    product.quantity = product.quantity + 1;
                    shoppingController.totti.value += product.price;
                  } else if (product.price == 20) {
                    product.id = 1;
                    product.quantity = product.quantity + 1;
                    shoppingController.totti.value += product.price;
                  }
                },
                icon: const Icon(Icons.add_circle)),
            IconButton(
                onPressed: () {
                  shoppingController.quitarProducto(product.id);
                  if (product.price == 10) {
                    product.quantity = product.quantity - 1;
                    shoppingController.totti.value -= product.price;
                    if (product.quantity < 0) {
                      product.quantity.value = 0;
                      shoppingController.totti.value = 0;
                    }
                  } else if (product.price == 20) {
                    product.quantity = product.quantity - 1;
                    shoppingController.totti.value -= product.price;
                    if (product.quantity < 0) {
                      product.quantity.value = 0;
                      shoppingController.totti.value = 0;
                    }
                  }
                },
                icon: const Icon(Icons.remove_circle))
          ],
        ),
        Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text("Quantity"),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Obx(() => Text(product.quantity.toString())),
            ),
          ],
        )
      ]),
    );
  }
}
