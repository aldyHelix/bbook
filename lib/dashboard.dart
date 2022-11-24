import 'dart:ui';
import 'package:bbook/about.dart';
import 'package:bbook/controllers/question_controller.dart';
import 'package:bbook/materi-list-bab.dart';
import 'package:bbook/materi-view.dart';
import 'package:bbook/materi.dart';
import 'package:bbook/screens/peta-konsep/peta-konsep.dart';
import 'package:bbook/screens/petunjuk/petunjuk.dart';
import 'package:bbook/screens/petunjuk/petunjuk_soal.dart';
import 'package:bbook/screens/quiz/quiz_screen.dart';
import 'package:bbook/video-list.dart';
//import 'package:bbook/scan.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
//import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:timeago/timeago.dart' as timeago;

class Dashboard extends StatefulWidget {
  static String tag = 'dashboard-page';
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int selectedPage = 0;
  String barcode = "";
  late String errorMessage;
  late String errorTitle;

  final String apiUrl = 'http://103.174.115.36/api/materi';
  final String url = 'http://103.174.115.36/';
  //final String apiUrl = "https://randomuser.me/api/?results=10";
  Future<dynamic> getUsername() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('username');
  }

  Future<List<dynamic>> fetchUsers() async {
    var result = await http.get(Uri.parse(apiUrl));
    return json.decode(result.body)['data'];
  }

  String _namaMateri(dynamic materi) {
    return materi['nama_materi'];
  }

  String _image(dynamic materi) {
    return url + '/uploads/materi/' + materi['image'];
  }

  String _header(dynamic materi) {
    return materi['header'];
  }

  String _timeAgo(dynamic materi) {
    final dateData = DateTime.parse(materi['created_at']);
    return timeago.format(dateData);
  }

  String _id(dynamic materi) {
    return materi['id'].toString();
  }

  String _bab(dynamic bab) {
    return 'Bab ' + bab.toString();
  }

  Column _buildButtonColumn(Color color, IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color),
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),
        ),
      ],
    );
  }

  final _pageOptions = [
    Dashboard(),
    Materi(),
    Video(),
    PetaKonsep(),
    PetunjukSoal(),
    Petunjuk(),
    About()
  ];
  @override
  Widget build(BuildContext context) {
    QuestionController _controller = Get.put(QuestionController());

    final welcomeText = Align(
      alignment: Alignment.centerLeft,
      child: Container(
        child: FutureBuilder<dynamic>(
            future: getUsername(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                return Text(
                  'Selamat datang ' + snapshot.data + ',',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                );
              } else {
                return Text(
                  'Selamat datang teman,',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                );
              }
            }),
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
                  'Materi Terbaru',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                child: Text(
                  'Materi baru ditambahkan',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w300),
                ),
              ),
            ),
          ],
        ),
        Align(
            alignment: Alignment.centerRight,
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Materi()),
                );
              },
              child: Text(
                'Semua Materi',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: HexColor('#E2AF90'),
                ),
              ),
            )),
      ],
    );

    final recentBabLabel = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                child: Text(
                  'Materi Perbab',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ],
    );

    final babMateri = Container(
      height: 50,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 3,
          itemBuilder: (context, index) {
            return Container(
              padding: EdgeInsets.only(left: 5, right: 5),
              width: MediaQuery.of(context).size.width * 0.29,
              height: 45,
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Color(0xffF18265),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(9),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MateriBab(bab: index + 1),
                    ),
                  );
                },
                child: Text(
                  _bab(index + 1),
                  style: TextStyle(
                    color: Color(0xffffffff),
                  ),
                ),
              ),
            );
          }),
    );

    final cardView = Container(
      height: MediaQuery.of(context).size.height * 0.35,
      child: FutureBuilder<List<dynamic>>(
        future: fetchUsers(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
                  return Container(
                    width: MediaQuery.of(context).size.width / 2.5,
                    child: Stack(
                      children: <Widget>[
                        Card(
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
                                  image: NetworkImage(
                                      _image(snapshot.data[index])),
                                  height: (MediaQuery.of(context).size.height *
                                          0.35) -
                                      100,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Column(
                                children: [
                                  Container(
                                    child: Text(
                                      _namaMateri(snapshot.data[index]),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    padding: EdgeInsets.all(5),
                                  ),
                                  Container(
                                    child: Text(
                                      _header(snapshot.data[index]),
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
                                  _timeAgo(snapshot.data[index]),
                                  style: TextStyle(
                                      fontSize: 10, color: HexColor('#E2B091')),
                                ),
                              ),
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MateriView(
                                        code: _id(snapshot.data[index]),
                                        isQrcode: false,
                                      )),
                            );
                          },
                        ),
                      ],
                    ),
                  );
                });
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );

    Color color = Theme.of(context).primaryColor;

    Widget infoApp = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildButtonColumn(color, Icons.call, 'CALL'),
        _buildButtonColumn(color, Icons.near_me, 'ROUTE'),
        _buildButtonColumn(color, Icons.share, 'SHARE'),
      ],
    );

    final body = GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
      },
      child: ConstrainedBox(
        constraints: BoxConstraints.expand(),
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.only(top: 50, right: 24, left: 24),
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              HexColor('#E2B091'),
              HexColor('#F7DFD4'),
            ]),
          ),
          child: Column(children: <Widget>[
            SizedBox(height: 6.0),
            //searchBar,
            welcomeText,
            SizedBox(height: 16.0),
            imageFill,
            SizedBox(height: 13.0),
            //infoApp,
            SizedBox(height: 16.0),
            recentBabLabel,
            SizedBox(height: 16.0),
            babMateri,
            SizedBox(height: 16.0),
            recentMaterilabel,
            SizedBox(height: 16.0),
            cardView,
          ]),
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
            if (index == 3) {
              _controller.onInit();
            }
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
          BottomNavigationBarItem(
            icon: Icon(Icons.play_circle_fill_rounded),
            label: 'Video',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.menu_book), label: ' '),
          BottomNavigationBarItem(icon: Icon(Icons.gamepad), label: 'Quiz'),
          BottomNavigationBarItem(
            icon: Icon(Icons.directions),
            label: 'Petunjuk',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: 'About',
          ),
        ],
      ),
    );
    final floatingBottomIcon = Container(
      height: 65,
      width: 65,
      child: FittedBox(
        child: FloatingActionButton(
          backgroundColor: HexColor('#EABCAC'),
          child: Column(
            children: [
              Flexible(
                child: Center(
                  child: Column(
                    children: [
                      Icon(
                        Icons.pin_drop,
                        size: 23,
                        color: Colors.blueGrey,
                      ),
                      Text(
                        'Peta Konsep',
                        style: TextStyle(fontSize: 9, color: Colors.black54),
                        textAlign: TextAlign.center,
                      ),
                    ],
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                  ),
                ),
              )
            ],
            crossAxisAlignment: CrossAxisAlignment.center,
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => PetaKonsep()),
            );
          },
          elevation: 12,
        ),
      ),
    );

    final bool showFab = MediaQuery.of(context).viewInsets.bottom == 0.0;
    final bool showBody = selectedPage == 0;
    final page = _pageOptions[selectedPage];
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: showBody ? body : page,
      bottomNavigationBar: _bottomNavBar,
      floatingActionButton: showFab ? floatingBottomIcon : null,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
