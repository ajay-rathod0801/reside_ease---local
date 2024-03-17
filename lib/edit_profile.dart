import 'package:flutter/material.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  String? _selectedGender;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade100,
        title: Text(
          'Edit Profile',
          style: TextStyle(
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w500,
            fontSize: screenWidth * 0.0444,
            color: Colors.black,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: screenHeight * 0.05),
            Container(
              width: screenWidth * 0.6,
              height: screenWidth * 0.6,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: const DecorationImage(
                  image: AssetImage('assets/profile_image.png'),
                  fit: BoxFit.cover,
                ),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, screenHeight * 0.11),
                    blurRadius: screenWidth * 0.1,
                    color: Color.fromARGB(2, 30, 15, 15),
                  ),
                  BoxShadow(
                    offset: Offset(0, screenHeight * 0.0625),
                    blurRadius: screenWidth * 0.075,
                    color: const Color.fromRGBO(0, 0, 0, 0.05),
                  ),
                  BoxShadow(
                    offset: Offset(0, screenHeight * 0.0275),
                    blurRadius: screenWidth * 0.055,
                    color: const Color.fromRGBO(0, 0, 0, 0.09),
                  ),
                  BoxShadow(
                    offset: Offset(0, screenHeight * 0.015),
                    blurRadius: screenWidth * 0.03,
                    color: const Color.fromRGBO(0, 0, 0, 0.1),
                  ),
                ],
              ),
            ),
            SizedBox(height: screenHeight * 0.02),
            TextButton(
              onPressed: () {
                showModalBottomSheet(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(screenWidth * 0.05),
                      topRight: Radius.circular(screenWidth * 0.05),
                    ),
                  ),
                  context: context,
                  builder: (BuildContext context) {
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        ListTile(
                          leading: Icon(Icons.camera),
                          title: Text('Open Camera'),
                          onTap: () {
                            // Add your functionality for opening the camera here
                          },
                        ),
                        ListTile(
                          leading: Icon(Icons.photo_library),
                          title: Text('Open Gallery'),
                          onTap: () {
                            // Add your functionality for opening the gallery here
                          },
                        ),
                        ListTile(
                          leading: Icon(Icons.delete),
                          title: Text('Remove Current Picture'),
                          iconColor: Colors.red,
                          textColor: Colors.red,
                          onTap: () {
                            // Add your functionality for removing the current picture here
                          },
                        ),
                      ],
                    );
                  },
                );
              },
              child: Text(
                'Edit profile picture',
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w500,
                  fontSize: screenWidth * 0.03055,
                  color: Colors.blue.shade900,
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.05),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Name',
                  labelStyle: TextStyle(
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w500,
                    fontSize: screenWidth * 0.03055,
                    color: Colors.black,
                  ),
                  filled: true,
                  fillColor: Colors.blue.shade50,
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.025),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
              child: DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  labelText: 'Gender',
                  labelStyle: TextStyle(
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w500,
                    fontSize: screenWidth * 0.03055,
                    color: Colors.black,
                  ),
                  filled: true,
                  fillColor: Colors.blue.shade50,
                ),
                value: _selectedGender,
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedGender = newValue;
                  });
                },
                items: <String>['Male', 'Female']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ),
            SizedBox(height: screenHeight * 0.025),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Update Address',
                  labelStyle: TextStyle(
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w500,
                    fontSize: screenWidth * 0.03055,
                    color: Colors.black,
                  ),
                  filled: true,
                  fillColor: Colors.blue.shade50,
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.025),
            ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.check),
              label: const Text('Submit'),
              style: ElevatedButton.styleFrom(
                foregroundColor: const Color(0xFF1E1E1E),
                backgroundColor: Colors.white,
                side: const BorderSide(color: Color(0xFF1E1E1E)),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(screenWidth * 0.01667),
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.05),
          ],
        ),
      ),
    );
  }
}
