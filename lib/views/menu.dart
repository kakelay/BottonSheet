// ignore_for_file: unnecessary_new

import 'package:flutter/material.dart';
import 'package:qrcode/views/stack.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor:Colors.amber,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios),
            //replace with our own icon data.
          ),
          title: const Text(
            "Menu",
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
        body: ListView(
          children: [
            Column(
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Enter   your name  here'),
                    autocorrect: true,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Enter your Phone number'),
                    autocorrect: true,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Reply',
                      labelText: 'Reply:',
                    ),
                    autofocus: false,
                    maxLines: 1,
                    keyboardType: TextInputType.multiline,
                    minLines: 1,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 16.0),
                  child: new TextField(

                    keyboardType: TextInputType.multiline,
                    minLines: 1,
                    maxLines: 10,
                    decoration: new InputDecoration(
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10.0),
                          ),
                        ),
                        filled: true,
                        hintStyle: new TextStyle(color: Colors.grey[800]),
                        hintText: "Type in your text",
                        fillColor: Colors.white),
                  ),
                ),
                SizedBox(
                  width: 300,
                  height: 60,
                  child: ElevatedButton(
                  onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const BottomSheetExample()),
                      );
                    },
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.amber)),
                    child: const Text(
                      'fjkladjflkjdskljfkl',
                    ),
                  ),
                ),
              ],
            ),
          ],
        ));
  }
}
