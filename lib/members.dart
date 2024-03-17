import 'package:flutter/material.dart';
import 'package:reside_ease/member_details.dart';

class MembersScreen extends StatefulWidget {
  const MembersScreen({super.key});

  @override
  _MembersScreenState createState() => _MembersScreenState();
}

class _MembersScreenState extends State<MembersScreen> {
  List<Map<String, String>> members = [];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue.shade100,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: const Text('Flat Members'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(16.0),
                child: members.isEmpty
                    ? Text(
                        'Members associated with society gets smooth sail into the society.',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      )
                    : Column(
                        children: members.map((member) {
                          return Container(
                            width: double.infinity,
                            child: Card(
                              color: Colors.blue.shade50,
                              child: Padding(
                                padding: EdgeInsets.all(16.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          '${member['firstName']} ${member['middleName']} ${member['lastName']}',
                                          style: TextStyle(
                                            fontSize: 22,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 8,
                                        ),
                                        Text(
                                          '${member['relation']}',
                                          style: TextStyle(
                                            fontSize: 16,
                                          ),
                                        ),
                                      ],
                                    ),
                                    IconButton(
                                      icon: Icon(Icons.delete),
                                      onPressed: () {
                                        setState(() {
                                          members.remove(member);
                                        });
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        }).toList(),
                      ),
              ),
              OutlinedButton.icon(
                style: OutlinedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                  side: const BorderSide(
                    color: Colors.black,
                    width: 1,
                  ),
                ),
                onPressed: () async {
                  final result = await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MembersDetailsScreen(),
                    ),
                  );

                  if (result != null) {
                    setState(() {
                      members.add({
                        'firstName': result['firstName'],
                        'middleName': result['middleName'],
                        'lastName': result['lastName'],
                        'relation': result['relation'],
                      });
                    });
                  }
                },
                icon: const Icon(
                  Icons.person_add_alt,
                  color: Colors.black,
                ),
                label: const Text(
                  'Add Members',
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
