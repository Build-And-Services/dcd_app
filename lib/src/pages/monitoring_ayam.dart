import 'package:flutter/material.dart';

class Monitoring extends StatelessWidget {
  const Monitoring({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              height: 600,
              width: double.infinity,
              color: Colors.brown,
            ),
            Expanded(
                child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: Row(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Camera Control"),
                      Container(
                        width: 100, // Atur lebar section pertama
                        height: 100, // Atur tinggi section pertama
                        child: Center(
                            child: Row(
                          children: [
                            InkWell(
                              child: Icon(
                                Icons.arrow_circle_left_sharp,
                                size: 50,
                              ),
                            ),
                            InkWell(
                              child: Icon(
                                Icons.arrow_circle_right_sharp,
                                size: 50,
                              ),
                            ),
                          ],
                        )),
                      ),
                    ],
                  ),
                  // Spacer untuk mengisi ruang kosong
                  Spacer(),
                  // Section Kedua
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Capture"),
                      Container(
                        width: 100, // Atur lebar section kedua
                        height: 100, // Atur tinggi section kedua
                        child: Center(
                            child: Icon(
                          Icons.camera_alt_rounded,
                          size: 60,
                        )),
                      ),
                    ],
                  ),
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}
