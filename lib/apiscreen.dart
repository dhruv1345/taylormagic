import 'dart:convert';
import 'package:flutter/material.dart';
// import 'package:taylormagic/splashscreen.dart';
import 'package:lottie/lottie.dart';
import 'package:share_plus/share_plus.dart';
import 'package:http/http.dart' as http;

class apiCalling extends StatefulWidget {
  const apiCalling({super.key});

  @override
  State<apiCalling> createState() => _apiCallingState();
}

class _apiCallingState extends State<apiCalling> {
  var users;

  // void _shareContent() async {
  //   Share.share(users);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Tayloring Energy'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                SizedBox(height: 50),
                users != null
                    ? Padding(
                        padding: const EdgeInsets.only(
                            top: 55.0, bottom: 50, left: 25, right: 25),
                        child: Container(
                          height: MediaQuery.of(context).size.height,
                          child: ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: 1,
                              itemBuilder: ((context, index) {
                                return Column(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                     
                                        borderRadius: BorderRadius.circular(12),
                                        border: Border.all(
                                            color: Colors.white, width: 2),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.lightBlueAccent,
                                            blurRadius: 30,
                                          ),
                                        ],
                                      ),
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(12.0),
                                            child: Text(
                                              users,
                                              style: const TextStyle(
                                                fontSize: 30,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                          // Row(
                                          //   children: [
                                          //     ElevatedButton(
                                          //       onPressed: () {},
                                          //       child: const Icon(Icons.share),
                                          //     )
                                          //   ],
                                          // )
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 20),
                                    ElevatedButton.icon(
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.blue),
                                      onPressed: () {
                                        Share.share(
                                            "This motivational quote is from Taylor Swift. Through an app made by Dhruv Gupta 💗 : " +
                                                users);
                                      },
                                      icon: Icon(Icons.share),
                                      label: Text("Share this"),
                                    ),
                                  ],
                                );
                              })),
                        ),
                      )
                    : Container(),
                Column(
                  children: [
                    SizedBox(height: 100),
                    SizedBox(
                      width: MediaQuery.of(context).size.width - 70,
                      height: 50,
                      child: ElevatedButton.icon(
                        icon: Icon(Icons.touch_app),
                        onPressed: fetchTaylor,
                        label: const Text(
                          "Words by Taylor",
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.white, width: 2),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.blue,
                              blurRadius: 30,
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Fetching might take some time.",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 60),
                    LottieBuilder.asset(
                      'animations/duck.json',
                      height: 300,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void fetchTaylor() async {
    // print('Here is your quote');
    const url = 'https://taylorswiftapi.onrender.com/get';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;
    final json = jsonDecode(body);
    setState(() {
      users = json['quote'];
      print(users);
    });
    // print('completed');
  }
}
