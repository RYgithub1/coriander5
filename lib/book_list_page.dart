import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class UserInformation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection('users');

    return StreamBuilder<QuerySnapshot>(
      stream: users.snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text("Loading");
        }

        return new ListView(
          children: snapshot.data.docs.map((DocumentSnapshot document) {
            return new ListTile(
              title: new Text(document.data()['full_name']),
              subtitle: new Text(document.data()['company']),
            );
          }).toList(),
        );
      },
    );
  }
}


//
// class BookList extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//
//     // FirebaseFirestore firestore = FirebaseFirestore.instance;
//     FirebaseFirestore users = FirebaseFirestore.instance.collection('users');
//
//
//     return StreamBuilder<QuerySnapshot>(
//       stream: FirebaseFirestore.instance.collection('books').snapshots(),
//       builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
//         if (snapshot.hasError)
//           return new Text('Error: ${snapshot.error}');
//         switch (snapshot.connectionState) {
//           case ConnectionState.waiting: return new Text('Loading...');
//           default:
//             return new ListView(
//               children: snapshot.data.docs.map((DocumentSnapshot document) {
//                 return new ListTile(
//                   title: new Text(document.data()['title']),
//                 );
//               }).toList(),
//             );
//         }
//       },
//     );
//   }
// }