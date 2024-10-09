import 'package:dcd_app/src/pages/widgets/folder_ayam.dart';
import 'package:flutter/material.dart';

class SaveImages extends StatelessWidget {
  const SaveImages({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Gambar Penyakit Ayam"),
        backgroundColor: Colors.orangeAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: 3, // Jumlah kolom dalam grid (3 section)
          crossAxisSpacing: 10, // Spasi horizontal antar section
          mainAxisSpacing: 10, // Spasi vertikal antar section
          children: [
            // Section 1
            Center(
              child: Folder(
                title: "Sehat",
                penyakit: "sehat",
              ),
            ),
            // Section 2
            Center(
              child: Folder(
                title: "Kolera",
              ),
            ),
            // Section 3
            Center(
              child: Folder(
                title: "Snot",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
