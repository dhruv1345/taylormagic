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
                SizedBox(height: 90),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: const Text(
                      'Best Place to find Motivation',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          // fontFamily: 'OpenSans-Light',
                          color: Colors.green),
                    ),
                  ),
                ),
                SizedBox(height: 50),
                LottieBuilder.network(
                    'https://assets2.lottiefiles.com/packages/lf20_C67qsN3hAk.json'),
                SizedBox(height: 50),
                OutlinedButton(
                    style: OutlinedButton.styleFrom(
                        shape: StadiumBorder(),
                        side: BorderSide(width: 1.5, color: Colors.green)),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const apiCalling()),
                      );
                    },
                    child: Text(
                      'Click to hear what Taylor Has for You 💗',
                      style: TextStyle(
                          color: Colors.green, fontWeight: FontWeight.bold),
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
