import 'dart:developer';

import 'package:flutter/material.dart';

class Soal2Page extends StatefulWidget {
  const Soal2Page({super.key});

  @override
  State<Soal2Page> createState() => _Soal2PageState();
}

class _Soal2PageState extends State<Soal2Page> {
  List<Widget> arrayWidget = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Soal 2'),
      ),
      body: ListView(
        children: [
          ElevatedButton(
            onPressed: () {
              setState(() {
                arrayWidget.add(
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black,
                        width: 1.0,
                        style: BorderStyle.solid,
                      ),
                    ),
                    child: const Center(
                      child: Image(
                        image: AssetImage('assets/phone.png'),
                      ),
                    ),
                  ),
                );
              });

              log(arrayWidget.toString(), level: 0, name: 'Log Screen 2');
            },
            child: const Row(
              children: [
                Image(
                  image: AssetImage('assets/add.png'),
                  height: 15,
                ),
                SizedBox(
                  width: 16,
                ),
                Text(
                  'Tambah',
                ),
              ],
            ),
          ),
          GridView.extent(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            maxCrossAxisExtent: 200.0, // maximum item width
            mainAxisSpacing: 8.0, // spacing between rows
            crossAxisSpacing: 8.0, // spacing between columns
            padding: const EdgeInsets.all(8.0), // padding around the grid
            children: arrayWidget.map((e) => e).toList(),
          ),
        ],
      ),
    );
  }
}
