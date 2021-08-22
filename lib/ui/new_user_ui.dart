import 'package:flutter/material.dart';

class NewUserUI extends StatelessWidget {
  const NewUserUI({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final ButtonStyle style =
    //     ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "New User",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.amberAccent,
      ),
      backgroundColor: Colors.pinkAccent,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: <Widget>[
            Row(children: <Widget>[
              Column(
                children: [
                  Icon(Icons.person_add_alt_1, color: Colors.white,),
                ],
              ),
              Column(
                children: [
                  SizedBox(width: 5,),
                ],
              ),
              Column(
                children: [
                  Text(
                    "New User",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ],
              ),
            ]),
            Divider(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: TextField(
                  decoration: InputDecoration(
                      hintText: "Name",
                      labelStyle: TextStyle(color: Colors.white),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      contentPadding: EdgeInsets.all(8))),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: TextField(
                  decoration: InputDecoration(
                      hintText: "Email",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      contentPadding: EdgeInsets.all(8))),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: TextField(
                  decoration: InputDecoration(
                      hintText: "Password",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      contentPadding: EdgeInsets.all(8))),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: TextField(
                  decoration: InputDecoration(
                      hintText: "Confirm Password",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      contentPadding: EdgeInsets.all(8))),
            ),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      textStyle: const TextStyle(fontSize: 20)),
                  onPressed: () {},
                  child: const Text('Add',),
                ),
                SizedBox(width: 10,),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      textStyle: const TextStyle(fontSize: 20),
                      primary: Colors.red),
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Cancel'),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
