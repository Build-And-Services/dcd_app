import 'package:dcd_app/src/pages/widgets/stream_camera.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Monitoring extends StatelessWidget {
  const Monitoring({super.key});
  Future<void> majuDepan() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? host = prefs.getString('host');
    final url = Uri.parse(host == null
        ? 'http://raspberrypi.local:5000/move_servo/forward'
        : '$host/move_servo/forward'); // Replace with your endpoint
    try {
      final response =
          await http.get(url); // You can use .post() for POST requests
      if (response.statusCode == 200) {
        // If the server returns a 200 OK response
        print('Success: ${response.body}');
      } else {
        // If the server returns a non-200 response
        print('Failed to load data: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  Future<void> mundurBelakang() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? host = prefs.getString('host');
    final url = Uri.parse(host == null
        ? 'http://raspberrypi.local:5000/move_servo/forward'
        : '$host/move_servo/forward'); // Replace with your endpoint
    try {
      final response =
          await http.get(url); // You can use .post() for POST requests
      if (response.statusCode == 200) {
        // If the server returns a 200 OK response
        print('Success: ${response.body}');
      } else {
        // If the server returns a non-200 response
        print('Failed to load data: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            const StreamCamera(),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Row(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Camera Control"),
                      SizedBox(
                        width: 100,
                        height: 100,
                        child: Center(
                            child: Row(
                          children: [
                            InkWell(
                              onTap: () {
                                mundurBelakang(); // Call the API when the button is pressed
                              },
                              child: const Icon(
                                Icons.arrow_circle_left_sharp,
                                size: 50,
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                majuDepan(); // Call the API when the button is pressed
                              },
                              child: const Icon(
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
                  const Spacer(),
                  // Section Kedua
                  const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Capture"),
                      SizedBox(
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
