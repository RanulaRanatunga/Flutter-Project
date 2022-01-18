import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_task/model/publish_ads_modal.dart';

class AdsCreateScreen extends StatefulWidget {
  const AdsCreateScreen({Key? key}) : super(key: key);

  @override
  State<AdsCreateScreen> createState() => _AdsCreateScreenState();
}

class _AdsCreateScreenState extends State<AdsCreateScreen> {
  final adName = TextEditingController();
  final adPrice = TextEditingController();
  final adDescription = TextEditingController();

  Future<void> insertData(final postingAds) async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

    firebaseFirestore
        .collection("postingAds")
        .add(postingAds)
        .then((DocumentReference document) {
      print(document.id);
    }).catchError((e) {
      print(e);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 50,
          ),
          TextFormField(
            style: TextStyle(color: Colors.black),
            decoration: InputDecoration(
              hintText: "Enter Ad Name",
              fillColor: Colors.grey[300],
              filled: true,
            ),
            controller: adName,
          ),
          SizedBox(
            height: 10,
          ),
          TextFormField(
            style: TextStyle(color: Colors.black),
            decoration: InputDecoration(
              hintText: "Enter Ad price",
              fillColor: Colors.grey[300],
              filled: true,
            ),
            controller: adPrice,
          ),
          SizedBox(
            height: 10,
          ),
          TextFormField(
            style: TextStyle(color: Colors.black),
            decoration: InputDecoration(
              hintText: "Enter Ad Description",
              fillColor: Colors.grey[300],
              filled: true,
            ),
            controller: adDescription,
          ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child:  SizedBox(
          width: 100,
          height: 30,
          child: TextButton(
            child: Text("Save"),
            style: TextButton.styleFrom(
              primary: Colors.blueAccent,
              backgroundColor: Colors.red,
            ),
            onPressed: () {
              final String aName = adName.text;
              final String aPrice = adPrice.text;
              final String aDesc = adDescription.text;

              final PublishAdsModal publishAdsModal = PublishAdsModal(
                  adName: aName, adPrice: aPrice, adDescription: aDesc);

              insertData(publishAdsModal.toMap());
            },
          ),
        ),
      )
        ],
      ),
    );
  }
}
