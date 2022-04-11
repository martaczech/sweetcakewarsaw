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
  var rating = 3.0;
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
            decoration: const InputDecoration(
              hintText: 'Podaj nazwę ciastka',
            ),
            onChanged: (newValue) {
              setState(() {
                cakeName = newValue;
              });
            },
          ),
          Slider(
            onChanged: (newValue) {
              setState(() {
                rating = newValue;
              });
            },
            value: rating,
            min: 1.0,
            max: 6.0,
            divisions: 10,
            label: rating.toString(),
          ),
          ElevatedButton(
            onPressed: () {
              FirebaseFirestore.instance.collection('places').add({
                'name': placeName,
                'ciastko': cakeName,
                'rating': rating,
              });
            },
            child: const Text('Dodaj'),
          ),
        ],
      ),
    );
  }
}
