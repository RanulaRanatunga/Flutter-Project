import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_task/screens/ads_create_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leading: Icon(
            Icons.menu,
            color: Colors.black,
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search, color: Colors.black),
              onPressed: () {},
            )
          ],
        ),
        body: Container(
          height: size.height,
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Expanded(
                    child: StreamBuilder<QuerySnapshot>(
                      stream: FirebaseFirestore.instance.collection("ads").snapshots(),
                      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> querysnapshot){
                        if(querysnapshot.hasError)
                          return Text("Something is not right");
                        if(querysnapshot.connectionState == ConnectionState.waiting){
                          return CircularProgressIndicator();
                        } else {
                          final list = querysnapshot.data!.docs;
                          return ListView.builder(itemBuilder: (context,
                              index) {
                            return ListTile(
                             title: Text(list[index]["adName"]),
                              subtitle: Text(list[index]["adPrice"]),
                            );
                          },
                            itemCount: list.length,
                          );
                        }
                      },
                    ),
                  ),

                ],
              )
            ],

          ),
        ),
          floatingActionButton: new FloatingActionButton(
              elevation: 0.0,
              child: new Icon(Icons.add),
              backgroundColor: new Color(0xFFE57373),
              onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AdsCreateScreen()),
                );
              }
          )
      ),
    );
  }
}
