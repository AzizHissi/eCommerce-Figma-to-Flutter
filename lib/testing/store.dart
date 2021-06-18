import 'package:flutter/material.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:eCommerce/testing/productDetails.dart';

//import 'package:flutter_svg/flutter_svg.dart';
class StoreScreen extends StatefulWidget {
  const StoreScreen({Key key}) : super(key: key);

  @override
  _StoreScreenState createState() => _StoreScreenState();
}

class _StoreScreenState extends State<StoreScreen> {
  final List<Map> prdct = List.generate(
      12,
      (index) => {
            "id": index,
            "image": "assets/PNGs/u$index.png",
            "price": (200 - 10 * index)
          }).toList();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MediaQuery.removePadding(
      context: context,
      removeTop: true,
      child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          itemCount: prdct.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              elevation: 0.5,
              child: Center(
                  child: GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return ProductDetails();
                        }));
                      },
                      child: buildCard(prdct[index]))),
            );
          }),
    );
  }

  Widget buildCard(Map prd) {
    return Stack(
      children: [
        Image.asset(prd["image"]),
        Positioned(
            top: 8,
            right: 6,
            child: Text(
              "\$" + prd["price"].toString(),
              style: GoogleFonts.robotoCondensed(
                  textStyle:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0)),
            ))
      ],
    );
  }
}

class Product {
  double price;
  String image;
  Product({price, image});
}
