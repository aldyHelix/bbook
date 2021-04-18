import 'dart:async';

import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ScanScreen extends StatefulWidget {
  @override
  _ScanState createState() => new _ScanState();
}

class _ScanState extends State<ScanScreen> {
  String barcode = "";

  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
          title: new Text('QR Code Scanner'),
        ),
        body: new Center(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: ElevatedButton(
                    onPressed: scan, child: const Text('START CAMERA SCAN')),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: Text(
                  barcode,
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ));
  }

  Future scan() async {
    try {
      ScanResult barcode = await BarcodeScanner.scan();
      setState(() => this.barcode = barcode as String);
    } on PlatformException catch (e) {
      if (e.code == BarcodeScanner.cameraAccessDenied) {
        showAlertDialog(context);
        // setState(() {
        //   this.barcode = showAlertDialog(context);
        // });
      } else {
        showAlertDialog(context);
        //setState(() => this.barcode = 'Unknown error: $e');
      }
    } on FormatException {
      showAlertDialog(context);
      // setState(() => this.barcode =
      //     'null (User returned using the "back"-button before scanning anything. Result)');
    } catch (e) {
      showAlertDialog(context);
      // setState(() => this.barcode = 'Unknown error: $e');
    }
  }
}

showAlertDialog(BuildContext context) {
  // set up the button
  Widget okButton = ElevatedButton(
    child: Text("OK"),
    onPressed: () {},
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Error"),
    content: Text("The user did not grant the camera permission!"),
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
