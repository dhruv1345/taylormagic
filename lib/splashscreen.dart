import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:taylormagic/apiscreen.dart';
// import 'package:google_fonts/google_fonts.dart';

class splashScreen extends StatelessWidget {
  const splashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 60),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        const Text(
                          'Taylor\'s Fan ?',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              // fontFamily: 'OpenSans-Light',
                              // color: Color.fromARGB(255, 168, 198, 169),
                              color: Colors.pink),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'This App is for you',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              // fontFamily: 'OpenSans-Light',
                              // color: Color.fromARGB(255, 168, 198, 169),
                              color: Colors.pink),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 30),
                LottieBuilder.asset('animations/home.json'),
                SizedBox(height: 50),
                OutlinedButton(
                    style: OutlinedButton.styleFrom(
                        shape: StadiumBorder(),
                        side: BorderSide(width: 1.5, color: Colors.grey)),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const apiCalling()),
                      );
                    },
                    child: Text(
                      'Click to see what Taylor Has for You 💗',
                      style: TextStyle(
                          color: Colors.pink, fontWeight: FontWeight.bold),
                    )),
                // FloatingActionButton(
                //   onPressed: () {
                //     Navigator.push(
                //       context,
                //       MaterialPageRoute(
                //           builder: (context) => const apiCalling()),
                //     );
                //   },
                //   child: Icon(Icons.fingerprint),
                //   backgroundColor: Colors.green,
                // )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
