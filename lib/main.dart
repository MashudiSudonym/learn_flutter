import 'package:apps_muhamad_mashudi_ardi_winata/learn_hive/info_page.dart';
import 'package:apps_muhamad_mashudi_ardi_winata/learn_hive/people.dart';
import 'package:apps_muhamad_mashudi_ardi_winata/soal_1_a_page.dart';
import 'package:apps_muhamad_mashudi_ardi_winata/soal_1_b_page.dart';
import 'package:apps_muhamad_mashudi_ardi_winata/soal_1_c_page%20.dart';
import 'package:apps_muhamad_mashudi_ardi_winata/soal_2_page.dart';
import 'package:apps_muhamad_mashudi_ardi_winata/soal_3_page.dart';
import 'package:apps_muhamad_mashudi_ardi_winata/soal_4_5/soal_4_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(PeopleAdapter());
  await Hive.openBox('peopleBox');
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final arr = [
      'Kota Surabaya',
      'kota Medan',
      'kab. Malang',
      'Kab. Sidoarjo',
      'KOTA JAKARTA',
      'KAB. Banyuwangi',
      'KOTA Banjarmasin',
      'Kab. Gresik',
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('App Test'),
      ),
      body: ListView(
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return Soal1APage(
                      cityArray: arr,
                    );
                  },
                ),
              );
            },
            child: const Text('Soal No. 1 A'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return Soal1BPage(
                      cityArray: arr,
                    );
                  },
                ),
              );
            },
            child: const Text('Soal No. 1 B'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return Soal1CPage(
                      cityArray: arr,
                    );
                  },
                ),
              );
            },
            child: const Text('Soal No. 1 C'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return const Soal2Page();
                  },
                ),
              );
            },
            child: const Text('Soal No. 2'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return const Soal3Page();
                  },
                ),
              );
            },
            child: const Text('Soal No. 3'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return const ProviderScope(child: Soal4Page());
                  },
                ),
              );
            },
            child: const Text('Soal No. 4 dan 5'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return const InfoPage();
                  },
                ),
              );
            },
            child: const Text('Learn Hive'),
          ),
        ],
      ),
    );
  }
}
