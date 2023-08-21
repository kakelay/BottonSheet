// ignore_for_file: unused_element

import 'package:flutter/material.dart';
import 'package:qrcode/views/setting.dart';

class BottomSheetExample extends StatelessWidget {
  const BottomSheetExample({super.key});

  void _performLogout(BuildContext context) {
    // Perform your logout logic here
    // For example, you can clear user session, navigate to the login screen, etc.
    // After the logout action, you can close the bottom sheet
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('showModalBottomSheet'),
        actions: [
          IconButton(
            onPressed: () {
              showModalBottomSheet<void>(
                isScrollControlled: true,
                context: context,
                builder: (BuildContext context) {
                  return Container(
                    height: 730, // Adjust the height as needed
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(16.0),
                      ),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        const SizedBox(
                          height: 15,
                        ),
                        
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(50)),
                          width: 70,
                          height: 12,
                        ),
                        ListTile(
                          leading: const Icon(Icons.settings),
                          title: const Text('Setting and Privacy'),
                          onTap: () {
                            Navigator.pop(context); // Close the bottom sheet
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const SettingsPrivacyScreen(),
                              ),
                            );
                          },
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 55),
                          child: Divider(),
                        ),
                        const ListTile(
                          leading: Icon(Icons.rotate_left_outlined),
                          title: Text('Your Activaty'),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 55),
                          child: Divider(),
                        ),
                        const ListTile(
                          leading: Icon(Icons.qr_code_scanner_outlined),
                          title: Text('QR code'),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 55),
                          child: Divider(),
                        ),
                        const ListTile(
                          leading: Icon(Icons.bookmark_border),
                          title: Text('Save'),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 55),
                          child: Divider(),
                        ),
                        const ListTile(
                          leading: Icon(Icons.card_membership),
                          title: Text('Card Membership'),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 55),
                          child: Divider(),
                        ),
                        const ListTile(
                          leading: Icon(Icons.star_border_rounded),
                          title: Text('Favorites'),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 55),
                          child: Divider(),
                        ),
                        const ListTile(
                          leading: Icon(Icons.star_border_rounded),
                          title: Text('Favorites'),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 55),
                          child: Divider(),
                        ),
                        const ListTile(
                          leading: Icon(Icons.login_outlined),
                          title: Text(
                            'Logout',
                            style: TextStyle(color: Colors.redAccent),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 55),
                          child: Divider(),
                        ),
                        ListTile(
                          leading: const Icon(
                            Icons.close,
                            color: Colors.green,
                          ),
                          title: const Text('Close'),
                          onTap: () => Navigator.pop(context),
                        ),
                      ],
                    ),
                  );
                },
              );
            },
            icon: const Icon(
              Icons.menu,
            ),
          )
        ],
      ),
      body: ListView(
        children: [
          Column(
            children: [
              Center(
                child: Image.asset(
                  'assets/images/t1.png',
                ),
              ),
              Center(
                child: Image.asset(
                  'assets/images/t1.png',
                ),
              ),
              Center(
                child: Image.asset(
                  'assets/images/t1.png',
                ),
              ),
              Center(
                child: Image.asset(
                  'assets/images/t1.png',
                ),
              ),
              Center(
                child: Image.asset(
                  'assets/images/t1.png',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
