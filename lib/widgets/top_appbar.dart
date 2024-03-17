import 'package:flutter/material.dart';

class TopAppBar extends StatelessWidget implements PreferredSizeWidget {
  const TopAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.blue.shade200,
      shadowColor: Colors.transparent,
      leading: IconButton(
        icon: const Icon(Icons.person_2_rounded, color: Colors.black),
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Profile Clicked'),
            ),
          );
        },
      ),
      title: const Text(
        'Hello',
        style: TextStyle(
          fontWeight: FontWeight.w600,
        ),
      ),
      actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.add_alert, color: Colors.black),
          tooltip: 'Show Snackbar',
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Notification Clicked'),
              ),
            );
          },
        ),
        const SizedBox(width: 10.0),
        IconButton(
          icon: const Icon(Icons.message_rounded, color: Colors.black),
          tooltip: 'Show Snackbar',
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Message Clicked'),
              ),
            );
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
