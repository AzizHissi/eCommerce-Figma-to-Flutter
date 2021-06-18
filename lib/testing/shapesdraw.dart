import 'package:flutter/material.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:eCommerce/testing/store.dart';
import 'package:eCommerce/testing/filtre.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DrawerShapes extends StatefulWidget {
  const DrawerShapes({Key key}) : super(key: key);

  @override
  _DrawerShapesState createState() => _DrawerShapesState();
}

class _DrawerShapesState extends State<DrawerShapes> {
  int _selectedIndex = 0;
  String rs = "azzi";
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    StoreScreen(),
    Text(
      'Index 1: Business',
      style: optionStyle,
    ),
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Icon(
          Icons.menu,
          color: Colors.black,
        ).height(20).width(20),
        centerTitle: true,
        title: Image.asset(
          'assets/logo.png',
        ),
        actions: [
          GestureDetector(
            onTap: () async {
              final result = await Navigator.push(
                context,
                // Create the SelectionScreen in the next step.
                MaterialPageRoute(builder: (context) => FilterScreen()),
              );
              setState(() {
                rs = result;
              });
            },
            child: Container(child: SvgPicture.asset('assets/filter.svg'))
                .width(20)
                .height(20)
                .padding(all: 20),
          )
        ],
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: buildBottomNavigation(width),
    );
  }

  Container buildBottomNavigation(double width) {
    return Container(
      //height: 56,
      decoration: BoxDecoration(
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black.withOpacity(.15),
            blurRadius: 4,
          ),
        ],
      ),
      child: Stack(
        children: [
          BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            selectedItemColor: HexColor("#FF64AA"),
            showSelectedLabels: false,
            showUnselectedLabels: false,
            elevation: 10,
            items: [
              BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    'assets/save.svg',
                    color: _selectedIndex == 0
                        ? HexColor("#FF64AA")
                        : Colors.black,
                  ),
                  title: Text('Test')),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    'assets/search.svg',
                    color: _selectedIndex == 1
                        ? HexColor("#FF64AA")
                        : Colors.black,
                  ),
                  title: Text('Test')),
              BottomNavigationBarItem(
                  icon: Stack(
                    overflow: Overflow.visible,
                    children: <Widget>[
                      SvgPicture.asset(
                        'assets/shop.svg',
                        color: _selectedIndex == 2
                            ? HexColor("#FF64AA")
                            : Colors.black,
                      ),
                      new Positioned(
                          top: -1.0,
                          right: -6.0,
                          child: Container(
                            child: Center(child: Text("4")),
                          )
                              .decorated(
                                  color: HexColor("#FF64AA"),
                                  shape: BoxShape.circle)
                              .height(15)
                              .width(15))
                    ],
                  ),
                  title: Text('Test')),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    'assets/view.svg',
                    color: _selectedIndex == 3
                        ? HexColor("#FF64AA")
                        : Colors.black,
                  ),
                  title: Text('Test')),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    'assets/favs.svg',
                    color: _selectedIndex == 4
                        ? HexColor("#FF64AA")
                        : Colors.black,
                  ),
                  title: Text('Test')),
            ],
            currentIndex: _selectedIndex,
            onTap: _onItemTapped,
          ),
          Positioned(
              bottom: 0,
              child: Row(
                children: [
                  Container()
                      .width(width / 5)
                      .height(_selectedIndex == 0 ? 4 : 0)
                      .backgroundColor(HexColor("#FF64AA")),
                  Container()
                      .width(width / 5)
                      .height(_selectedIndex == 1 ? 4 : 0)
                      .backgroundColor(HexColor("#FF64AA")),
                  Container()
                      .width(width / 5)
                      .height(_selectedIndex == 2 ? 4 : 0)
                      .backgroundColor(HexColor("#FF64AA")),
                  Container()
                      .width(width / 5)
                      .height(_selectedIndex == 3 ? 4 : 0)
                      .backgroundColor(HexColor("#FF64AA")),
                  Container()
                      .width(width / 5)
                      .height(_selectedIndex == 4 ? 4 : 0)
                      .backgroundColor(HexColor("#FF64AA")),
                ],
              ))
        ],
      ),
    );
  }
}

class HexColor extends Color {
  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));

  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll('#', '');
    if (hexColor.length == 6) {
      hexColor = 'FF' + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }
}
