import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:gif_view/gif_view.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:toci_mobile/services/user_provider.dart';
import 'package:provider/provider.dart';
import 'home_page.dart';

class IntroductionsScreen extends StatelessWidget {
  final TextEditingController _nameController = TextEditingController();

  IntroductionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    void showFlushbar({
      required String title,
      required String? message,
      required Color titleColor,
      required int duration,
    }) {
      Flushbar(
        title: title,
        titleColor: titleColor,
        message: message,
        backgroundColor: const Color(0xFF30323F),
        boxShadows: const [
          BoxShadow(
            color: Color(0xFF30323F),
            offset: Offset(0.0, 2.0),
            blurRadius: 3.0,
          )
        ],
        duration: Duration(seconds: duration),
        margin: const EdgeInsets.all(8),
        borderRadius: BorderRadius.circular(8),
        mainButton: TextButton(
          child: const Text(
            'OK',
            style: TextStyle(color: Colors.white),
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ).show(context);
    }

    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              'assets/images/logo.png',
              height: 40,
            ),
          ],
        ),
      ),
      body: IntroductionScreen(
        pages: [
          // Page 1
          PageViewModel(
              title: "",
              bodyWidget: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                        child: GifView.asset(
                      'assets/images/toci_gif/01_toci_animation.gif',
                      width: MediaQuery.sizeOf(context).width / 2,
                      height: MediaQuery.sizeOf(context).width / 2,
                      frameRate: 5,
                    )),
                    const SizedBox(height: 43),
                    const Text(
                      "Animasikan",
                      style: TextStyle(
                          color: Color(0xFF1B8345),
                          fontSize: 36,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w800),
                    ),
                    const Text("ToCi Milikmu",
                        style: TextStyle(
                            color: Color(0xFF30323F),
                            fontSize: 36,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w800)),
                    RichText(
                      text: const TextSpan(
                        text: 'Sekarang',
                        style: TextStyle(
                          fontSize: 36,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Montserrat',
                          color: Color(0xFF30323F),
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: '.',
                            style: TextStyle(
                              color: Color(0xFF1B8345),
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ]),
              decoration:
                  const PageDecoration(bodyAlignment: Alignment.bottomCenter)),

          // Page 2
          PageViewModel(
              title: "",
              bodyWidget: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                        child: GifView.asset(
                      'assets/images/toci_gif/02_toci_animation.gif',
                      width: MediaQuery.sizeOf(context).width / 2,
                      height: MediaQuery.sizeOf(context).width / 2,
                      frameRate: 5,
                    )),
                    const SizedBox(height: 48),
                    const Text(
                      "Pastikan ToCi",
                      style: TextStyle(
                          color: Color(0xFF1B8345),
                          fontSize: 32,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w800),
                    ),
                    RichText(
                      text: const TextSpan(
                        text: 'Telah ',
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Montserrat',
                          color: Color(0xFF30323F),
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: 'Terhubung',
                            style: TextStyle(
                              color: Color(0xFF1B8345),
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          TextSpan(
                            text: '.',
                            style: TextStyle(
                              color: Color(0xFF30323F),
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      "Sambungkan perangkat ke WiFi ToCi milikmu sesuai dengan buku panduan.",
                      style: TextStyle(
                          color: Color(0xFF30323F),
                          fontSize: 16,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.normal),
                    ),
                  ]),
              decoration:
                  const PageDecoration(bodyAlignment: Alignment.bottomCenter)),

          // Page 3
          PageViewModel(
              title: "",
              bodyWidget: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                        child: GifView.asset(
                      'assets/images/toci_gif/03_toci_animation.gif',
                      width: MediaQuery.sizeOf(context).width / 2,
                      height: MediaQuery.sizeOf(context).width / 2,
                      frameRate: 2,
                    )),
                    const SizedBox(height: 20),
                    const Text(
                      "Biarkan ToCi",
                      style: TextStyle(
                          color: Color(0xFF30323F),
                          fontSize: 32,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w800),
                    ),
                    RichText(
                      text: const TextSpan(
                        text: 'Mengenalmu',
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Montserrat',
                          color: Color(0xFF1B8345),
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: '.',
                            style: TextStyle(
                              color: Color(0xFF30323F),
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),
                    TextField(
                      controller: _nameController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: const BorderSide(
                            color: Color(0xFF30323F),
                            width: 1.0,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: const BorderSide(
                            color: Color(0xFF30323F),
                            width: 1.0,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: const BorderSide(
                            color: Color(0xFF1B8345),
                            width: 1.0,
                          ),
                        ),
                        hintText: 'Nama panggilanmu siapa?',
                        hintStyle: const TextStyle(
                          fontFamily: 'Montserrat',
                        ),
                        contentPadding: const EdgeInsets.all(11.0),
                      ),
                      style: const TextStyle(
                        fontFamily: 'Montserrat',
                      ),
                    )
                  ]),
              decoration:
                  const PageDecoration(bodyAlignment: Alignment.bottomCenter)),
        ],
        onDone: () {
          // print('onDone called');
          if (_nameController.text.isEmpty) {
            // print('Name is empty');
            showFlushbar(
              title: "Belum bisa mulai",
              message: 'Pastikan perangkat anda terhubung ke jaringan .',
              titleColor: const Color(0xffd44141),
              duration: 10,
            );
          } else {
            // print('Name set: ${_nameController.text}');
            Provider.of<NameProvider>(context, listen: false)
                .setName(_nameController.text);
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (_) => const Homepage()),
            );
          }
        },
        next: const Icon(
          Icons.arrow_forward_ios,
          color: Color(0xFF30323F),
        ),
        showBackButton: true,
        back: const Icon(
          Icons.arrow_back_ios,
          color: Color(0xFF30323F),
        ),
        // done: const Text("Mulai", style: TextStyle(fontWeight: FontWeight.w600)),
        done: Container(
          padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
          decoration: BoxDecoration(
              color: const Color(0xFF1B8345),
              borderRadius: BorderRadius.circular(8)),
          child: const Text(
            "Mulai",
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
        ),
        dotsDecorator: DotsDecorator(
          activeColor: const Color(0xFF1B8345),
          size: const Size.square(10.0),
          activeSize: const Size(22.0, 10.0),
          activeShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25.0),
          ),
        ),
        controlsPadding: const EdgeInsets.symmetric(vertical: 40),
      ),
    );
  }
}
