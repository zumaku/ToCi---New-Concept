import 'package:flutter/material.dart';
import '/model/animations.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomepage(),
    );
  }
}

class MyHomepage extends StatefulWidget {
  // Gunakan StatefulWidget
  @override
  _MyHomepageState createState() => _MyHomepageState();
}

class _MyHomepageState extends State<MyHomepage> {
  // Buat class State terpisah
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              'images/logo.png', // Pastikan path sesuai dengan lokasi gambar logo kamu
              height: 40,
            ),
            IconButton(
              icon: Icon(
                Icons.info_outline,
                size: 30,
              ),
              onPressed: () {
                // Action when the info button is pressed
                // For now, it does nothing.
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              
              // Hai Zumaku
              RichText(
                text: const TextSpan(
                  text: 'Hai, ',
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Montserrat',
                    color: Color(0xFF30323F),
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: 'Zumaku',
                      style: TextStyle(
                        color: Color(0xFF1B8345),
                        fontWeight: FontWeight.w800, // Extra Bold
                      ),
                    ),
                    TextSpan(
                      text: '.',
                      style: TextStyle(
                        color: Color(0xFF30323F),
                        fontWeight: FontWeight.w800, // Extra Bold
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                "Ketuk salah satu untuk menampilkan animasi.",
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 20),
              
              // Listing Items
              GridView.builder(
                physics: NeverScrollableScrollPhysics(), // Tambahkan physics untuk mematikan scrolling
                shrinkWrap: true, // Agar GridView tidak mengambil ruang berlebih
                itemCount: animationList.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8.0,
                  mainAxisSpacing: 8.0,
                  childAspectRatio: 4 / 3,
                ),
                itemBuilder: (context, index) {
                  final item = animationList[index];
                  return MouseRegion(
                    onHover: (event) {
                      setState(() {
                        animationList[index].isHovered = true;
                      });
                    },
                    onExit: (event) {
                      setState(() {
                        animationList[index].isHovered = false;
                      });
                    },
                    child: Transform.scale(
                      scale: animationList[index].isHovered ? 1.01 : 1.0,
                      child: SizedBox(
                        height: 100,
                        child: InkWell(
                          onTap: () {
                            // Tambahkan aksi yang ingin dilakukan ketika Card diklik
                            print('Card clicked: ${item.id}');
                          },
                          child: Card(
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                color: Color(0xFFB2B6CE),
                                width: 0.3,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Expanded(
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: Image.asset(
                                        'images/${item.image}',
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Center(
                                      child: Text(
                                        item.nama,
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
