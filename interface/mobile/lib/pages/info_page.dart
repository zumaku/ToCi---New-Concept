import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:toci_mobile/pages/home_page.dart';
import 'package:url_launcher/url_launcher.dart';

class InfoPage extends StatelessWidget {
  const InfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    const String url1 = 'https://github.com/zumaku/ToCi---New-Concept';
    const String url2 = 'https://saweria.co/zumaku';

    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              'assets/images/logo.png',
              height: 40,
            ),
            IconButton(
              icon: const Icon(
                Icons.home_outlined,
                size: 30,
              ),
              onPressed: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (_) => const Homepage()),
                );
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                const SizedBox(height: 30),
                RichText(
                  text: const TextSpan(
                    text: 'Ini ',
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Montserrat',
                      color: Color(0xFF30323F),
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'ToCi Mobile',
                        style: TextStyle(
                          color: Color(0xFF1B8345),
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  "ToCi Mobile ini digunakan untuk mengontrol tampilan apa yang ada di layar ToCi dengan menggunakan koneksi WiFi.",
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 8),
                const Text(
                  "Dibuat oleh Zumaku.",
                  style: TextStyle(fontSize: 16),
                )
              ]),
              const SizedBox(height: 100),
              Column(
                children: [
                  ElevatedButton(
                    onPressed: () async {
                      try {
                        final uri = Uri.parse(url1);
                        if (!await canLaunchUrl(uri)) {
                          throw Exception('Could not launch $url1');
                        }
                        await launchUrl(uri,
                            mode: LaunchMode.externalApplication);

                        // Tutup aplikasi jika perlu
                        if (Platform.isAndroid) {
                          SystemNavigator.pop();
                        } else if (Platform.isIOS) {
                          exit(0);
                        }
                      } catch (e) {
                        print('Error launching URL: $e');
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: const Color(0xFF30323F),
                      backgroundColor: Colors.white,
                      side: const BorderSide(
                        color: Color(0xFF30323F),
                        width: 1.5,
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      minimumSize: const Size(double.infinity, 0),
                    ),
                    child: const Text(
                      'Dokumentasi',
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () async {
                      try {
                        final uri = Uri.parse(url2);
                        if (!await canLaunchUrl(uri)) {
                          throw Exception('Could not launch $url2');
                        }
                        await launchUrl(uri,
                            mode: LaunchMode.externalApplication);

                        // Tutup aplikasi jika perlu
                        if (Platform.isAndroid) {
                          SystemNavigator.pop();
                        } else if (Platform.isIOS) {
                          exit(0);
                        }
                      } catch (e) {
                        print('Error launching URL: $e');
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: const Color(0xFF30323F),
                      side: const BorderSide(
                        color: Color(0xFF30323F),
                        width: 1.5,
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      minimumSize: const Size(double.infinity, 0),
                    ),
                    child: const Text(
                      'Dukung Developer',
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Center(
                      child: Text(
                    "ToCi v1.0",
                    style: TextStyle(color: Colors.grey),
                  )),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
