import 'package:f_shopping_app_r2_template/ui/controllers/shopping_controller.dart';
import 'package:f_shopping_app_r2_template/ui/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Widgets/banner.dart';

// TextEditingController user = TextEditingController();
// TextEditingController locate = TextEditingController();

class cambioName extends StatefulWidget {
  const cambioName({Key? key}) : super(key: key);

  @override
  State<cambioName> createState() => _cambioNameState();
}

class _cambioNameState extends State<cambioName> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration:
            const BoxDecoration(color: Color.fromARGB(255, 103, 170, 225)),
        child: ListView(children: [
          Container(
            height: 60,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
              ),
              child: Row(
                children: <Widget>[
                  GestureDetector(
                    onTap: (() => Get.back()),
                    child: const Icon(
                      Icons.arrow_back,
                      size: 40,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 6),
                    child: Text("Changes are made automatically"),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 150,
          ),
          Container(
            child: const Center(
                child: Text(
              "ENTER USER",
              style: TextStyle(color: Colors.black, fontSize: 20),
            )),
          ),
          SizedBox(
            height: 40,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 90),
            child: TextFormField(
              onChanged: (valor) {
                shoppingController.user.value = valor;
                if (shoppingController.user.value == "")
                  shoppingController.user.value = "Double tap to enter user";
              },
              maxLength: 20,
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                  filled: true, fillColor: Color.fromARGB(255, 145, 192, 230)),
            ),
          ),
          SizedBox(
            height: 80,
          ),
          Container(
            child: const Center(
                child: Text(
              "ENTER LOCATION",
              style: TextStyle(color: Colors.black, fontSize: 20),
            )),
          ),
          SizedBox(
            height: 40,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 90),
            child: TextFormField(
              onChanged: (valor) {
                shoppingController.locate.value = valor;
                if (shoppingController.locate_sec.value != "") {
                  shoppingController.locate_sec.value = valor;
                }
                if (shoppingController.locate.value == "")
                  shoppingController.locate.value =
                      shoppingController.locate_sec.value;
                // "Double tap to enter location";
              },
              maxLength: 20,
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                  filled: true, fillColor: Color.fromARGB(255, 145, 192, 230)),
            ),
          ),
        ]),
      ),
    );
  }
}
