import 'package:dcd_app/src/pages/widgets/button.dart';
import 'package:dcd_app/src/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String? _host;

  @override
  void initState() {
    super.initState();
    _checkSession();
  }

  Future<void> _checkSession() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _host = prefs.getString('host');
    });

    if (_host == null || _host!.isEmpty) {
      _showHostDialog();
    }
  }

  Future<void> _saveHost(String host) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('host', host);
    setState(() {
      _host = host;
    });
  }

  void _showHostDialog() {
    showDialog(
      context: context,
      builder: (context) {
        TextEditingController hostController = TextEditingController();
        return AlertDialog(
          title: const Text('Enter Host'),
          content: TextField(
            controller: hostController,
            decoration: const InputDecoration(hintText: 'Enter host'),
          ),
          actions: [
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Save'),
              onPressed: () {
                String host = hostController.text.trim();
                if (host.isNotEmpty) {
                  _saveHost(host);
                  Navigator.of(context).pop();
                }
              },
            ),
          ],
        );
      },
    );
  }

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
                Image(
                  image: AssetImage(
                      'assets/images/logo.jpg'), // Path ke gambar di folder assets
                ),
                SizedBox(height: 10),
                Text(
                    "Aplikasi berbasis AI untuk mendiagnosis penyakit ayam seperti kolera, snot, dan lainnya dengan cepat dan mudah.")
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
            ),
            const SizedBox(
              height: 20,
            ),
            Button(
              text: 'Edit host',
              onTap: () => _showHostDialog(),
            )
          ],
        ),
      ),
    );
  }
}
