import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:bbook/constants.dart';

class Petunjuk extends StatelessWidget {
  const Petunjuk({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final body = GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
      },
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
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
              Container(
                margin: EdgeInsets.symmetric(
                    horizontal: kDefaultPadding, vertical: kDefaultPadding),
                height: 100,
                decoration: BoxDecoration(
                    image: const DecorationImage(
                        image: AssetImage('images/bbook.png'),
                        alignment: Alignment.center,
                        scale: 3),
                    color: HexColor('#482428'),
                    borderRadius: BorderRadius.circular(24)),
              ),
              SizedBox(height: 18.0),
              Container(
                margin: EdgeInsets.symmetric(horizontal: kDefaultPadding),
                padding: EdgeInsets.all(kDefaultPadding),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Align(
                      child: Text('Halaman Utama'),
                    ),
                    Divider(thickness: 1.5),
                    Image(
                      alignment: Alignment.center,
                      image: AssetImage('images/image1.png'),
                      fit: BoxFit.cover,
                    ),
                    Text(
                      'Cara 1',
                      maxLines: 15,
                      softWrap: true,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 18.0),
              Container(
                margin: EdgeInsets.symmetric(horizontal: kDefaultPadding),
                padding: EdgeInsets.all(kDefaultPadding),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Align(
                      child: Text('Halaman Utama'),
                    ),
                    Divider(thickness: 1.5),
                    Image(
                      alignment: Alignment.center,
                      image: AssetImage('images/image1.png'),
                      fit: BoxFit.cover,
                    ),
                    Text(
                      'Cara 2',
                      maxLines: 15,
                      softWrap: true,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 18.0),
              Container(
                margin: EdgeInsets.symmetric(horizontal: kDefaultPadding),
                padding: EdgeInsets.all(kDefaultPadding),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Align(
                      child: Text('Halaman Utama'),
                    ),
                    Divider(thickness: 1.5),
                    Image(
                      alignment: Alignment.center,
                      image: AssetImage('images/image1.png'),
                      fit: BoxFit.cover,
                    ),
                    Text(
                      'Cara 3',
                      maxLines: 15,
                      softWrap: true,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 18.0),
              Container(
                margin: EdgeInsets.symmetric(horizontal: kDefaultPadding),
                padding: EdgeInsets.all(kDefaultPadding),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Align(
                      child: Text('Halaman Utama'),
                    ),
                    Divider(thickness: 1.5),
                    Image(
                      alignment: Alignment.center,
                      image: AssetImage('images/image1.png'),
                      fit: BoxFit.cover,
                    ),
                    Text(
                      'Cara 4',
                      maxLines: 15,
                      softWrap: true,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 18.0),
            ],
          ),
        ),
      ),
    );

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: body,
    );
  }
}
