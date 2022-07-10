import 'package:flutter/material.dart';
import 'package:interview_task/widgets/bottom_nav_bar.dart';
import 'package:interview_task/widgets/dialer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Dialer(),
    );
  }
}

final TextEditingController phoneNumberControl = TextEditingController();
final TextEditingController nameControl = TextEditingController();

class Dialer extends StatelessWidget {
  const Dialer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.blueGrey.shade900,
        title: const Text('Dialer'),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.white,
        child: const Icon(
          Icons.pix_rounded,
          color: Colors.black,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: const AnimatedBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: size * .85,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.blueGrey.shade900,
                  Colors.white,
                ],
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: nameControl,
                    decoration: const InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        label: Text('Name'),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(4.0)),
                        )),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    enabled: false,
                    decoration: const InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        label: Text('Email'),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(4.0)),
                        )),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    enabled: false,
                    keyboardType: TextInputType.phone,
                    controller: phoneNumberControl,
                    onSaved: (phoneNumber) {
                      phoneNumberControl.text = phoneNumber!;
                    },
                    decoration: const InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        label: Text('Number'),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(4.0)),
                        )),
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          DialerButton(
                            number: '1',
                            color: Colors.indigo.shade800,
                          ),
                          const DialerButton(
                            number: '2',
                            color: Colors.blue,
                          ),
                          DialerButton(
                            number: '3',
                            color: Colors.indigo.shade800,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const DialerButton(
                            number: '4',
                            color: Colors.blue,
                          ),
                          DialerButton(
                            number: '5',
                            color: Colors.teal.shade400,
                          ),
                          const DialerButton(
                            number: '6',
                            color: Colors.blue,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          DialerButton(
                            number: '7',
                            color: Colors.teal.shade400,
                          ),
                          DialerButton(
                            number: '8',
                            color: Colors.indigo.shade800,
                          ),
                          DialerButton(
                            number: '9',
                            color: Colors.teal.shade400,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: const [
                          DialerButton(
                            number: 'Call',
                            color: Colors.green,
                          ),
                          DialerButton(
                            number: '0',
                            color: Colors.blue,
                          ),
                          DialerButton(
                            number: 'Remove',
                            color: Colors.red,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
