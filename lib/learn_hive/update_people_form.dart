import 'package:apps_muhamad_mashudi_ardi_winata/learn_hive/people.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class UpdatePeopleForm extends StatefulWidget {
  final int index;
  final People people;

  const UpdatePeopleForm({
    super.key,
    required this.index,
    required this.people,
  });

  @override
  State<UpdatePeopleForm> createState() => _UpdatePeopleFormState();
}

class _UpdatePeopleFormState extends State<UpdatePeopleForm> {
  var _nameController = TextEditingController();
  var _countryController = TextEditingController();
  late final Box box;
  final _peopleFormKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();

    box = Hive.box('peopleBox');
    _nameController = TextEditingController(text: widget.people.name);
    _countryController = TextEditingController(text: widget.people.country);
  }

  _updateInfo() {
    People people = People(
      name: _nameController.text,
      country: _countryController.text,
    );

    box.putAt(
      widget.index,
      people,
    );
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
                    _updateInfo();
                    Navigator.of(context).pop();
                  }
                },
                child: const Text('Update'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
