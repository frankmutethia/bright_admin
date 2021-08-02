// import 'package:msafiri_admin/display.dart';
import 'package:brightcare_admin/sheet_files.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Bookings extends StatefulWidget {
  static final String id = "book";
  @override
  _BookingsState createState() => _BookingsState();
}

class _BookingsState extends State<Bookings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "View Users Booking Data",
          style: TextStyle(
            fontSize: 18.0,
          ),
        ),
        elevation: 0.0,
        centerTitle: false,
        // actions: [
        //   GestureDetector(
        //     onTap: () {
        //       Navigator.push(
        //         context,
        //         MaterialPageRoute(builder: (context) => SheetFiles()),
        //       );
        //     },
        //     child: Container(
        //       padding: EdgeInsets.symmetric(horizontal: 16),
        //       child: Icon(Icons.file_copy_sharp),
        //     ),
        //   ),
        // ],
        // leading: Icon(
        //   Icons.arrow_back,
        //   size: 26.0,
        // ),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: Firestore.instance.collection("bookings").snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) return Text('There is no Users');
          return new ListView(children: getTest(snapshot));
        },
      ),
    );
  }

  getTest(AsyncSnapshot<QuerySnapshot> snapshot) {
    return snapshot.data.documents
        .map((doc) => Container(
              child: Column(
                children: [
                  Text(
                    doc["field1"],
                    style: TextStyle(fontSize: 17.0),
                  ),
                  Text(
                    doc["field2"],
                    style: TextStyle(fontSize: 17.0),
                  ),
                  Text(
                    doc["field3"],
                    style: TextStyle(fontSize: 17.0),
                  ),
                  Text(
                    doc["field3"],
                    style: TextStyle(fontSize: 17.0),
                  ),
                  Text(
                    doc["field4"],
                    style: TextStyle(fontSize: 17.0),
                  ),
                  // subtitle: Text(
                  //   doc["field3"],
                  //   style: TextStyle(fontSize: 17.0),
                  // ),
                ],
              ),
            ))
        .toList();
  }
}
