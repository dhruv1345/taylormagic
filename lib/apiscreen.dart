import 'dart:convert';
import 'package:flutter/material.dart';
// import 'package:taylormagic/splashscreen.dart';
import 'package:lottie/lottie.dart';
import 'package:http/http.dart' as http;

class apiCalling extends StatefulWidget {
  const apiCalling({super.key});

  @override
  State<apiCalling> createState() => _apiCallingState();
}

class _apiCallingState extends State<apiCalling> {
  var users;
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
                                return Card(
                                  margin: EdgeInsets.only(
                                      top: 12, bottom: 12, left: 7, right: 7),
                                  child: Text(
                                    users,
                                    style: TextStyle(
                                      fontSize: 40,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                );
                              })),
                        ),
                      )
                    : Container(),
                Column(
                  children: [
                    SizedBox(height: 150),
                    ElevatedButton(
                      onPressed: fetchTaylor,
                      child: const Text("Words by Taylor"),
                    ),
                    SizedBox(height: 170),
                    LottieBuilder.network(
                        'https://assets10.lottiefiles.com/packages/lf20_s9dkwhdi.json')
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
    print('Here is you quote');
    const url = 'https://taylorswiftapi.onrender.com/get';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;
    final json = jsonDecode(body);
    setState(() {
      users = json['quote'];
      print(users);
    });
    print('completed');
  }
}
