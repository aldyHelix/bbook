import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class Petunjuk extends StatelessWidget {
  const Petunjuk({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          children: <Widget>[
            //searchBar,
            SizedBox(height: 18.0), Text('Halaman Petunjuk Pemakaian')
          ],
        ),
      ),
    );

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: body,
    );
  }
}
