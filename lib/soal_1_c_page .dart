import 'package:flutter/material.dart';

class Soal1CPage extends StatelessWidget {
  final List<String> cityArray;

  const Soal1CPage({super.key, required this.cityArray});

  @override
  Widget build(BuildContext context) {
    var cityWithWord = cityArray
        .where(
          (element) => element.contains(
            RegExp(
              'kab',
              caseSensitive: false,
            ),
          ),
        )
        .map(
          (e) => e.replaceAll(
            RegExp(r'kab', caseSensitive: false),
            'Kabupaten',
          ),
        )
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Soal 1 B',
        ),
      ),
      body: ListView.builder(
        itemCount: cityWithWord.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(
              cityWithWord[index],
            ),
          );
        },
      ),
    );
  }
}
