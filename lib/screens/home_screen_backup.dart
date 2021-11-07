import 'package:family_care_app/screens/login_screen.dart';
import 'package:family_care_app/screens/new_user_screen.dart';
import 'package:flutter/material.dart';

class HomeScreenBackup extends StatefulWidget {
  const HomeScreenBackup({Key? key}) : super(key: key);

  @override
  _HomeScreenBackupState createState() => _HomeScreenBackupState();
}

class _HomeScreenBackupState extends State<HomeScreenBackup> {
  @override
  Widget build(BuildContext context) {
    const _buttonTextStyle = TextStyle(fontSize: 20, color: Colors.black87);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Family Care",
          style: TextStyle(color: Colors.black87),
        ),
        backgroundColor: Colors.amberAccent,
      ),
      backgroundColor: Colors.pinkAccent,
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(4),
                      child: Stack(
                        children: <Widget>[
                          Positioned.fill(
                            child: Container(
                              decoration: const BoxDecoration(
                                gradient: LinearGradient(
                                  colors: <Color>[
                                    Color(0xFF0D47A1),
                                    Color(0xFF1976D2),
                                    Color(0xFF42A5F5),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 100,
                            width: 150,
                            child: TextButton(
                              style: TextButton.styleFrom(
                                padding: const EdgeInsets.all(16.0),
                                primary: Colors.white,
                                textStyle: const TextStyle(fontSize: 20),
                              ),
                              onPressed: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => NewUserScreen())),
                              child: const Text('New User'),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(4),
                      child: Stack(
                        children: <Widget>[
                          Positioned.fill(
                            child: Container(
                              decoration: const BoxDecoration(
                                gradient: LinearGradient(
                                  colors: <Color>[
                                    Color(0xFF0D47A1),
                                    Color(0xFF1976D2),
                                    Color(0xFF42A5F5),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 100,
                            width: 150,
                            child: TextButton(
                              style: TextButton.styleFrom(
                                padding: const EdgeInsets.all(16.0),
                                primary: Colors.white,
                                textStyle: const TextStyle(fontSize: 20),
                              ),
                              onPressed: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LoginScreen())),
                              child: const Text('Login'),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
