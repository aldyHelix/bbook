import 'package:bbook/materi-view.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class Materi extends StatefulWidget {
  @override
  _MateriState createState() => _MateriState();
}

class _MateriState extends State<Materi> {
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
        contentPadding: EdgeInsets.fromLTRB(20.0, 0, 20.0, 0),
        hintText: "pencarian",
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0)),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(8.0),
        ),
        fillColor: HexColor('#EABCAC'),
      ),
    );

    final List<int> numbers = [1, 2, 3, 5, 8, 13, 21, 34, 55];

    final materiLists = Expanded(
      flex: 2,
      //padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
      //height: MediaQuery.of(context).size.height,
      child: ListView.builder(
          padding: EdgeInsets.all(0),
          scrollDirection: Axis.vertical,
          itemCount: numbers.length,
          itemBuilder: (context, index) {
            return Container(
              height: 100,
              width: MediaQuery.of(context).size.width,
              child: Stack(
                children: <Widget>[
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    elevation: 5,
                    child: Padding(
                      padding: EdgeInsets.all(7),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image(
                              alignment: Alignment.centerLeft,
                              image: AssetImage('images/image1.png'),
                              height: 80,
                              width: 80,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width / 1.63,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    'AAAAA AAAAAA AAAAA AAAAA AAAAA ssssssssssssssssssss',
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  padding: EdgeInsets.all(5),
                                ),
                                Container(
                                  alignment: Alignment.topLeft,
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
                          ),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MateriView(
                                  materiQrCode: '',
                                )),
                      );
                    },
                  ),
                ],
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
          //mainAxisSize: MainAxisSize.max,
          //mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[searchBar, SizedBox(height: 18.0), materiLists],
        ),
      ),
    );

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: body,
    );
  }
}
