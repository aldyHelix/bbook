import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:bbook/constants.dart';

class Petunjuk extends StatelessWidget {
  const Petunjuk({Key? key}) : super(key: key);

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
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      child: Text('Petunjuk Penggunaan untuk Guru'),
                    ),
                    Divider(thickness: 1.5),
                    RichText(
                      text: const TextSpan(
                        style: TextStyle(color: Colors.black),
                        text:
                            "Untuk memeroleh hasil belajar yang optimal dalam penggunaan bahan ajar ",
                        children: <TextSpan>[
                          TextSpan(
                            text: 'b-book',
                            style: TextStyle(
                                color: Colors.black,
                                fontStyle: FontStyle.italic),
                          ),
                          TextSpan(
                            text:
                                ', maka langkah-langkah yang perlu anda lakukan adalah berikut ini.',
                          ),
                        ],
                      ),
                    ),
                    Text(
                      '1. Siapkan kondisi kelas yang nyaman. Pastikan siswa telah siap menerima pembelajaran.',
                      maxLines: 15,
                      softWrap: true,
                    ),
                    Text(
                      '2. Jelaskan mengenai petunjuk penggunaan aplikasi b-book.',
                      maxLines: 15,
                      softWrap: true,
                    ),
                    Text(
                      '3. Buka laman “Peta Konsep” bantu siswa untuk memahami garis besar materi. Jelaskan mengenai tujuan pembelajaran yang harus dicapai siswa.',
                      maxLines: 15,
                      softWrap: true,
                    ),
                    Text(
                      '4. Buka laman “Materi” dan bimbing siswa memahami setiap ulasan materi.',
                      maxLines: 15,
                      softWrap: true,
                    ),
                    Text(
                      '5. Buka lamann “Video” dan bimbing siswa memahami ulasan video.',
                      maxLines: 15,
                      softWrap: true,
                    ),
                    Text(
                      '6. Buka laman “Quis” dan bimbing siswa mengerjakan setiap soal yang tertera dengan benar. Peringatkan siswa bahwa terdapat batasan waktu untuk setiap soal yang ditampilkan.',
                      maxLines: 15,
                      softWrap: true,
                    ),
                    Text(
                      '7. Bimbing siswa untuk merefleksi pembelajaran.',
                      maxLines: 15,
                      softWrap: true,
                    ),
                    Text(
                      '8. Tutup pembelajaran.',
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
                      child: Text('Petunjuk Penggunaan untuk Siswa'),
                    ),
                    Divider(thickness: 1.5),
                    RichText(
                      text: const TextSpan(
                        style: TextStyle(color: Colors.black),
                        text:
                            "Untuk memeroleh hasil belajar yang optimal dalam penggunaan bahan ajar ",
                        children: <TextSpan>[
                          TextSpan(
                            text: 'b-book',
                            style: TextStyle(
                                color: Colors.black,
                                fontStyle: FontStyle.italic),
                          ),
                          TextSpan(
                            text:
                                ', maka langkah-langkah yang perlu anda lakukan adalah berikut ini.',
                          ),
                        ],
                      ),
                    ),
                    Text(
                      '1. Pastikan anda telah siap menerima pembelajaran.',
                      maxLines: 15,
                      softWrap: true,
                    ),
                    Text(
                      '2. Pahami petunjuk penggunaan aplikasi b-book.',
                      maxLines: 15,
                      softWrap: true,
                    ),
                    Text(
                      '3. Pahami tujuan pembelajaran.',
                      maxLines: 15,
                      softWrap: true,
                    ),
                    Text(
                      '4. Buka dan pahami laman “Peta Konsep”. Laman ini memuat garis besar materi yang tersajikan dalam b-book., kompetensi dasar dan tujuan pembelajaran.',
                      maxLines: 15,
                      softWrap: true,
                    ),
                    Text(
                      '5. Buka laman “Materi” dan pahami setiap ulasan materi. Tanyakan pada guru jika ada bagian yang belum anda pahami.',
                      maxLines: 15,
                      softWrap: true,
                    ),
                    Text(
                      '6. Buka lamann “Video” dan pahami setiap ulasan video.',
                      maxLines: 15,
                      softWrap: true,
                    ),
                    Text(
                      '7. Buka laman “Quis”. Pada bagian ini terdapat soal dengan batasan waktu pengerjaan. Kerjakan soal tersebut untuk menguji pemahaman anda.',
                      maxLines: 15,
                      softWrap: true,
                    ),
                    Text(
                      '8. Tanyakan pada guru jika ada materi yang belum anda pahami.',
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
