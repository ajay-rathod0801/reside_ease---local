import 'package:flutter/material.dart';

import 'add_home_details.dart';

class AddHome extends StatefulWidget {
  const AddHome({super.key});

  @override
  _AddHomeState createState() => _AddHomeState();
}

class _AddHomeState extends State<AddHome> {
  List<Map<String, String>> Homes = [];

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
          title: const Text('Add Home'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Homes.isEmpty
                    ? Text(
                        "you haven't added any Additional properties.",
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      )
                    : Column(
                        children: Homes.map((Homes) {
                          return Container(
                            width: double.infinity,
                            child: Card(
                              color: Colors.blue.shade50,
                              child: Padding(
                                padding: EdgeInsets.all(16.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '${Homes['Society']}',
                                      style: TextStyle(
                                        fontSize: 22,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    Text(
                                      '${Homes['Tower']} - ${Homes['Flat Number']}',
                                      style: TextStyle(
                                        fontSize: 16,
                                      ),
                                    ),
                                    Text(
                                      '${Homes['City']}',
                                      style: TextStyle(
                                        fontSize: 16,
                                      ),
                                    ),
                                    Text(
                                      '${Homes['Occupancy Status']}',
                                      style: TextStyle(
                                        fontSize: 16,
                                      ),
                                    ),
                                    IconButton(
                                      icon: Icon(Icons.delete),
                                      onPressed: () {
                                        setState(() {
                                          Homes.remove(Homes);
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
                      builder: (context) => AddHomeDetails(),
                    ),
                  );

                  if (result != null) {
                    setState(() {
                      Homes.add({
                        'City': result['City'],
                        'Society': result['Society'],
                        'Tower': result['Tower'],
                        'Flat Number': result['Flat Number'],
                        'Occupancy Status': result['Occupancy Status'],
                      });
                    });
                  }
                },
                icon: const Icon(
                  Icons.add_home_outlined,
                  color: Colors.black,
                ),
                label: const Text(
                  'Add Homes',
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