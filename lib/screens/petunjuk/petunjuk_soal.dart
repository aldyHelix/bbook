import 'package:bbook/screens/quiz/quiz_screen.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:bbook/constants.dart';

class PetunjukSoal extends StatelessWidget {
  const PetunjukSoal({Key? key}) : super(key: key);

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
          height: MediaQuery.of(context).size.height,
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
                      child: Text('PETUNJUK PENGERJAAN SOAL'),
                    ),
                    Divider(thickness: 1.5),
                    RichText(
                      text: const TextSpan(
                        style: TextStyle(color: Colors.black),
                        text:
                            "Bacalah langkah-langkah di bawah ini sebelum mengerjakan soal-soal pada laman",
                        children: <TextSpan>[
                          TextSpan(
                            text: 'Quiz',
                            style: TextStyle(
                                color: Colors.black,
                                fontStyle: FontStyle.italic),
                          ),
                          TextSpan(
                            text: '.',
                          ),
                        ],
                      ),
                    ),
                    Text(
                      '1. Pastikan kamu sudah memahami materi yang telah diulas pada aplikasi B-book.',
                      maxLines: 15,
                      softWrap: true,
                    ),
                    Text(
                      '2. Jika merasa sudah siap, buka laman Quiz.',
                      maxLines: 15,
                      softWrap: true,
                    ),
                    Text(
                      '3. Akan muncul soal untuk Bab I, soal untuk bab II, dan soal untuk bab III. Kerjakan soal-soal tersebut secara berurutan.',
                      maxLines: 15,
                      softWrap: true,
                    ),
                    Text(
                      '4. Total soal ada 30 butir dan akan disajikan satu-persatu. Masing-masing soal memiliki batas waktu 60 detik untuk dijawab. Jawablah pertanyaan dengan tepat sebelum durasi berakhir.',
                      maxLines: 15,
                      softWrap: true,
                    ),
                    Text(
                      '5. Perhatikan layar soal. Jika jawabanmu benar maka teks akan berubah warna menjadi hijau, sedangkan jika jawabanmu salah maka teks akan berubah menjadi merah.',
                      maxLines: 15,
                      softWrap: true,
                    ),
                    Text(
                      '6. Setelah kamu menjawab semua soal, akan tersedia skor akhirmu pada akhir pertanyaan. Tangkap layar (screenshot) skor akhirmu dan tunjukkan pada guru untuk pendataan nilai.',
                      maxLines: 15,
                      softWrap: true,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 18.0),
              ElevatedButton(
                onPressed: () {
                  //Navigator.of(context).pop();
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => QuizScreen()),
                  );
                },
                child: Container(
                  child: Text(
                    "Mulai Quiz".toUpperCase(),
                    style: TextStyle(fontSize: 19),
                    textAlign: TextAlign.center,
                  ),
                  height: 55,
                  alignment: Alignment.center,
                ),
                style: ButtonStyle(
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                      side: BorderSide(color: HexColor('#E2B091')),
                    ),
                  ),
                  backgroundColor:
                      MaterialStateProperty.all<Color>(HexColor('#E2B091')),
                ),
              )
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
