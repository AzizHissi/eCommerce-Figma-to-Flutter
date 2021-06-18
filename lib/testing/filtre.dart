import 'package:eCommerce/testing/shapesdraw.dart';
import 'package:flutter/material.dart';

import 'package:styled_widget/styled_widget.dart';
import 'package:google_fonts/google_fonts.dart';
//import 'package:shimmer/shimmer.dart';
//import 'package:carousel_slider/carousel_slider.dart';
//import 'package:active_ecommerce_flutter/my_theme.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({Key key}) : super(key: key);

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  int indexSelected;
  List<Map> checkeds = [];
  List<Map> colors = [
    {"id": 1, "color": HexColor("#FFFFFF")},
    {"id": 1, "color": HexColor("#E5E5E5")},
    {"id": 1, "color": HexColor("#EDE1BA")},
    {"id": 1, "color": HexColor("#E2AE00")},
    {"id": 1, "color": HexColor("#FF6000")},
    {"id": 1, "color": HexColor("#65BD13")},
    {"id": 1, "color": HexColor("#0091CD")},
    {"id": 1, "color": HexColor("#EC0093")},
    {"id": 1, "color": HexColor("#7F8000")},
    {"id": 1, "color": HexColor("#777878")},
    {"id": 1, "color": HexColor("#885B3C")},
    {"id": 1, "color": HexColor("#111111")},
    {"id": 1, "color": HexColor("#FCF4D6")},
  ];
  final List<Map> sizes = List.generate(
          28, (index) => {"id": index, "size": index == 0 ? 3 : 3 + index / 2})
      .toList();
  //  final List<Map> colors = List.generate(
  //     28, (index) => {"id": index, "color": index == 0 ? 3 : 3 + index / 2})
  // .toList();

  RangeValues _currentRangeValues = const RangeValues(40, 80);
  /* Container(
      child: Center(
          child: Text(
        index == 0 ? (3).toString() : (3 + index / 2).toString(),
        style: GoogleFonts.robotoCondensed(
            textStyle: TextStyle(
                color: HexColor('#0A1734'),
                fontWeight: FontWeight.bold,
                fontSize: 14.0)),
      )),
    )
        .width(40)
        .height(40)
        .backgroundColor(Colors.white)
        .border(all: 2, color: Colors.black),*/
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          leading: Container(),
          elevation: 0,
          centerTitle: true,
          title: Text(
            "FILTRES",
            style: GoogleFonts.robotoCondensed(
                textStyle: TextStyle(
                    color: HexColor('#0A1734'),
                    fontWeight: FontWeight.normal,
                    fontSize: 20.0)),
          )),
      backgroundColor: HexColor("#F8F8FA"),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            height: (MediaQuery.of(context).size.height - 72) * 0.35,
            decoration: BoxDecoration(
              color: Color(0xFFEEEEEE),
            ),
            child: Padding(
              padding: EdgeInsets.fromLTRB(30, 10, 30, 0),
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xFFEEEEEE),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8, bottom: 16),
                      child: Row(
                        children: [
                          Text(
                            'Size',
                            textAlign: TextAlign.start,
                            style: GoogleFonts.robotoCondensed(
                                textStyle: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16.0,
                                    color: HexColor('#0A1734'))),
                          ),
                        ],
                      ),
                    ),
                    Wrap(
                      children: myList(),
                    ),
                    Expanded(
                      child: Container(),
                    ),
                    Divider()
                  ],
                ),
              ),
            ),
          ),
          Container(
            height: (MediaQuery.of(context).size.height - 72) * 0.35,
            decoration: BoxDecoration(
              color: Color(0xFFEEEEEE),
            ),
            child: Padding(
              padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8, bottom: 16),
                    child: Row(
                      children: [
                        Text(
                          'Color',
                          textAlign: TextAlign.start,
                          style: GoogleFonts.robotoCondensed(
                              textStyle: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16.0,
                                  color: HexColor('#0A1734'))),
                        ),
                      ],
                    ),
                  ),
                  Wrap(
                    children: myListColor(),
                  ),
                  Expanded(
                    child: Container(),
                  ),
                  Divider()
                ],
              ),
            ),
          ),
          Container(
            height: (MediaQuery.of(context).size.height - 72) * 0.2,
            decoration: BoxDecoration(
              color: Color(0xFFEEEEEE),
            ),
            child: Padding(
              padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Price',
                          style: GoogleFonts.robotoCondensed(
                              textStyle: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16.0,
                                  color: HexColor('#0A1734'))),
                        ),
                      ),
                    ],
                  ),
                  Expanded(child: Container()),
                  RangeSlider(
                    activeColor: HexColor('#FF64AA'),
                    //inactiveColor: HexColor('#FF64AA'),
                    values: _currentRangeValues,
                    min: 0,
                    max: 100,
                    divisions: 100,
                    labels: RangeLabels(
                      _currentRangeValues.start.round().toString(),
                      _currentRangeValues.end.round().toString(),
                    ),
                    onChanged: (RangeValues values) {
                      setState(() {
                        _currentRangeValues = values;
                      });
                    },
                  ),
                  Expanded(child: Container()),
                ],
              ),
            ),
          )
        ],
      ),
      bottomNavigationBar: Container(
          child: Row(
        children: [
          Flexible(
              flex: 1,
              child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: Icon(Icons.menu, size: 35))),
          Flexible(
              flex: 4,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: Image.asset(
                  'assets/logo.png',
                ),
              ).backgroundColor(HexColor('#FFFFFF'))),
          Flexible(
              flex: 1,
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context, "aziz ha");
                },
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: Icon(
                    Icons.close,
                    size: 35,
                    color: HexColor('#FFFFFF'),
                  ),
                ).backgroundColor(HexColor('#594CA9')),
              )),
        ],
      )).backgroundColor(HexColor('#FFFFFF')).height(60),
    );
  }

  List<Widget> myList() {
    return sizes
        .map<Widget>(
          (e) => GestureDetector(
            onTap: () {
              setState(() {
                indexSelected = e["id"];
              });
            },
            child: Container(
              child: Center(
                  child: Text(
                e["size"].toString(),
                style: GoogleFonts.robotoCondensed(
                    textStyle: TextStyle(
                        color: HexColor('#0A1734'),
                        fontWeight: FontWeight.bold,
                        fontSize: 14.0)),
              )),
            )
                .width(40)
                .height(40)
                .backgroundColor((indexSelected == e["id"])
                    ? HexColor("#FF64AA")
                    : Colors.white)
                .border(all: 2, color: Colors.black),
          ),
        )
        .toList();
  }

  List<Widget> myListColor() {
    return colors
        .map<Widget>(
          (e) => GestureDetector(
              onTap: () {
                setState(() {
                  if (checkeds.contains(e))
                    checkeds.remove(e);
                  else
                    checkeds.add(e);
                });
              },
              child: Container(
                child: Center(
                    child: (checkeds.contains(e))
                        ? Icon(
                            Icons.check,
                            color: e["color"] != HexColor("#FFFFFF")
                                ? Colors.white
                                : Colors.black,
                          )
                        : Container()),
                margin: EdgeInsets.all(4.0),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: e["color"],
                    border: Border.all(
                        color: HexColor('#E5E5E5'),
                        style: BorderStyle.solid,
                        width: 1)),
              ).width(50).height(50)),
        )
        .toList();
  }

  Widget myWidget(BuildContext context) {
    return MediaQuery.removePadding(
      context: context,
      removeTop: true,
      child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 7,
          ),
          itemCount: 7,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              width: 40,
              height: 40,
              color: Colors.white,
              child: Center(child: Text('$index')),
            );
          }),
    );
  }
}
