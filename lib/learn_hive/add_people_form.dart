import 'package:apps_muhamad_mashudi_ardi_winata/learn_hive/people.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class AddPeopleForm extends StatefulWidget {
  const AddPeopleForm({super.key});

  @override
  State<AddPeopleForm> createState() => _AddPeopleFormState();
}

class _AddPeopleFormState extends State<AddPeopleForm> {
  late final Box box;
  final _nameController = TextEditingController();
  final _countryController = TextEditingController();
  final _peopleFormKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    box = Hive.box('peopleBox');
  }

  _addInfo() async {
    People people = People(
      name: _nameController.text,
      country: _countryController.text,
    );

    box.add(people);
  }

  String? _fieldValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Field can\'t be empty';
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _peopleFormKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Name'),
          TextFormField(
            controller: _nameController,
            validator: _fieldValidator,
          ),
          const SizedBox(height: 24.0),
          const Text('Home Country'),
          TextFormField(
            controller: _countryController,
            validator: _fieldValidator,
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 24.0),
            child: SizedBox(
              width: double.maxFinite,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  if (_peopleFormKey.currentState!.validate()) {
                    _addInfo();
                    Navigator.of(context).pop();
                  }
                },
                child: const Text('Add'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
