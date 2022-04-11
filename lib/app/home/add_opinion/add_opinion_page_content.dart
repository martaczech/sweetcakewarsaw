import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddOpinionPageContent extends StatefulWidget {
  const AddOpinionPageContent({
    Key? key,
  }) : super(key: key);

  @override
  State<AddOpinionPageContent> createState() => _AddOpinionPageContentState();
}

class _AddOpinionPageContentState extends State<AddOpinionPageContent> {
  var placeName = '';
  var cakeName = '';
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            decoration: const InputDecoration(hintText: 'Podaj nazwę miejsca'),
            onChanged: (newValue) {
              setState(() {
                placeName = newValue;
              });
            },
          ),
          TextField(
            decoration: const InputDecoration(hintText: 'Podaj nazwę ciastka'),
            onChanged: (newValue) {
              setState(() {
                cakeName = newValue;
              });
            },
          ),
          ElevatedButton(
              onPressed: () {
                FirebaseFirestore.instance.collection('restaurants').add({
                  'name': placeName,
                  'cake': cakeName,
                  'rating': 3.0,
                });
              },
              child: const Text('Dodaj'))
        ],
      ),
    );
  }
}
