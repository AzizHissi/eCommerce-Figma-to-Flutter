import 'package:eCommerce/testing/shapesdraw.dart';
import 'package:flutter/material.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';
import 'package:carousel_slider/carousel_slider.dart';
//import 'package:eCommerce/my_theme.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({Key key}) : super(key: key);

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  String dropDownValue;
  bool favCliked = false;
  AutoScrollController controller;
  final scrollDirection = Axis.horizontal;
  CarouselController buttonCarouselController = CarouselController();

  @override
  void initState() {
    super.initState();
    controller = AutoScrollController(
        viewportBoundaryGetter: () =>
            Rect.fromLTRB(0, 0, 0, MediaQuery.of(context).padding.bottom),
        axis: scrollDirection);
  }

  List<String> dropdownItems = <String>[
    'XXS',
    'XS',
    'S',
    'M',
    'L',
    'XL',
    'XXL',
    'XXXL'
  ];
  final List<String> entries = <String>[
    'assets/tump/t0.png',
    'assets/tump/t1.png',
    'assets/tump/t2.png',
    'assets/tump/t3.png',
    'assets/tump/t4.png'
  ];

  int _current_slider = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Icon(Icons.arrow_back, color: Colors.black)
                .height(20)
                .width(20)),
        centerTitle: true,
        title: Image.asset(
          'assets/logo.png',
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(
              .0,
              0.0,
              .0,
              0.0,
            ),
            child: buildHomeCarouselSlider(context),
          ),
          Container(
            height: 120,
            //width: ,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(
                0,
                2,
                .0,
                0.0,
              ),
              child: buildHomeListiew(context),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Nike Air Zoom Vomero 12",
                    style: GoogleFonts.robotoCondensed(
                        textStyle: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20)),
                  ),
                  Text(
                    "\$240",
                    style: GoogleFonts.robotoCondensed(
                        textStyle: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20)),
                  )
                ],
              ).padding(all: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Men’s Running Shoe",
                    textAlign: TextAlign.start,
                    style: GoogleFonts.robotoCondensed(
                        textStyle: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 16.0,
                            color: HexColor('#9A9EB7'))),
                  ),
                ],
              ).padding(horizontal: 8),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        favCliked = !favCliked;
                      });
                    },
                    child: Container(
                            child: !favCliked
                                ? SvgPicture.asset('assets/favs.svg',
                                        color: HexColor('#594CA9'))
                                    .padding(all: 8)
                                : Center(
                                    child: Icon(Icons.favorite,
                                            color: HexColor('#594CA9'))
                                        .padding(all: 8),
                                  ))
                        .height(40)
                        .width(40)
                        .border(all: 2, color: HexColor('#DBDBE3')),
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: Container(
                        child: DropdownButton<String>(
                      focusColor: HexColor('#594CA9'),
                      icon: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.keyboard_arrow_down,
                          color: HexColor("#594CA9"),
                        ),
                      ),
                      value: dropDownValue,
                      underline: Container(),
                      isExpanded: true,
                      hint: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("Size").textStyle(
                          GoogleFonts.robotoCondensed(
                              textStyle: TextStyle(
                                  color: HexColor("#9A9EB7"),
                                  fontWeight: FontWeight.normal,
                                  fontSize: 14.0)),
                        ),
                      ),
                      items: dropdownItems.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: new Text(value),
                          ),
                        );
                      }).toList(),
                      onChanged: (val) {
                        setState(() {
                          dropDownValue = val;
                        });
                      },
                    )).height(40).border(all: 2, color: HexColor('#DBDBE3')),
                  )
                ],
              ).padding(all: 8),
            ],
          ).padding(all: 15)
        ],
      ),
      bottomNavigationBar: Container(
              child: Text("ADD TO BAG")
                  .textStyle(
                    GoogleFonts.robotoCondensed(
                        textStyle: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 14.0)),
                  )
                  .center())
          .backgroundColor(HexColor('#594CA9'))
          .height(60),
    );
  }

  buildHomeCarouselSlider(context) {
    return CarouselSlider(
      carouselController: buttonCarouselController,
      options: CarouselOptions(
          height: MediaQuery.of(context).size.width * 0.90,
          viewportFraction: 1,
          onPageChanged: (index, reason) async {
            setState(() {
              _current_slider = index;
            });
            await controller.scrollToIndex(_current_slider,
                preferPosition: AutoScrollPosition.middle);
          }),
      items: entries.map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Stack(
              children: [
                Container(
                    width: MediaQuery.of(context).size.width,
                    //margin: EdgeInsets.symmetric(horizontal: 1),
                    child: Image.asset(
                      i,
                      fit: BoxFit.fill,
                      // width: MediaQuery.of(context).size.width,
                    )),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: entries.map((url) {
                      int index = entries.indexOf(url);
                      return Container(
                        width: 21.0,
                        height: 5.0,
                        margin: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 4.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(3)),
                          shape: BoxShape.rectangle,
                          color: _current_slider == index
                              ? HexColor("#594CA9")
                              : HexColor("#DBDBE3"),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ],
            );
          },
        );
      }).toList(),
    );
  }

  buildHomeListiew(context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2),
      child: ListView.separated(
          scrollDirection: scrollDirection,
          controller: controller,
          separatorBuilder: (BuildContext context, int index) => const SizedBox(
                width: 5,
              ),

          //padding: const EdgeInsets.all(8),
          itemCount: entries.length,
          itemBuilder: (BuildContext context, int index) {
            return AutoScrollTag(
              key: ValueKey(index),
              controller: controller,
              index: index,
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    _current_slider = index;
                  });
                  buttonCarouselController.jumpToPage(index);
                },
                child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: HexColor('#594CA9').withOpacity(
                                _current_slider == index ? 0.7 : 0),
                            width: 2)),
                    child: Image.asset(entries[index])),
              ),
            );
          }),
    );
  }
}
