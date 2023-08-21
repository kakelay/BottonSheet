 
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
 

  class StackDemo extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        backgroundColor: Color.fromARGB(255, 3, 50, 86),
        appBar: AppBar(title: Text('Stack Demo'),),
        body: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            // background image and bottom contents
            Column(
              children: <Widget>[
                Container(
                  height: 200.0,
                  color: Colors.red,
                  child: Center(
                    child: Image.asset('assets/images/erobot.png')
                  ),
                ),
                Expanded(
                  child: Container(
                    color: Color.fromARGB(255, 5, 48, 84),
                    child: Center(
                      child: Text('Content goes here'),
                    ),
                  ),
                )
              ],
            ),
            // Profile image
            Positioned(
              top: 50.0, // (background container size) - (circle height / 2)
              child: Padding(
                padding: const EdgeInsets.only(top: 40),
                child: Container(
                  decoration: BoxDecoration(
               borderRadius: BorderRadius.circular(20),
               border: Border.all(
                 width: 5,
                 color: Colors.white,
               ),
                  ),
                  child: FlipCard(
               fill: Fill
                   .fillBack, // Fill the back side of the card to make in the same size as the front.
               direction: FlipDirection.HORIZONTAL, // default
               side: CardSide.FRONT, // The side to initially display.
               front: Padding(
                 padding: const EdgeInsets.all(10.0),
                 child: Container(
                   height: 230,
                   width: 230,
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
                     embeddedImageStyle: const QrEmbeddedImageStyle(
                       size: Size(50, 50),
                     ),
                   ),
                 ),
               ),
               back: Padding(
                 padding: const EdgeInsets.all(10.0),
                 child: Container(
                   height: 230,
                   width: 230,
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
                     embeddedImageStyle: const QrEmbeddedImageStyle(
                       size: Size(50, 50),
                     ),
                   ),
                 ),
               ),
                  ),
                ),
              ),
            )
          ],
        ),
      );
    }
  }