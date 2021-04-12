import 'dart:ui';

//import 'package:bbook/src/model/materi_model.dart';
import 'package:bbook/materi.dart';
import 'package:flutter/material.dart';
//import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int selectedPage = 0;

  final _pageOptions = [Dashboard(), Materi(), null, null];
  @override
  Widget build(BuildContext context) {
    final searchBar = TextField(
      style: TextStyle(
        fontSize: 14.0,
        color: Colors.blueAccent,
      ),
      decoration: InputDecoration(
        prefixIcon: Padding(
          padding: EdgeInsets.all(0.0),
          child: Icon(
            Icons.search,
            color: Colors.grey,
          ), // icon is 48px widget.
        ),
        filled: true,
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        hintText: "pencarian",
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0)),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(8.0),
        ),
        fillColor: HexColor('#EABCAC'),
      ),
    );

    final imageFill = Container(
      width: MediaQuery.of(context).size.width,
      height: 200,
      decoration: BoxDecoration(
          image: const DecorationImage(
              image: AssetImage('images/bbook.png'),
              alignment: Alignment.center,
              scale: 3),
          color: HexColor('#482428'),
          borderRadius: BorderRadius.circular(24)),
    );

    final recentMaterilabel = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                child: Text(
                  'Recent Materi',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                child: Text(
                  'List recent added materi from author',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w300),
                ),
              ),
            ),
          ],
        ),
        Align(
          alignment: Alignment.centerRight,
          child: Text(
            'See All',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: HexColor('#E2AF90'),
            ),
          ),
        )
      ],
    );
    final List<int> numbers = [1, 2, 3, 5, 8, 13, 21, 34, 55];

    final cardView = Container(
      height: MediaQuery.of(context).size.height * 0.35,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: numbers.length,
          itemBuilder: (context, index) {
            return Container(
              width: MediaQuery.of(context).size.width / 2.5,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(9),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(9),
                        topLeft: Radius.circular(9),
                      ),
                      child: Image(
                        alignment: Alignment.topCenter,
                        image: AssetImage('images/image1.png'),
                        height:
                            (MediaQuery.of(context).size.height * 0.35) - 100,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Column(
                      children: [
                        Container(
                          child: Text(
                            'AAAAAAAAAAAAAAAAAAAAAAAAAA',
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          padding: EdgeInsets.all(5),
                        ),
                        Container(
                          child: Text(
                            'bbbbb bbbbbbbbbbbbb bbbbbbb vccccc cccccsdasdasd sdasdas asd dasd A',
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          ),
                          padding: EdgeInsets.only(left: 5, right: 5),
                        ),
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.only(right: 5, top: 3),
                      alignment: Alignment.bottomRight,
                      child: Text(
                        'kemarin',
                        style:
                            TextStyle(fontSize: 10, color: HexColor('#E2B091')),
                      ),
                    )
                    // Align(
                    //   alignment: Alignment.bottomLeft,
                    //   child: Text(
                    //     numbers[index].toString(),
                    //     style: TextStyle(color: Colors.black, fontSize: 36.0),
                    //   ),
                    // ),
                  ],
                ),
              ),
            );
          }),
    );

    final body = GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.only(top: 50, right: 24, left: 24),
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            HexColor('#E2B091'),
            HexColor('#F7DFD4'),
          ]),
        ),
        child: Column(
          children: <Widget>[
            searchBar,
            SizedBox(height: 26.0),
            imageFill,
            SizedBox(height: 26.0),
            recentMaterilabel,
            SizedBox(height: 26.0),
            cardView
          ],
        ),
      ),
    );

    final _bottomNavBar = Theme(
      data: Theme.of(context).copyWith(
        canvasColor: HexColor('#874E4C'),
      ),
      child: BottomNavigationBar(
        backgroundColor: HexColor('#874E4C'),
        selectedItemColor: HexColor('#E2AF90'),
        unselectedItemColor: HexColor('#9AA5B1'),
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        currentIndex: selectedPage,
        onTap: (index) {
          setState(() {
            selectedPage = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu_book),
            label: 'Materi',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.gamepad), label: 'Quiz'),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Other',
          ),
        ],
      ),
    );
    final floatingBottomIcon = FloatingActionButton(
      backgroundColor: HexColor('#EABCAC'),
      child: const Icon(
        Icons.qr_code,
        size: 25,
        color: Colors.blueGrey,
      ),
      onPressed: () {},
      //elevation: 5,
    );

    final bool showFab = MediaQuery.of(context).viewInsets.bottom == 0.0;
    final bool showBody = selectedPage == 0;
    final page = _pageOptions[selectedPage];
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: showBody ? body : page,
      //bottomNavigationBar: _bottomNavBar,
      bottomNavigationBar: _bottomNavBar,
      floatingActionButton: showFab ? floatingBottomIcon : null,
      //floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
