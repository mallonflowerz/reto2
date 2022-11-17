import 'package:f_shopping_app_r2_template/ui/pages/cambioName.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Widgets/banner.dart';
import '../Widgets/cart_total.dart';
import 'product_list.dart';
import "package:f_shopping_app_r2_template/ui/controllers/shopping_controller.dart";

ShoppingController shoppingController = ShoppingController();

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(children: [
      Stack(
        children: [buildProfileImage(), customAppBar()],
      ),
      const SizedBox(
        height: 60,
      ),
      GestureDetector(
        onDoubleTap: () => Get.to(() => cambioName(),
            transition: Transition.leftToRight,
            duration: Duration(milliseconds: 500)),
        child: Obx((() => Text(("${shoppingController.user.value}"),
            style: const TextStyle(
                fontSize: 25.0,
                color: Colors.blueGrey,
                letterSpacing: 2.0,
                fontWeight: FontWeight.w400)))),
      ),
      const SizedBox(
        height: 20,
      ),
      GestureDetector(
        onDoubleTap: () => Get.to(() => cambioName(),
            transition: Transition.leftToRight,
            duration: Duration(milliseconds: 500)),
        child: Obx(
          () => Text("${shoppingController.locate.value}",
              style: const TextStyle(
                  fontSize: 18.0,
                  color: Colors.black45,
                  letterSpacing: 2.0,
                  fontWeight: FontWeight.w300)),
        ),
      ),
      CartTotal()
    ]));
  }

  Widget buildProfileImage() {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: const [
        CustomBanner(200),
        CircleAvatar(
          radius: 60.0,
        )
      ],
    );
  }

  Widget customAppBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: () => Get.to(() => ProductList(),
                transition: Transition.cupertino,
                duration: const Duration(seconds: 1)),
            child: const Icon(
              Icons.shopping_cart,
              size: 30,
              color: Color.fromARGB(255, 255, 255, 255),
            ),
          ),
        )
      ],
    );
  }
}
