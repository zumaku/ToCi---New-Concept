import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:gif_view/gif_view.dart';
import 'package:http/http.dart' as http;
import 'package:toci_mobile/pages/info_page.dart';
import 'package:toci_mobile/services/user_provider.dart';
import 'package:provider/provider.dart';
import '/model/animations.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int? _selectedCardId;
  bool _isLoading = false;

  Future<void> sendAnimationRequest(int animationId) async {
    setState(() {
      _isLoading = true;
    });

    final url = Uri.parse('http://192.168.4.22/press?animation=$animationId');
    // print("Request URL: $url");

    try {
      final response = await http.get(url);
      // print("Response Status Code: ${response.statusCode}");
      // print("Response Body: ${response.body}");

      if (response.statusCode == 200) {
        setState(() {
          _selectedCardId = animationId;
        });
      } else {
        _showFlushbar(
          title: "Gagal Menyetel",
          message:
              'Pastikan perangkat anda terhubung ke jaringan ToCi. Status: ${response.statusCode}',
          titleColor: const Color(0xffd44141),
          duration: 10,
        );
      }
    } catch (e) {
      // print("Catch Error: $e");
      _showFlushbar(
        title: "Gagal Menyetel",
        message:
            'Pastikan perangkat anda terhubung ke jaringan ToCi. Error: $e',
        titleColor: const Color(0xffd44141),
        duration: 10,
      );
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  void _showFlushbar({
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

  @override
  Widget build(BuildContext context) {
    return Consumer<NameProvider>(builder: (context, nameProvider, child) {
      String name = Provider.of<NameProvider>(context, listen: false).name;

      return Stack(
        children: [
          Scaffold(
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
                      Icons.info_outline,
                      size: 30,
                    ),
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (_) => const InfoPage()),
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
                    const SizedBox(height: 30),

                    // Big Title
                    RichText(
                      text: TextSpan(
                        text: 'Hai, ',
                        style: const TextStyle(
                          fontSize: 36,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Montserrat',
                          color: Color(0xFF30323F),
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: name,
                            style: const TextStyle(
                              color: Color(0xFF1B8345),
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          const TextSpan(
                            text: '.',
                            style: TextStyle(
                              color: Color(0xFF30323F),
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Keterangan tambahan
                    const Text(
                      "Ketuk salah satu untuk menampilkan animasi.",
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Listing Items
                    GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: animationList.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 8.0,
                        mainAxisSpacing: 8.0,
                        childAspectRatio: 155 / 77,
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
                                onTap: () => sendAnimationRequest(item.id),
                                child: Card(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: _selectedCardId == item.id
                                            ? const Color(0xFF1B8345)
                                            : const Color(0xFF30323F),
                                        width: 5.0,
                                      ),
                                      borderRadius: BorderRadius.circular(5.0),
                                    ),
                                    child: GifView.asset(
                                      'assets/images/animations_gif/${item.image}',
                                      fit: BoxFit.cover,
                                      frameRate: 12, // default is 15 FPS
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
          ),
          // Loading Indicator
          Visibility(
            visible: _isLoading,
            child: Container(
              color: const Color.fromARGB(162, 0, 0, 0),
              child: Center(
                child: GifView.asset(
                  'assets/images/toci_gif/04_toci_animation.gif',
                  width: MediaQuery.sizeOf(context).width / 3,
                  height: MediaQuery.sizeOf(context).width / 3,
                  frameRate: 2,
                ),
              ),
            ),
          ),
        ],
      );
    });
  }
}
