import 'package:apps_muhamad_mashudi_ardi_winata/soal_4_5/provider/get_photo_random_provider.dart';
import 'package:apps_muhamad_mashudi_ardi_winata/soal_4_5/soal_5_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Soal4Page extends ConsumerWidget {
  const Soal4Page({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var asyncPhotoRandom = ref.watch(getPhotoRandomProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Soal 4',
        ),
      ),
      body: ListView(
        children: [
          ...(asyncPhotoRandom.whenOrNull(
                data: (data) => data
                    .map((e) => ListTile(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) {
                                  return Soal5Page(
                                    randomPhoto: e,
                                  );
                                },
                              ),
                            );
                          },
                          leading: Image.network(
                            e.thumbnailUrl ??
                                'https://docs.flutter.dev/assets/images/dash/dash-fainting.gif',
                          ),
                          title: Text(e.id.toString()),
                          subtitle: Text(e.title.toString()),
                        ))
                    .toList(),
                error: (error, stackTrace) => [
                  const Center(
                    child: Text(
                      'No Network',
                    ),
                  ),
                ],
                loading: () => [
                  const Center(
                    child: CircularProgressIndicator.adaptive(),
                  ),
                ],
              ) ??
              []),
        ],
      ),
    );
  }
}
