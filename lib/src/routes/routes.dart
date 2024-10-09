import 'package:dcd_app/src/pages/hasil_gambar.dart';
import 'package:dcd_app/src/pages/home.dart';
import 'package:dcd_app/src/pages/monitoring_ayam.dart';
import 'package:dcd_app/src/pages/save_image_dir.dart';
import 'package:flutter/material.dart';

class MyRoutes {
  static const home = "/";
  static const monitoring = "/monitoring";
  static const gambarPenyakitAyam = "/gambarpenyakitayam";
  static const hasilGambarPenyakitAyam = "/hasilgambarpenyakitayam";

  static final data = <String, WidgetBuilder>{
    home: (_) => const Home(),
    monitoring: (_) => const Monitoring(),
    gambarPenyakitAyam: (_) => const SaveImages(),
    hasilGambarPenyakitAyam: (_) => const ResultImages()
  };
}
