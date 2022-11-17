import 'package:bbook/constants.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class PetaKonsep extends StatelessWidget {
  const PetaKonsep({Key? key}) : super(key: key);

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
              backButton,
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
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image(
                      alignment: Alignment.center,
                      image: AssetImage('images/peta-konsep.png'),
                      fit: BoxFit.cover,
                    )
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
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      child: Text('Kompetensi Dasar'),
                    ),
                    Divider(thickness: 1.5),
                    Text(
                      '3.2 Memahami corak kehidupan masyarakat pada zaman praaksara.',
                      maxLines: 15,
                      softWrap: true,
                    ),
                    Text(
                      '3.3 Menganalisis asal-usul leluhur bangsa Indonesia (Proto, Deutero Melayu dan Melanesoid).',
                      maxLines: 15,
                      softWrap: true,
                    ),
                    Text(
                      '3.4 Menganalisis berdasarkan tipologi hasil budaya Praaksara Indonesia termasuk yang berada di lingkungan terdekat. ',
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
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      child: Text('Tujuan Pembelajaran'),
                    ),
                    Divider(thickness: 1.5),
                    Text(
                      '1. Melalui penayangan video peserta peserta didik mampu memahami corak kehidupan masa pra- sejarah Indonesia dengan benar.',
                      maxLines: 15,
                      softWrap: true,
                    ),
                    Text(
                      '2. Melalui kegiatan literasi didik mampu mengklasifikasi asal-usul leluhur bangsa Indonesia dengan benar.',
                      maxLines: 15,
                      softWrap: true,
                    ),
                    Text(
                      '3. Melalui kegiatan tanya jawab peserta didik mampu mengelompokkan peninggalan kebudayaan ada zaman prasejarah dengan benar.',
                      maxLines: 15,
                      softWrap: true,
                    ),
                    Text(
                      '4. Melalui kegiatan penugasan peserta didik mampu menyusun kliping mengenai contoh pengaruh peninggalan kebudayaan zaman praaksara pada kehidupan di lingkungan terdekat dengan benar.',
                      maxLines: 15,
                      softWrap: true,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 26.0),
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
