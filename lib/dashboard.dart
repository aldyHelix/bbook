import 'dart:ui';
import 'package:bbook/materi-view.dart';
import 'package:bbook/materi.dart';
//import 'package:bbook/scan.dart';
import 'package:flutter/material.dart';
import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/services.dart';
//import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:http/http.dart' as http;
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
  String errorMessage;
  String errorTitle;

  final String apiUrl = 'https://bbook-application.xyz/api/materi';
  final String url = 'https://bbook-application.xyz';
  //final String apiUrl = "https://randomuser.me/api/?results=10";

  Future<List<dynamic>> fetchUsers() async {
    var result = await http.get(apiUrl);
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

  final _pageOptions = [Dashboard(), Materi()];
  @override
  Widget build(BuildContext context) {
    final welcomeText = Container();

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
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Materi()),
                );
              },
              child: Text(
                'See All',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: HexColor('#E2AF90'),
                ),
              ),
            )),
      ],
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
          //BottomNavigationBarItem(icon: Icon(Icons.gamepad), label: 'Quiz'),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'About',
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
      onPressed: scan,
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

  Future scan() async {
    try {
      ScanResult barcodeScan = await BarcodeScanner.scan();
      String barcode = barcodeScan.rawContent;
      if (barcode == '') {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Dashboard(),
          ),
        );
      } else {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MateriView(
              code: barcode,
              isQrcode: true,
            ),
          ),
        );
      }
      //barcode = materi qrcode generator

    } on PlatformException catch (e) {
      if (e.code == BarcodeScanner.cameraAccessDenied) {
        setState(() {
          this.errorMessage = "The user did not grant the camera permission!";
          this.errorTitle = "Error";
          showAlertDialog(context);
        });
      } else {
        setState(() {
          this.errorMessage = 'Unknown error: $e';
          this.errorTitle = 'Unknown error';
          showAlertDialog(context);
        });
      }
    } on FormatException {
      setState(() {
        this.errorMessage =
            'null (User returned using the "back"-button before scanning anything. Result)';
        this.errorTitle = 'Error Null';
        showAlertDialog(context);
      });
    } catch (e) {
      setState(() {
        this.errorMessage = 'Unknown error: $e';
        this.errorTitle = 'Unknown error';
        showAlertDialog(context);
      });
    }
  }

  showAlertDialog(BuildContext context) {
    // set up the button
    Widget okButton = ElevatedButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text(errorTitle),
      content: Text(errorMessage),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
