import 'package:apps_muhamad_mashudi_ardi_winata/soal_4_5/entity/random_photo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Soal5Page extends StatelessWidget {
  final RandomPhoto randomPhoto;
  const Soal5Page({super.key, required this.randomPhoto});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Soal 5'),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black,
                  width: 1.0,
                  style: BorderStyle.solid,
                ),
              ),
              child: Row(
                children: [
                  Image.network(
                    randomPhoto.thumbnailUrl ??
                        'https://docs.flutter.dev/assets/images/dash/dash-fainting.gif',
                    height: 125,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 16,
                        ),
                        Text('ID : ${randomPhoto.id}'),
                        const SizedBox(
                          height: 16,
                        ),
                        Text(
                          randomPhoto.title ?? '',
                          maxLines: 2,
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Text('ALBUM ID : ${randomPhoto.albumId}'),
                        const SizedBox(
                          height: 16,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Container(
            padding: const EdgeInsets.all(
              16,
            ),
            child: Image.network(
              randomPhoto.url ??
                  'https://docs.flutter.dev/assets/images/dash/dash-fainting.gif',
            ),
          )
        ],
      ),
    );
  }
}
