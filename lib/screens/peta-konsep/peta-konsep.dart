import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class PetaKonsep extends StatelessWidget {
  const PetaKonsep({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final backButton = Align(
      alignment: Alignment.topLeft,
      child: IconButton(
        icon: const Icon(Icons.arrow_back),
        iconSize: 24,
        onPressed: () {
          Navigator.pop(context);
        },
        //padding: EdgeInsets.only(top: MediaQuery.of(context).size.width * 0.18),
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
          //mainAxisSize: MainAxisSize.max,
          //mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            //searchBar,
            backButton, SizedBox(height: 18.0), Text('Halaman Peta Konsep')
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
