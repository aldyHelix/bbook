import 'package:bbook/constants.dart';
import 'package:drop_cap_text/drop_cap_text.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class About extends StatelessWidget {
  const About({Key? key}) : super(key: key);

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
            //mainAxisSize: MainAxisSize.max,
            //mainAxisAlignment: MainAxisAlignment.start,
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
              Container(
                margin: EdgeInsets.symmetric(horizontal: kDefaultPadding),
                padding: EdgeInsets.all(kDefaultPadding),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25)),
                child: Container(
                  child: DropCapText(
                    tentangPenulis(),
                    style: TextStyle(fontSize: 14, height: 1.4),
                    dropCapPadding: EdgeInsets.only(right: 21, bottom: 16),
                    dropCap: DropCap(
                      width: 100,
                      height: 150,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image(
                          alignment: Alignment.center,
                          image: AssetImage('images/penulis.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 18.0),
              Container(
                margin: EdgeInsets.symmetric(horizontal: kDefaultPadding),
                padding: EdgeInsets.all(kDefaultPadding),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25)),
                child: Text('Versi Aplikasi : 1.0.0'),
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
                      child: Text('Tentang Pembuat Aplikasi'),
                    ),
                    Divider(thickness: 1.5),
                    Text(
                      tentangPembuat(),
                      maxLines: 15,
                      softWrap: true,
                    ),
                  ],
                ),
              ),
              //searchBar,
              SizedBox(height: 18.0),
              //, Text('Halaman About')
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

tentangPembuat() {
  return 'Pembuat Aplikasi Aldy Satria Gumilar, S.Kom : Full Stack Developer di perusahaan di jakarta. tentang pembuatan aplikasi hubungi aldy.satria07@gmail.com';
}

String tentangPenulis() {
  return 'Tentang Penulis : Maharani Arya Dewanti lahir di Cilacap, 12 November 1998. Saat ini Maharani sedang menempuh pendidikan S1 Program Studi Pendidikan Sejarah di Universitas Negeri Malang. Maharani memulai karir dengan menjadi Master of ceremonies dalam beberapa acara, salah satunya adalah OMATIQ oleh Yayasan Yatim Mandiri tahun 2019. Di tahun yang sama Maharani menulis “Sustainability Sumberawan Watersite: History, Preservation Efforts and their use as Learning Resources” dan menjadi pembicara dalam “in the  International Converence on Geography and Education “Achieving Sustainability Through Environmental Innovation: The Role of Geography Study” oleh Departement of Geography, Social Science Faculty, UM. Maharani menjadi bagian dari tim penelitian dan pengembangan bahan ajar “Jejak Sejarah Malang Raya” pada tahun 2019 dan bahan ajar “Jesiamar” pada tahun 2020. Maharani menjadi guru sejarah SMA Darul Quran Singosari pada tahun 2020-2021. Saran dan pertanyaan dapat anda kirimkan kepada Maharani melalui email: maharaniarya12@gmail.com.';
}
