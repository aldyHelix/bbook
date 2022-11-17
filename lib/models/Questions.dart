import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

/// 1.B
/// 2.C
/// 3.B
/// 4.B
/// 5.E
/// 6.A
/// 7.A
/// 8.C
/// 9.E
/// 10.C
/// 11.E
/// 12.A
/// 13.A
/// 14.A
/// 15.D
/// 16.A
/// 17.A
/// 18.D
/// 19.B
/// 20.A
/// 21.A
/// 22.B
/// 23.B
/// 24.A
/// 25.A
/// 26.B
/// 27.E
/// 28.A
/// 29.E
/// 30.A

class Question {
  final int id, answer;
  final String question, header, image;
  final List<String> options;

  Question(
      {required this.id,
      required this.question,
      required this.answer,
      required this.options,
      required this.header,
      required this.image});
}

const List sample_data = [
  {
    "id": 1,
    "header": "Perhatikan gambar di bawah ini!",
    "question":
        "Bagaimana pendapatmu tentang manusia dan dinosaurus yang hidup berdampingan sebagaimana di film-film?",
    "image": "images/quiz/Picture1.png",
    "options": [
      'Itu benar karena ditemukannya fosil manusia yang sezaman dengan fosil dinosaurus.',
      'Itu tidak benar karena keduanya hidup pada zaman yang berbeda.',
      'Itu benar karena manusia zaman dahulu memiliki tinggi yang sangat besar yang setara dengan dinosaurus.',
      'Itu tidak benar karena manusia purba berusaha menjauhi lokasi adanya dinosaurus hidup agar tetap aman.',
      'Itu tidak benar karena tidak ada bukti yang menunjukkan adanya dinosaurus di masa lalu.'
    ],
    "answer_index": 1,
  },
  {
    "id": 2,
    "header": "",
    "question": "Pengertian prasejarah yang paling tepat adalah?",
    "image": "",
    "options": [
      'Masa yang dimulai sejak bumi terbentuk hingga kemunculan manusia modern.',
      'Masa yang dimulai sejak adanya manusia hingga dimulainya revolusi kebudayaan.',
      'Masa yang dimulai sejak kemunculan manusia sampai adanya keterangan-keterangan tertulis.',
      'Masa yang dimulai sejak kemunculan manusia di bumi hingga ditemukannya teknologi penakhlukkan api.',
      'Masa yang dimulai sejak adanya peristiwa glasial dan glasial di bumi'
    ],
    "answer_index": 2,
  },
  {
    "id": 3,
    "header": "",
    "question":
        "Berikut ini adalah cara yang dapat dilakukan untuk mengetahui informasi terkait masa prasejarah, kecuali",
    "image": "",
    "options": [
      'Dengan memelajari fosil manusia purba',
      'Dengan memelajari sumber tertulis sezaman',
      'Dengan memelajari alat perkakas yang diciptakannya',
      'Dengan memelajari artefak yang ditinggalkannya',
      'Dengan memelajari lapisan tanah tempat ditemukannya peninggalan zaman prasejarah'
    ],
    "answer_index": 1,
  },
  {
    "id": 4,
    "header": "",
    "question":
        "Salah satu jenis manusia purba adalah Homo erectus. Manusia purba jenis ini mulanya sering disebut dengan istilah Pithecanthropus erectus. Pithecanthropus erectus artinya …",
    "image": "",
    "options": [
      'Manusia besar Jawa.',
      'Manusia kera yang berjalan tegak.',
      'Manusia kera dari Mojokerto.',
      'Manusia pintar.',
      'Manusia bijak.'
    ],
    "answer_index": 1,
  },
  {
    "id": 5,
    "header": "",
    "question": "Manusia purba muncul pada kala …",
    "image": "",
    "options": [
      'Holosen',
      'Archaekum',
      'Mesozoikum',
      'Paleozoikum',
      'Plestosen'
    ],
    "answer_index": 4,
  },
  {
    "id": 6,
    "header": "",
    "question":
        "Menurut penelitian, perubahan iklim membawa Plestosen kepada setidaknya tujuh kali masa glasial dan interglasial. Apa yang dimaksud dengan masa glasial?",
    "image": "",
    "options": [
      'Masa ketika suhu bumi turun dan dengan demikian gletser meluas di seluruh permukaan bumi.',
      'Masa ketika suhu bumi naik kembali sehingga laut dengan kedalaman 60-100 meter kembali tergenang air.',
      'Masa ketika terjadinya musim penghujan pada sebagian wilayah di bumi.',
      'Masa ketika tidak adanya kehidupan di permukaan bumi yang disebabkan oleh suhu bumi yang terlalu tinggi.',
      'Masa ketika suhu bumi meninggi dan menyebabkan meluasnya gletser di seluruh permukaan bumi.'
    ],
    "answer_index": 0,
  },
  {
    "id": 7,
    "header": "",
    "question":
        "Harry Widianto  (2019) mengelompokkan taksonomi modern Homo erectus di Indonesia menjadi beberapa jenis. Jenis Homo erectus yang paling banyak di temukan di Indonesia adalah …",
    "image": "",
    "options": [
      'Homo erectus tipik.',
      'Homo erectus progresif.',
      'Homo erectus arkaik.',
      'Homo habilis.',
      'Homo erectus modjokertensis.'
    ],
    "answer_index": 0,
  },
  {
    "id": 8,
    "header": "",
    "question":
        "Teori Out of Africa merupakan teori yang menjelaskan bahwa manusia purba mulanya berasal dari Afrika dan kemudian melakukan migrasi ke berbagai daerah di dunia. Informasi yang tepat terkait teori ini adalah …",
    "image": "",
    "options": [
      'Proses migrasi manusia purba tidak dipengaruhi oleh keadaan alam ataupun iklim.',
      'Australopithecus merupakan manusia purba yang hanya hidup dan berkembang di luar Afrika.',
      'Homo erectus merupakan jenis manusia pertama yang berhasil melakukan migrasi ke luar Afrika.',
      'Pada teori Out of Africa jilid I, Homo sapiens tidak melakukan perjalanan ke luar Afrika.',
      'Homo sapiens merupakan jenis manusia yang tidak berhasil melakukan perjalanan ke luar wilayah Afrika.'
    ],
    "answer_index": 2,
  },
  {
    "id": 9,
    "header": "",
    "question":
        "Pada 150.000 tahun yang lalu Homo erectus mengalami kepunahan. Hipotesis terkait sebab-sebab kepunahan Homo erectus adalah sebagai berikut ini, kecuali…",
    "image": "",
    "options": [
      'Hujan tektit.',
      'Erupsi gunung berapi.',
      'Perubahan lingkungan.',
      'Iklim yang ekstrim.',
      'Bumi Bola Salju'
    ],
    "answer_index": 4,
  },
  {
    "id": 10,
    "header": "",
    "question":
        "Pada peristiwa Out of Africa jilid II, Homo sapiens melakukan migrasi dalam beberapa gelombang. Manusia purba di wilayah Indonesia yang tergolong Homo sapiens awal adalah…",
    "image": "",
    "options": [
      'Australopithecus.',
      'Meganthropus paleojavanicus',
      'Homo floresiensis',
      'Homo erectus modjokertensis',
      'Homo soloensis'
    ],
    "answer_index": 2,
  },
  {
    "id": 11,
    "header": "",
    "question": "Apa yang dimaksud dengan “ras”?",
    "image": "",
    "options": [
      'Pengelompokkan manusia yang didasarkan oleh perbedaan status sosial.',
      'Pengelompokkan manusia yang didasarkan oleh perbedaan mata pencaharian.',
      'Pengelompokkan manusia yang didasarkan oleh perbedaan agama.',
      'Pengelompokkan manusia yang didasarkan oleh perbedaan wilayah pemukiman.',
      'Pengelompokkan manusia yang didasarkan oleh perbedaan ciri biologis.'
    ],
    "answer_index": 4,
  },
  {
    "id": 12,
    "header": "",
    "question":
        "Leluhur bangsa Indonesia diyakini berasal dari Afrika. Mereka melakukan persebaran ke daerah Melanesia di kepulauan Bisma, hingga sampai ke papua. Mereka adalah ras ...",
    "image": "",
    "options": [
      'Australomelanesid',
      'Austroasiatik',
      'Austronesia',
      'Mongoloid',
      'Kaukasoid'
    ],
    "answer_index": 0,
  },
  {
    "id": 13,
    "header": "",
    "question":
        "Bangsa yang memiliki ciri fisik berupa kulit kehitaman, berbadan kekar, hidung lebar, tengkorak yang cenderung lonjong, dan geraham yang besar adalah …",
    "image": "",
    "options": [
      'Australomelanesid',
      'Austroasiatik',
      'Austronesia',
      'Mongoloid',
      'Kaukasoid'
    ],
    "answer_index": 0,
  },
  {
    "id": 14,
    "header": "Perhatikan gambar berikut!",
    "question":
        "Gambar tersebut menunjukkan salah satu ciri khas dari suatu ras yaitu...",
    "image": "images/quiz/Picture4.png",
    "options": [
      'Australomelanesid',
      'Austroasiatik',
      'Austronesia',
      'Mongoloid',
      'Kaukasoid'
    ],
    "answer_index": 0,
  },
  {
    "id": 15,
    "header": "",
    "question":
        "Pada beberapa temuan, peneliti menemukan bentuk penguburan terlipat, yaitu penguburan dengan posisi seperti bayi dalam perut ibu sebelum dilahirkan. Makna dari penguburan terlipat itu adalah...",
    "image": "",
    "options": [
      'Sebagai bentuk kesedihan seseorang atau suatu kaum karena ditinggal meninggal oleh orang atau kerabat dekat.',
      'Melambangkan siklus kehidupan yang asal mulanya dari timur dan berakhir di barat.',
      'Setelah kematian tubuh kembali bersatu dengan alam atau kosmos.',
      'Diharapkan saat kematian individu tersebut dibebaskan dari belenggu duniawi dan kembali suci tanpa dosa.',
      'Untuk membantu mempercepat proses pelepasan jiwa dari raga lamanya yang sudah tidak berguna lagi.'
    ],
    "answer_index": 3,
  },
  {
    "id": 16,
    "header": "",
    "question":
        "Menurut teori Kern dan teori Von Heine Geldern, leluhur bangsa Indonesia adalah bangsa Austronesia. Mereka mulai melakukan migrasi ke Nusantara pada masa...",
    "image": "",
    "options": [
      'Neolitikum',
      'Neozoikum',
      'Paleolitikum',
      'Paleozoikum',
      'Archaekum'
    ],
    "answer_index": 0,
  },
  {
    "id": 17,
    "header": "",
    "question":
        "Ras Mongoloid yang datang ke Nusantara dapat di kelompokkan menjadi dua ras, yaitu ras Austro-asiatik dan Austronesia. Ras Austroasiatik masuk ke Nusantara melalui jalur...",
    "image": "",
    "options": [
      'Asia Tenggara daratan',
      'Taiwan',
      'Timur Tengah',
      'Australia',
      'Melanesia'
    ],
    "answer_index": 0,
  },
  {
    "id": 18,
    "header": "",
    "question":
        "Perhatikan keterangan berikut! 1)Mengenal pengetahuan tentang pertanian awal. 2)Mengenal pengetahuan tentang domestikasi binatang. 3)Mengenal pengetahuan tentang pembuatan gerabah. 4)Mengenal tradisi penguburan terlipat. 5)Ahli dalam bidang pelayaran dengan teknologi perahu bercadiknya. Informasi yang tidak tepat mengenai ras Austronesia adalah...",
    "image": "",
    "options": ['1', '2', '3', '4', '5'],
    "answer_index": 3,
  },
  {
    "id": 19,
    "header": "",
    "question":
        "Pada perjalanannya menuju wilayah Madagaskar, ras Austronesia melalui beberapa daerah di Indonesia dan kemudian mendominasi populasi yang ada di wilayah tersebut. Wilayah yang dimaksud adalah berikut ini, kecuali...",
    "image": "",
    "options": ['Sulawesi', 'Papua', 'Kalimantan', 'Jawa', 'Sumatera'],
    "answer_index": 1,
  },
  {
    "id": 20,
    "header": "Perhatikan gambar berikut!",
    "question":
        "Ditinjau dari ciri fisiknya, orang tersebut dapat digolongkan kedalam ras ...",
    "image": "images/quiz/Picture2.png",
    "options": [
      'Australomelanesid',
      'Austroasiatik',
      'Austronesia',
      'Mongoloid',
      'Kaukasoid'
    ],
    "answer_index": 0,
  },
  {
    "id": 21,
    "header": "",
    "question":
        "Berdasarkan konsep yang dikemukakan Thomsen, zaman prasejarah dibagi menjadi zaman batu, zaman perunggu, dan zaman besi. Mengapa konsep three age system ini juga dikenal dengan konsep teknologis?",
    "image": "",
    "options": [
      'Karena pembabakan ditinjau dari perkembangan teknik pembuatan alat manusia prasejarah.',
      'Karena pada masa itu manusia purba belum mengenal teknologi.',
      'Karena menggambarkan bahwa teknologi yang dikuasai manusia purba masih sangat sederhana.',
      'Karena konsep itu merujuk pada masa ketika manusia purba belum mengenal teknik pembuatan alat apapun.',
      'Karena pada masa itu teknlogi belum memberikan dampak yang signifikan terhadap kehidupan manusia purba.'
    ],
    "answer_index": 0,
  },
  {
    "id": 22,
    "header": "",
    "question":
        "Jejak pemukiman manusia purba sering kali ditemukan di sekitar aliran air dan gua. Mengapa mereka memilih lokasi tersebut?",
    "image": "",
    "options": [
      'Tidak ada alasan khusus, mereka bermukim tanpa meninjau lokasi',
      'Di sekitar aliran air dan gua menyediakan perlindungan, keamanan dan sumber makanan.',
      'Benda yang berada di aliran air tidak mengalami pelapukkan sehingga masih bisa ditemukan oleh manusia di masa depan.',
      'Mereka berusaha menjauhi wilayah-wilayah yang kaya akan sumber makanan.',
      'Karena dalam kepercayaan mereka aliran air dan gua merupakan tempat yang dilindungi roh leluhur.'
    ],
    "answer_index": 1,
  },
  {
    "id": 23,
    "header": "",
    "question":
        "Berdasarkan pola huniannya, kehidupan masa prasejarah yang berpindah-pindah dikenal dengan istilah…",
    "image": "",
    "options": [
      'Food gathering',
      'Nomaden',
      'Abris Sous Roche',
      'Primus interpares',
      'Kjokkenmodinger'
    ],
    "answer_index": 1,
  },
  {
    "id": 24,
    "header": "",
    "question":
        "Pada masa berburu dan meramu manusia purba mencari sumber makanan di alam atau biasa dikenal dengan istilah …",
    "image": "",
    "options": [
      'Food gathering',
      'Nomaden',
      'Abris Sous Roche',
      'Primus interpares',
      'Kjokkenmodinger'
    ],
    "answer_index": 0,
  },
  {
    "id": 25,
    "header": "",
    "question":
        "Kepercayaan bahwa roh leluhur memiliki kekuatan magis yang dapat memengaruhi kehidupan manusia yang masih hidup adalah…",
    "image": "",
    "options": [
      'Animisme',
      'Dinamisme',
      'Totemisme',
      'Atheisme',
      'Politheisme'
    ],
    "answer_index": 0,
  },
  {
    "id": 26,
    "header": "",
    "question":
        "Ilustrasi dibawah ini yang menunjukkan adanya praktik dinamisme adalah...",
    "image": "",
    "options": [
      'Miya tersenyum puas membayangkan dirinya yang akan segera berubah menjadi kaya raya setelah membeli jimat penglaris dari dukun itu.',
      'Mbah Nurman selalu meletakkan kopi di depan rumah pada malam jum’at legi karena beliau percaya bahwa roh ayahnya yang telah meninggal akan datang berkunjung.',
      'Semalaman Sandara meringkuk ketakutan mendengar suara gagak berputar di sekitar rumahnya. Dia yakin ini adalah pertanda bahwa besok akan ada orang yang meninggal.',
      'Doni selalu menggunakan cincin bermata hijau pemberian ibunya. Dia bilang jodohnya akan segera datang jika cincin itu terpasang dijarinya selama sebulan.',
      'Fiki yang ceroboh telah membawa pulang batu nisan keramat itu. Entah apa yang akan terjadi pada nasib kami setelah malam ini.'
    ],
    "answer_index": 1,
  },
  {
    "id": 27,
    "header": "",
    "question":
        "Pada masa Mesolitikum berkembang 3 tradisi pokok pembuatan alat di Indonesia yaitu Toala Culture, Sampung Bone Culture, dan Sumatralith. Jelaskan apa yang dimaksud dengan Sampung Bone Culture?",
    "image": "",
    "options": [
      'Sampah kerang dan siput yang menumpuk dan menjadi bukit.',
      'Peninggalan dari zaman prasejarah berupa alat-alat perunggu yang ditemukan di dalam gua purba.',
      'Pipisan (alat penggiling) dari batu yang digunakan untuk menumbuk dan menghaluskan bahan makanan.',
      'Hasil kebudayaan berupa batu-batu besar yang digunakan sebangai sarana menjalankan ritual.',
      'Kebudayaan alat-alat tulang yaitu alat-alat ciptaan manusia purba dari bahan dasar tulang.'
    ],
    "answer_index": 4,
  },
  {
    "id": 28,
    "header": "",
    "question":
        "Masa Neolitikum dianggap sebagai masa revolusi kehidupan masa prasejarah. Mengapa demikian?",
    "image": "",
    "options": [
      'Karena pada masa itu dikenal teknologi bercocok tanam yang baik (food producing).',
      'Karena pada masa Neolitikum manusia purba sudah mampu menciptakan alat-alat yang terbuat dari tulang.',
      'Karena pada masa Neolitikum manusia purba mengenal tradisi penguburan jasad kerabat yang meninggal.',
      'Karena pada masa Neolitikum manusia purba hanya mampu memburu dan meramu sumber makanan.',
      'Karena pada masa Neolitikum manusia purba mulai mengetahui bahwa hewan-hewan laut juga bisa dikonsumsi.'
    ],
    "answer_index": 0,
  },
  {
    "id": 29,
    "header": "Perhatikan gambar berikut ini!",
    "question":
        "Gambar tersebut adalah salah satu peninggalan masa prasejarah yaitu…",
    "image": "images/quiz/Picture3.png",
    "options": ['Nekara', 'Alat-alat Serpih', 'Dolmen', 'Sarkofagus', 'Menhir'],
    "answer_index": 4,
  },
  {
    "id": 30,
    "header": "",
    "question":
        "Berikut ini merupakan contoh alat-alat Paleometalik yang dihasilkan oleh manusia purba pada masa perundagian adalah…",
    "image": "",
    "options": ['Nekara', 'Alat-alat Serpih', 'Dolmen', 'Sarkofagus', 'Menhir'],
    "answer_index": 0,
  },
];
