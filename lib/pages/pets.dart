import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class petsdata extends StatefulWidget {
  const petsdata({super.key});

  @override
  State<petsdata> createState() => _petsdataState();
}

class _petsdataState extends State<petsdata> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("PETS DATA"),
      ),
      body: Container(
        margin: EdgeInsets.all(10),
        child: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection("pets").snapshots(),
          builder: (context, petSnapshot) {
            if (petSnapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else {
              final PetsDocs = petSnapshot.data!.docs;
              return ListView.builder(
                  itemCount: PetsDocs.length,
                  itemBuilder: (context, index) {
                    return Card(
                      elevation: 10.0,
                      shadowColor: Color.fromARGB(255, 6, 21, 228),
                      color: Color.fromARGB(255, 224, 85, 132),
                      child: ListTile(
                        title: Text(PetsDocs[index]['name']),
                        subtitle: Text(PetsDocs[index]['animal']),
                      ),
                    );
                  });
            }
          },
        ),
      ),
    );
  }
}
