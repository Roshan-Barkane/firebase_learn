import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Inset_Data extends StatefulWidget {
  const Inset_Data({super.key});

  @override
  State<Inset_Data> createState() => _Inset_DataState();
}

class _Inset_DataState extends State<Inset_Data> {
  addDate(value) async {
    await FirebaseFirestore.instance.collection("Students").add({
      'name': value,
    });
  }

  String name = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 217, 229, 107),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.all(20.0),
              child: TextField(
                onChanged: (value) {
                  setState(() {
                    name = value;
                  });
                },
                decoration: const InputDecoration(
                    hintText: "Enter Any Data",
                    hintStyle: TextStyle(
                      fontSize: 20,
                    )),
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            ElevatedButton(
              onPressed: () => addDate(name),
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.yellowAccent,
                  minimumSize: const Size(200, 40)),
              child: const Text(
                "Inset Date",
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
            )
          ],
        ),
      ),
    );
  }
}
