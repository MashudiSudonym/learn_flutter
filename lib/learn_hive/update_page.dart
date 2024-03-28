import 'package:apps_muhamad_mashudi_ardi_winata/learn_hive/people.dart';
import 'package:apps_muhamad_mashudi_ardi_winata/learn_hive/update_people_form.dart';
import 'package:flutter/material.dart';

class UpdatePage extends StatefulWidget {
  final int index;
  final People people;

  const UpdatePage({
    super.key,
    required this.index,
    required this.people,
  });

  @override
  State<UpdatePage> createState() => _UpdatePageState();
}

class _UpdatePageState extends State<UpdatePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Update Info'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: UpdatePeopleForm(
          index: widget.index,
          people: widget.people,
        ),
      ),
    );
  }
}
