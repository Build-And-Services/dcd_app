import 'package:dcd_app/src/routes/routes.dart';
import 'package:flutter/material.dart';

class Folder extends StatelessWidget {
  const Folder({super.key, required this.title, this.penyakit});

  final String title;
  final String? penyakit;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.pushNamed(
          context, MyRoutes.hasilGambarPenyakitAyam,
          arguments: penyakit),
      child: Column(
        children: [
          Container(
            child: Icon(
              Icons.folder,
              size: 80,
            ),
          ),
          Text(
            title,
            style: TextStyle(fontSize: 18),
          )
        ],
      ),
    );
  }
}
