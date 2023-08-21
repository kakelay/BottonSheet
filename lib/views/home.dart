// ignore_for_file: deprecated_member_use, unused_local_variable

import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:qrcode/views/Edit.dart';
import 'package:qrcode/views/menu.dart';
import 'package:qrcode/views/tesst.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String dollarnumber = '004533171';
  String khmernumber = '501227177';
  String currentText = '004533171';
  List<String> items = List<String>.generate(5, (i) => '$i');
  int index = 0;

  void updateTextOnFlip(bool isback) {
    if (isback) {
      setState(() {
        currentText = khmernumber;
      });
    } else {
      setState(() {
        currentText = dollarnumber;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 0, 38, 69),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 0, 38, 69),
        title: const Text(
          'HomeView',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(
                Icons.person,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>   EditProfile()),
                );
              },
             
            );
          },
        ),
        centerTitle: false,
        actions: [
          IconButton(
            // Within the `FirstRoute` widget
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const MenuPage()),
              );
            },
            icon: const Icon(Icons.menu, color: Colors.white),
          ),
          IconButton(
            // Within the `FirstRoute` widget
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => StackDemo()),
              );
            },
            icon: const Icon(Icons.menu, color: Colors.white),
          ),
        ],
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 18),
            child: Row(
              children: [
                const Text(
                  'Pay with ',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
                const Text(
                  'KHQR ',
                  style: TextStyle(
                      color: Color.fromARGB(255, 255, 17, 0),
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
                const Text(
                  'Code',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
                const SizedBox(
                  width: 90,
                ),
                SizedBox(
                  width: 50,
                  height: 50,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(60),
                      child: Image.asset('assets/images/logo.png')),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Container(
              height: 200,
              width: 200,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment(0.8, 1),
                  colors: <Color>[
                    Color.fromARGB(255, 255, 30, 0),
                    Color.fromARGB(255, 144, 0, 0),
                  ], // Gradient from https://learnui.design/tools/gradient-generator.html
                  tileMode: TileMode.mirror,
                ),
                borderRadius: BorderRadius.circular(12),
                // border: Border.all(
                //   width: 5,
                //  color: Color.fromARGB(255, 255, 30, 0),
                // ),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      const SizedBox(
                        width: 15,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              width: 5,
                              color: Colors.white,
                            ),
                          ),
                          child: FlipCard(
                            onFlipDone: (isback) {
                              setState(() {
                                // updateNumbers();
                                updateTextOnFlip(isback);
                              });
                            },

                            fill: Fill
                                .fillBack, // Fill the back side of the card to make in the same size as the front.
                            direction: FlipDirection.HORIZONTAL, // default
                            side: CardSide
                                .FRONT, // The side to initially display.
                            front: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Row(
                                children: [
                                  Container(
                                    height: 130,
                                    width: 130,
                                    color: Colors.white,
                                    child: QrImageView(
                                      foregroundColor: Colors.black,
                                      data:
                                          'https://link.payway.com.kh/aba?id=6ABCB87A75CE&code=837821&acc=004533171&dynamic=true',
                                      size: 220,
                                      gapless: false,
                                      embeddedImage: const AssetImage(
                                        'assets/images/dollar1.png',
                                      ),
                                      embeddedImageStyle:
                                          const QrEmbeddedImageStyle(
                                        size: Size(30, 30),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            back: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Container(
                                height: 130,
                                width: 130,
                                color: Colors.white,
                                child: QrImageView(
                                  foregroundColor: Colors.black,
                                  data:
                                      'https://link.payway.com.kh/aba?id=6ABCB87A75CE&code=422199&acc=501227177&dynamic=true',
                                  size: 220,
                                  gapless: false,
                                  embeddedImage: const AssetImage(
                                    'assets/images/khmer.jpg',
                                  ),
                                  embeddedImageStyle:
                                      const QrEmbeddedImageStyle(
                                    size: Size(25, 25),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 30,
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            const SizedBox(
                              width: 200,
                              child: Text(
                                'ឈ្មោះម្ចាស់គណនី៖',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 24),
                              ),
                            ),
                            const SizedBox(
                              width: 200,
                              child: Text(
                                'Ung sreymuch',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            const SizedBox(
                              width: 200,
                              child: Text(
                                'លេខគណនី៖',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 24),
                              ),
                            ),
                            SizedBox(
                              width: 200,
                              child: Text(
                                currentText,
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: items.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: ListTile(
                  contentPadding: const EdgeInsets.all(10),
                  tileColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: const BorderSide(width: 2),
                  ),
                  leading: const CircleAvatar(
                    radius: 30.0,
                    backgroundImage: NetworkImage(
                        'https://www.canterbury.ac.nz/engage/partnerships/international-pathways/foundation-pathways/student-stories/1662347820763_Student-Profile---Caleb-Lau-orig.jpg'),
                    backgroundColor: Colors.transparent,
                  ),
                  title: Text(
                    'Chamroeun${items[index]}',
                    style:const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  subtitle: const Text('8/15/2023'),
                  trailing: const Icon(
                    Icons.check_circle,
                    color: Colors.green,
                  ),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
