import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

Future<List<Question>> fetchQuiz() async {
  //return http.get(Uri.parse('https://https://bbook-application.xyz/api/quiz'));
  final response =
      await http.get(Uri.parse('https://bbook-application.xyz/api/quiz'));
  //return response.body;
  final result = response.body;
  return parseQuiz(result);
}

List<Question> parseQuiz(String responseBody) {
  final data = jsonDecode(responseBody);
  final parsed = data['data'].cast<Map<String, dynamic>>();

  return parsed.map<Question>((json) => Question.fromJson(json)).toList();
}

class Question {
  final int id, answer;
  final String question;
  final List<String> options;

  Question({this.id, this.question, this.answer, this.options});

  factory Question.fromJson(Map<String, dynamic> json) {
    int questionAnswer;
    if (json["answer"] == "A") {
      questionAnswer = 1;
    } else if (json["answer"] == "B") {
      questionAnswer = 2;
    } else if (json["answer"] == "C") {
      questionAnswer = 3;
    } else if (json["answer"] == "D") {
      questionAnswer = 4;
    } else if (json["answer"] == "E") {
      questionAnswer = 5;
    }

    return Question(
      id: json['id'],
      question: json['question_text'],
      answer: questionAnswer,
      options: [
        json["text_option_a"],
        json["text_option_b"],
        json["text_option_c"],
        json["text_option_d"],
        json["text_option_e"],
      ],
    );
  }
}

// ignore: non_constant_identifier_names
// List sample_data = [
//   fetchQuiz().then((_question) {
//     print(_question);
//     sample_data = _question;
//   })
// ];

const List sample_data = [
  {
    "id": 1,
    "question": "Pengertian prasejarah yang paling tepat adalah?",
    "options": [
      'Masa yang dimulai sejak bumi terbentuk hingga kemunculan manusia modern',
      'Masa yang dimulai sejak adanya manusia hingga dimulainya revolusi kebudayaan',
      'Masa yang dimulai sejak kemunculan manusia sampai adanya keterangan-keterangan tertulis',
      'Masa yang dimulai sejak kemunculan manusia di bumi hingga ditemukannya teknologi penakhlukkan api',
      'Masa yang dimulai sejak adanya peristiwa glasial dan glasial di bumi'
    ],
    "answer_index": 3,
  },
  {
    "id": 2,
    "question":
        "Berikut ini adalah cara yang dapat dilakukan untuk mengetahui informasi terkait masa prasejarah, kecuali",
    "options": [
      'Dengan memelajari fosil manusia purba',
      'Dengan memelajari sumber tertulis sezaman',
      'Dengan memelajari alat perkakas yang diciptakannya',
      'Dengan memelajari artefak yang ditinggalkannya',
      'Dengan memelajari lapisan tanah tempat ditemukannya peninggalan zaman prasejarah'
    ],
    "answer_index": 2,
  },
  {
    "id": 2,
    "question":
        "Berikut ini adalah cara yang dapat dilakukan untuk mengetahui informasi terkait masa prasejarah, kecuali",
    "options": [
      'Dengan memelajari fosil manusia purba',
      'Dengan memelajari sumber tertulis sezaman',
      'Dengan memelajari alat perkakas yang diciptakannya',
      'Dengan memelajari artefak yang ditinggalkannya',
      'Dengan memelajari lapisan tanah tempat ditemukannya peninggalan zaman prasejarah'
    ],
    "answer_index": 2,
  },
  {
    "id": 3,
    "question":
        "Bagamana pendapatmu tentang manusia dan dinosaurus yang hidup berdampingan sebagaimana di film-film?",
    "options": [
      'Itu benar karena ditemukannya fosil manusia yang sezaman dengan fosil dinosaurus.',
      'Itu tidak benar karena keduanya hidup pada zaman yang berbeda.',
      'Itu benar karena manusia zaman dahulu memiliki tinggi yang sangat besar yang setara dengan dinosaurus.',
      'Itu tidak benar karena manusia purba berusaha menjauhi lokasi adanya dinosaurus hidup agar tetap aman.',
      'Itu tidak benar karena tidak ada bukti yang menunjukkan adanya dinosaurus di masa lalu.'
    ],
    "answer_index": 2,
  },
  {
    "id": 4,
    "question":
        "Berikut ini yang merupakan karakteristik Meganthropus paleojavanicus adalah",
    "options": [
      'Mempunyai batang  rahang bawah yang sangat tegap dan geraham yang besar-besar',
      'Otot-otot kunyahnya yang kukuh',
      'Bentuk rahang dan giginya yang besar dan kuat',
      'Pemakan tumbuh-tumbuhan',
      'Mempunyai kemiripan dengan kera'
    ],
    "answer_index": 5,
  },
  {
    "id": 5,
    "question":
        "Jejak pemukiman manusia purba sering kali ditemukan di sekitar aliran air dan gua. Mengapa mereka memilih lokasi tersebut?",
    "options": [
      'Tidak ada alasan khusus, mereka bermukim tanpa meninjau lokasi',
      'Di sekitar aliran air dan gua menyediakan perlindungan, keamanan dan sumber makanan.',
      'Benda yang berada di aliran air tidak mengalami pelapukkan sehingga masih bisa ditemukan oleh manusia di masa depan.',
      'Mereka berusaha menjauhi wilayah-wilayah yang kaya akan sumber makanan.',
      'Karena dalam kepercayaan mereka aliran air dan gua merupakan tempat yang dilindungi roh nenek moyang.'
    ],
    "answer_index": 2,
  },
  {
    "id": 6,
    "question":
        "Berdasarkan pola huniannya, kehidupan masa prasejarah yang berpindah-pindah dikenal dengan istilah…",
    "options": [
      'Food gathering',
      'Nomaden',
      'Abris Sous Roche',
      'Primus interpares',
      'Kjokkenmodinger'
    ],
    "answer_index": 2,
  },
  {
    "id": 7,
    "question":
        "Pada masa berburu dan meramu manusia purba mencari sumber makanan di alam atau biasa dikenal dengan istilah…",
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
    "id": 8,
    "question":
        "Kepercayaan bahwa roh nenek moyang dapat melindungi manusia dari bencana alam, gangguan orang atau binatang, serta menghindarkannya dari kesulitan-kesulitan adalah…",
    "options": [
      'Animisme',
      'Dinamisme',
      'Totemisme',
      'Atheisme',
      'Politheisme'
    ],
    "answer_index": 1,
  },
  {
    "id": 9,
    "question":
        "Salah satu jenis manusia purba adalah Pithecanthropus erectus. Pithecanthropus erectus artinya…",
    "options": [
      'Manusia besar Jawa',
      'Manusia kera yang berjalan tegak',
      'Manusia kera dari Mojokerto',
      'Manusia pintar',
      'Manusia bijak'
    ],
    "answer_index": 2,
  },
  {
    "id": 10,
    "question": "Manusia purba muncul pada zaman…",
    "options": [
      'Holosen',
      'Archaekum',
      'Mesozoikum',
      'Paleozoikum',
      'Plestosen'
    ],
    "answer_index": 5,
  },
  {
    "id": 11,
    "question":
        "Berdasarkan konsep yang dikemukakan Thomsen, zaman prasejarah dibagi menjadi zaman batu, zaman perunggu, dan zaman besi. Mengapa konsep three age system ini juga dikenal dengan konsep teknologis?",
    "options": [
      'Karena pembabakan ditinjau dari perkembangan teknik pembuatan alat manusia prasejarah.',
      'Karena pada masa itu manusia purba belum mengenal teknologi.',
      'C.Karena menggambarkan bahwa teknologi yang dikuasai manusia purba masih sangat sederhana.',
      'Karena konsep itu merujuk pada masa ketika manusia purba belum mengenal teknik pembuatan alat apapun.',
      'Karena pada masa itu teknlogi belum memberikan dampak yang signifikan terhadap kehidupan manusia purba.'
    ],
    "answer_index": 1,
  },
  {
    "id": 12,
    "question":
        "Pada masa Mesolitikum berkembang 3 tradisi pokok pembuatan alat di Indonesia yaitu Toala Culture, Sampung Bone Culture, dan Sumatralith. Jelaskan apa yang dimaksud dengan Sampung Bone Culture?",
    "options": [
      'Sampah kerang dan siput yang menumpuk dan menjadi bukit.',
      'Peninggalan dari zaman prasejarah berupa alat-alat perunggu yang ditemukan di dalam gua purba.',
      'Pipisan (alat penggiling) dari batu yang digunakan untuk menumbuk dan menghaluskan bahan makanan.',
      'Hasil kebudayaan berupa batu-batu besar yang digunakan sebangai sarana menjalankan ritual.',
      'Kebudayaan alat-alat tulang yaitu alat-alat ciptaan manusia purba dari bahan dasar tulang.'
    ],
    "answer_index": 5,
  },
  {
    "id": 13,
    "question":
        "Masa Neolitikum dianggap sebagai masa revolusi kehidupan masa prasejarah. Mengapa demikian?",
    "options": [
      'Karena pada masa itu dikenal teknologi bercocok tanam yang baik (food producing).',
      'Karena pada masa Neolitikum manusia purba sudah mampu menciptakan alat-alat yang terbuat dari tulang.',
      'Karena pada masa Neolitikum manusia purba mengenal tradisi penguburan jasad kerabat yang meninggal.',
      'Karena pada masa Neolitikum manusia purba hanya mampu memburu dan meramu sumber makanan.',
      'Karena pada masa Neolitikum manusia purba mulai mengetahui bahwa hewan-hewan laut juga bisa dikonsumsi'
    ],
    "answer_index": 1,
  },
  {
    "id": 14,
    "question":
        "Gambar tersebut adalah salah satu peninggalan masa prasejarah yaitu…",
    "options": ['Nekara', 'Alat-alat Serpih', 'Dolmen', 'Sarkofagus', 'Menhir'],
    "answer_index": 5,
  },
  {
    "id": 15,
    "question":
        "Berikut ini merupakan contoh alat-alat Paleometalik yang dihasilkan oleh manusia purba pada masa perundagian adalah…",
    "options": ['Nekara', 'Alat-alat Serpih', 'Dolmen', 'Sarkofagus', 'Menhir'],
    "answer_index": 1,
  },
  {
    "id": 16,
    "question":
        "Untuk menyingkap tabir mengenai asal mula nenek moyang bangsa Indonesia, para ahli melakukan kajian yang mendalam dalam berbagai aspek salah satunya yaitu linguistik. Sedangkan berdasarkan kajian linguistik diketahui bahwa…",
    "options": [
      'Adanya keserupaan ragam bahasa Austronesia yaitu bahasa yang terdiri dari bahasa Indonesia, Polinesia, Melanesia, dan Mikronesia',
      'Adanya keserupaan benda peninggalan manusia purba Indonesia dengan manusia purba di kawasan Asia Tenggara',
      'Adanya keserupaan fosil hewan di Indonesia dengan fosil hewan di kawasan Asia.',
      'Adanya keserupaan fosil manusia purba Indonesia dengan fosil manusia purba di kawasan Asia Tenggara',
      'Adanya keserupaan fisik antara penduduk Indonesia dengan masyarakat yang mendiami kawasan Asia Tenggara'
    ],
    "answer_index": 1,
  },
  {
    "id": 17,
    "question":
        "Nenek moyang bangsa Indonesia diyakini berasal dari Bangsa Proto Melayu, Deutro Melayu, Melanesoid, Weddid dan Negroid. Bangsa yang memiliki karakter fisik memiliki karakteristik rambut yang lurus, kulit kuning kecokelatan dan bermata sipit adalah…",
    "options": [
      'Proto Melayu',
      'Deutro Melayu',
      'Melanesoid',
      'Weddid',
      'Negroid'
    ],
    "answer_index": 1,
  },
  {
    "id": 18,
    "question":
        "Mengapa bangsa Deutro Melayu dianggap sebagai bangsa yang membawa kebudayaan Dongson di Indonesia?",
    "options": [
      'Hasil kebudayaan berbahan perunggu mereka memiliki kemiripan dengan budaya Dongson yang merupakan salah satu wilayah di daerah Indocina, Vietnam.',
      'Hasil kebudayaan berbahan batu mereka memiliki kemiripan dengan budaya Dongson yang merupakan salah satu wilayah di daerah Indocina, Kamboja.',
      'Hasil kebudayaan berbahan batu mereka memiliki kemiripan dengan yang ditemukan di Asia Tenggara yaitu  mirip dengan kebudayaan Bacson Hoabinh  dari Tonkin, Vietnam.',
      'Hasil kebudayaan berbahan perunggu mereka memiliki kemiripan dengan yang ditemukan di Asia Tenggara yaitu  mirip dengan kebudayaan Bacson Hoabinh  dari Tonkin, Kamboja.',
      'E.Hasil kebudayaan mereka memiliki kemiripan dengan hasil kebudayaan gerabah Yanan.'
    ],
    "answer_index": 1,
  },
  {
    "id": 19,
    "question":
        "Bangsa yang memiliki ciri fisik berupa kulit yang kehitaman, berbadan kekar, rambut keriting, mulut lebar, dan hidung yang mancung adalah…",
    "options": [
      'Proto Melayu',
      'Deutro Melayu',
      'Melanesoid',
      'Weddid',
      'Negroid'
    ],
    "answer_index": 3,
  },
  {
    "id": 20,
    "question":
        "Suku yang merupakan keturunan dari Bangsa Proto Melayu adalah berikut ini, kecuali..",
    "options": ['Batak', 'Dayak', 'Gayo', 'Toraja', 'Papua'],
    "answer_index": 5,
  },
];
