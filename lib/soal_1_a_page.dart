import 'package:flutter/material.dart';

class Soal1APage extends StatelessWidget {
  final List<String> cityArray;
  const Soal1APage({super.key, required this.cityArray});

  @override
  Widget build(BuildContext context) {
    var cityArrayReversed = cityArray.reversed.toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Soal 1'),
      ),
      body: ListView.builder(
        itemCount: cityArrayReversed.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(
              cityArrayReversed[index],
            ),
          );
        },
      ),
    );
  }
}
