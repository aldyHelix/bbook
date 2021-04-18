import 'package:bbook/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:drop_cap_text/drop_cap_text.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';

class MateriView extends StatelessWidget {
  final String materiQrCode;

  MateriView({Key key, @required this.materiQrCode}) : super(key: key);

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
        padding: EdgeInsets.only(top: MediaQuery.of(context).size.width * 0.17),
      ),
    );

    final text = Html(
      data: """<div>
        <h1>Demo Page</h1>
        <p>This is a fantastic product that you should buy!</p>
        <h3>Features</h3>
        <ul>
          <li>It actually works</li>
          <li>It exists</li>
          <li>It doesn't cost much!</li>
        </ul>
        <!--You can pretty much put any html in here!-->
      </div>""",
    );

    final drawLine = Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        height: 4.0,
        width: 130.0,
      ),
    );

    final playButton = Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: ElevatedButton(
        onPressed: () {
          //Navigator.of(context).pop();
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => Dashboard()),
          );
        },
        child: Container(
          child: Text(
            "Play Video Materi".toUpperCase(),
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
      ),
    );

    final body = ListView(
      shrinkWrap: true,
      children: <Widget>[
        Align(
          child: Container(
            padding: EdgeInsets.only(
              //top: MediaQuery.of(context).size.height / 4,
              left: 24.0,
              right: 24.0,
              bottom: 24.0,
            ),
            child:
                //contenthere
                text,
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: 60,
            width: 60,
            child: SvgPicture.asset('images/icons/book.svg'),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
              padding:
                  EdgeInsets.only(right: 25, left: 25, bottom: 25, top: 15),
              child: playButton),
        ),
      ],
    );

    final appBarCollapse = NestedScrollView(
      body: body,
      floatHeaderSlivers: true,
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return <Widget>[
          SliverToBoxAdapter(
            child: Container(
              decoration: BoxDecoration(
                color: HexColor('#F7DFD4'),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40),
                ),
              ),
              child: Column(
                children: [
                  backButton,
                  Padding(
                    padding: const EdgeInsets.fromLTRB(25, 10, 20, 25),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Archaekum",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    child: Builder(builder: (context) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            child: DropCapText(
                              'Kondisi alam akan memengaruhi kehidupan manusia yang ada di dalamnya. Semua perubahan alam secara langsung atau tidak langsung telah memengaruhi cara hidup manusia. Hal yang berlangsung setelahnya mungkin senada dengan konsep seleksi alam yang ditawarkan Charles Darwin (2003) bahwa daerah yang mengalami sedikit perubahan fisik, akan mempengaruhi berlangsungnya seleksi alam. Sejak terbentuk, bumi senantiasa mengalami perubahan dan perkembangan. Untuk lebih mudah dalam mengaji peristiwa dan perkembangan bumi dalam sejarah secara kronologis perlu adanya periodeisasi atau pembabakan, yaitu berdasarkan geologi. “Geologi adalah suatu bidang Ilmu Pengetahuan Kebumian yang mempelajari segala sesuatu mengenai planet bumi beserta isinya yang pernah ada” (Ansosry, 2016: 26)',
                              style: TextStyle(fontSize: 14, height: 1.4),
                              dropCapPadding:
                                  EdgeInsets.only(right: 21, bottom: 16),
                              dropCap: DropCap(
                                width: 150,
                                height: 200,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Image(
                                    alignment: Alignment.centerLeft,
                                    image: AssetImage('images/image1.png'),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            padding: const EdgeInsets.fromLTRB(25, 10, 20, 50),
                          ),
                        ],
                      );
                    }),
                    // ignore: missing_return
                  ),
                  drawLine,
                ],
              ),
            ),
          ),
        ];
      },
    );

    return Scaffold(
      body: appBarCollapse,
    );
  }
}
