import 'package:flutter/material.dart';

class ResultImages extends StatelessWidget {
  const ResultImages({super.key});

  @override
  Widget build(BuildContext context) {
    final String? argument =
        ModalRoute.of(context)?.settings.arguments as String?;

    debugPrint(argument);
    return Scaffold(
      appBar: AppBar(
        title: Text("Ayam ${argument ?? ""}"),
        backgroundColor: Colors.orangeAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: 2, // Jumlah kolom dalam grid (3 section)
          crossAxisSpacing: 10, // Spasi horizontal antar section
          mainAxisSpacing: 10, // Spasi vertikal antar section
          children: [
            // Section 1
            Center(
              child: Image.network(
                'https://www.medion.co.id/wp-content/uploads/2019/08/40KT01ayam.jpg',
                loadingBuilder: (BuildContext context, Widget child,
                    ImageChunkEvent? loadingProgress) {
                  if (loadingProgress == null) {
                    return child; // Jika gambar sudah selesai dimuat
                  } else {
                    return Center(
                      child: CircularProgressIndicator(
                        value: loadingProgress.expectedTotalBytes != null
                            ? loadingProgress.cumulativeBytesLoaded /
                                (loadingProgress.expectedTotalBytes ?? 1)
                            : null,
                      ),
                    );
                  }
                },
                errorBuilder: (context, error, stackTrace) {
                  return const Text(
                      'Failed to load image'); // Jika gambar gagal dimuat
                },
              ),
            ),
            // Section 2
            Center(
              child: Image.network(
                'https://www.medion.co.id/wp-content/uploads/2019/08/40KT01ayam.jpg',
                loadingBuilder: (BuildContext context, Widget child,
                    ImageChunkEvent? loadingProgress) {
                  if (loadingProgress == null) {
                    return child; // Jika gambar sudah selesai dimuat
                  } else {
                    return Center(
                      child: CircularProgressIndicator(
                        value: loadingProgress.expectedTotalBytes != null
                            ? loadingProgress.cumulativeBytesLoaded /
                                (loadingProgress.expectedTotalBytes ?? 1)
                            : null,
                      ),
                    );
                  }
                },
                errorBuilder: (context, error, stackTrace) {
                  return const Text(
                      'Failed to load image'); // Jika gambar gagal dimuat
                },
              ),
            ),
            // Section 3
          ],
        ),
      ),
    );
  }
}
