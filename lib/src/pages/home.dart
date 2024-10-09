import 'package:dcd_app/src/pages/widgets/button.dart';
import 'package:dcd_app/src/routes/routes.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Column(
              children: [
                Text(
                  "DCD APP",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Text(
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.")
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Button(
              text: 'Monitoring Ayam',
              onTap: () => Navigator.pushNamed(context, MyRoutes.monitoring),
            ),
            const SizedBox(
              height: 20,
            ),
            Button(
              text: 'Gambar Tersimpan',
              onTap: () =>
                  Navigator.pushNamed(context, MyRoutes.gambarPenyakitAyam),
            )
          ],
        ),
      ),
    );
  }
}
