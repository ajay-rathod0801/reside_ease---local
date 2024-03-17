import 'package:flutter/material.dart';
import 'package:reside_ease/add_home.dart';
import 'package:reside_ease/members.dart';
import 'package:reside_ease/edit_profile.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        // appBar: const TopAppBar(),
        body: Container(
          width: 400,
          height: 800,
          color: const Color(0xFFF9F9FF),
          child: ListView(
            children: [
              _buildProfileImage(
              ),
              _buildProfileDetails(),
              _buildEditProfileButton(() {
                navigateWithTransition(context, const EditProfile());
              }),
              SizedBox(
                height: 12.0,
              ),
              _buildSmallCard(
                title: 'Flat Members',
                onTap: () {
                  navigateWithTransition(context, const MembersScreen());
                },
                logoImagePath: 'assets/icons/members.png',
              ),
              _buildSmallCard(
                title: 'Add Home',
                onTap: () {
                  navigateWithTransition(context, const AddHome());
                },
                logoImagePath: 'assets/icons/addHome.png',
              ),
              _buildSmallCard(
                title: 'Saved',
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Saved Clicked'),
                    ),
                  );
                },
                logoImagePath: 'assets/icons/saved.png',
              ),
              _buildSmallCard(
                title: 'Settings',
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Settings Clicked'),
                    ),
                  ); // Handle the Settings card tap
                },
                logoImagePath: 'assets/icons/settings.png',
              ),
              SizedBox(
                height: 10.0,
              ),
              _buildLogoutButton(
                title: 'Logout',
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Logout Clicked'),
                    ),
                  ); // Handle the Settings card tap
                },
                logoImagePath: 'assets/icons/logout.png',
              ),
            ],
          ),
        ),
      ),
    );
  }

  void navigateWithTransition(BuildContext context, Widget destinationPage) {
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation1, animation2) => destinationPage,
        transitionDuration: Duration(milliseconds: 300),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          var begin = Offset(1.0, 0.0);
          var end = Offset.zero;
          var curve = Curves.ease;

          var tween =
              Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

          return SlideTransition(
            position: animation.drive(tween),
            child: child,
          );
        },
      ),
    );
  }

  Widget _buildProfileImage() {
    return Padding(
      padding: const EdgeInsets.only(left: 16, top: 10),
      child: GestureDetector(
        
        child: Container(
          width: 200,
          height: 200,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: AssetImage('assets/profile_image.png'),
              fit: BoxFit.scaleDown,
            ),
            boxShadow: [
              BoxShadow(
                color: Color(0x19000000),
                blurRadius: 12,
                offset: Offset(0, 6),
                spreadRadius: 0,
              ),
              BoxShadow(
                color: Color(0x16000000),
                blurRadius: 22,
                offset: Offset(0, 22),
                spreadRadius: 0,
              ),
              BoxShadow(
                color: Color(0x0C000000),
                blurRadius: 30,
                offset: Offset(0, 50),
                spreadRadius: 0,
              ),
              BoxShadow(
                color: Color(0x02000000),
                blurRadius: 36,
                offset: Offset(0, 89),
                spreadRadius: 0,
              ),
              BoxShadow(
                color: Color(0x00000000),
                blurRadius: 39,
                offset: Offset(0, 139),
                spreadRadius: 0,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfileDetails() {
    return Padding(
      padding: const EdgeInsets.only(left: 16, top: 16),
      child: SizedBox(
        width: 290,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Text(
                'Abhishek Lal',
                style: _textStyle(32, FontWeight.w400),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Text(
                '123, ABC Street Cityville, State - 560001 India',
                style: _textStyle(14, FontWeight.w500, letterSpacing: 0.10),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              child: Text(
                '#7362948105',
                style: _textStyle(14, FontWeight.w400, letterSpacing: 0.25),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEditProfileButton(VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 124,
        height: 40,
        margin: const EdgeInsets.only(left: 120, right: 120),
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          border: Border.all(width: 2, color: Colors.black),
          color: Colors.white,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 24,
              height: 24,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/icons/editProfile.png'),
                  fit: BoxFit.scaleDown,
                ),
              ),
            ),
            const SizedBox(width: 9),
            const Text(
              'Edit Profile',
              style: TextStyle(color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSmallCard(
      {required String title,
      required VoidCallback onTap,
      required String logoImagePath}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 3),
      child: GestureDetector(
        onTap: onTap,
        child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
          color: Colors.blue.shade100,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      // color: const Color(0xFFD9D9D9),
                      image: DecorationImage(
                        image: AssetImage(logoImagePath),
                        fit: BoxFit.scaleDown,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 25),
                Container(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w500,
                          height: 0.10,
                          letterSpacing: 0.10,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLogoutButton(
      {required String title,
      required VoidCallback onTap,
      required String logoImagePath}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
      child: GestureDetector(
        onTap: onTap,
        child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
          color: Colors.red,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      image: DecorationImage(
                        image: AssetImage(logoImagePath),
                        fit: BoxFit.scaleDown,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 25),
                Container(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w500,
                          height: 0.10,
                          letterSpacing: 0.10,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  TextStyle _textStyle(double fontSize, FontWeight fontWeight,
      {double letterSpacing = 0.0}) {
    return TextStyle(
      color: Colors.black,
      fontSize: fontSize,
      fontFamily: 'Roboto',
      fontWeight: fontWeight,
      height: 1.2,
      letterSpacing: letterSpacing,
    );
  }
}
