import 'package:flutter/material.dart';

class MembersDetailsScreen extends StatefulWidget {
  @override
  _MembersDetailsScreenState createState() => _MembersDetailsScreenState();
}

class _MembersDetailsScreenState extends State<MembersDetailsScreen> {
  final _firstNameController = TextEditingController();
  final _middleNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  String? _dropdownValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Member Details'),
        backgroundColor: Colors.blue.shade100,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              TextFormField(
                controller: _firstNameController,
                decoration: InputDecoration(
                  labelText: 'First Name',
                  hintText: 'Enter First Name',
                  filled: true,
                  fillColor: Colors.blue.shade50,
                  focusColor: Colors.black,
                  labelStyle: const TextStyle(color: Colors.black87),
                ),
                cursorColor: Colors.black,
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: _middleNameController,
                decoration: InputDecoration(
                  labelText: 'Middle Name',
                  hintText: 'Enter Middle Name',
                  filled: true,
                  fillColor: Colors.blue.shade50,
                  focusColor: Colors.black,
                  labelStyle: const TextStyle(color: Colors.black87),
                ),
                cursorColor: Colors.black,
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: _lastNameController,
                decoration: InputDecoration(
                  labelText: 'Last Name',
                  hintText: 'Enter Last Name',
                  filled: true,
                  fillColor: Colors.blue.shade50,
                  focusColor: Colors.black,
                  labelStyle: const TextStyle(color: Colors.black87),
                ),
                cursorColor: Colors.black,
              ),
              const SizedBox(
                height: 20,
              ),
              DropdownButtonFormField<String>(
                value: _dropdownValue,
                decoration: InputDecoration(
                  labelText: 'Relation',
                  hintText: 'Select Relationship with Person',
                  filled: true,
                  fillColor: Colors.blue.shade50,
                  focusColor: Colors.black,
                  labelStyle: const TextStyle(color: Colors.black87),
                ),
                onChanged: (String? newValue) {
                  setState(() {
                    _dropdownValue = newValue;
                  });
                },
                items: <String>[
                  'Mother',
                  'Father',
                  'Sibling',
                  'Cousin',
                  'Wife',
                  'Husband',
                  'Tenant'
                ].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              const SizedBox(
                height: 30,
              ),
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                  side: const BorderSide(
                    color: Colors.black,
                    width: 1,
                  ),
                ),
                onPressed: () {
                  Navigator.pop(context, {
                    'firstName': _firstNameController.text,
                    'middleName': _middleNameController.text,
                    'lastName': _lastNameController.text,
                    'relation': _dropdownValue,
                  });
                },
                child: const Text(
                  'Confirm',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
