import 'package:apps_muhamad_mashudi_ardi_winata/learn_hive/add_page.dart';
import 'package:apps_muhamad_mashudi_ardi_winata/learn_hive/update_page.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class InfoPage extends StatefulWidget {
  const InfoPage({super.key});

  @override
  State<InfoPage> createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  late final Box contactBox;

  _deleteInfo(int index) {
    contactBox.deleteAt(index);
  }

  @override
  void initState() {
    super.initState();
    contactBox = Hive.box('peopleBox');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('People Info'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const AddPage(),
          ),
        ),
        child: const Icon(Icons.add),
      ),
      body: ValueListenableBuilder(
        valueListenable: contactBox.listenable(),
        builder: (
          context,
          Box box,
          widget,
        ) {
          if (box.isEmpty) {
            return const Center(
              child: Text('Empty'),
            );
          } else {
            return ListView.builder(
              itemCount: box.length,
              itemBuilder: (context, index) {
                var peopleData = box.getAt(index);

                return InkWell(
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => UpdatePage(
                        index: index,
                        people: peopleData,
                      ),
                    ),
                  ),
                  child: ListTile(
                    title: Text(
                      peopleData.name.toString(),
                    ),
                    subtitle: Text(
                      peopleData.country.toString(),
                    ),
                    trailing: IconButton(
                      onPressed: () => _deleteInfo(index),
                      icon: const Icon(
                        Icons.delete,
                        color: Colors.red,
                      ),
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
