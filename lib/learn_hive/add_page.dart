import 'package:apps_muhamad_mashudi_ardi_winata/learn_hive/add_people_form.dart';
import 'package:flutter/material.dart';

class AddPage extends StatefulWidget {
  const AddPage({super.key});

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Add Info'),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: AddPeopleForm(),
      ),
    );
  }
}
