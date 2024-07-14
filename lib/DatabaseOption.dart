import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:login_auth/database/databaseFunction.dart';
import 'package:login_auth/pages/pets.dart';

class DatabaseOption extends StatefulWidget {
  const DatabaseOption({super.key});

  @override
  State<DatabaseOption> createState() => _DatabaseOptionState();
}

class _DatabaseOptionState extends State<DatabaseOption> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('database option'),
        actions: [
          IconButton(
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
              },
              icon: Icon(Icons.logout_outlined))
        ],
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  Create("pets", "max", 'blacky', 'cat', 1);
                },
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [Icon(Icons.add), Text("Create")],
                  ),
                )),
            SizedBox(
              height: 30.0,
            ),
            ElevatedButton(
                onPressed: () {
                  Update("pets", 'max', "age", 2);
                },
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [Icon(Icons.update_sharp), Text("Update")],
                  ),
                )),
            SizedBox(
              height: 30.0,
            ),
            ElevatedButton(
                style: ButtonStyle(
                
                ),
                onPressed: () {
                  //  Retrive("pets");
                  Navigator.push(context,
                      MaterialPageRoute(builder: (contex) => petsdata()));
                },
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [Icon(Icons.get_app), Text("Retrieve")],
                  ),
                )),
            SizedBox(
              height: 30.0,
            ),
            ElevatedButton(
                onPressed: () {
                  Delete("pets", "max");
                },
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [Icon(Icons.delete), Text("Delete")],
                  ),
                )),
            SizedBox(
              height: 30.0,
            ),
          ],
        ),
      ),
    );
  }
}
