import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddOpinionPageContent extends StatefulWidget {
  const AddOpinionPageContent({
    Key? key,
    required this.onSave,
  }) : super(key: key);
  final Function onSave;

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
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextField(
              decoration:
                  const InputDecoration(hintText: 'Podaj nazwę miejsca'),
              onChanged: (newValue) {
                setState(() {
                  placeName = newValue;
                });
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextField(
              decoration: const InputDecoration(
                hintText: 'Podaj nazwę ciastka',
              ),
              onChanged: (newValue) {
                setState(() {
                  cakeName = newValue;
                });
              },
            ),
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
            activeColor: const Color.fromARGB(255, 221, 66, 245),
          ),
          ElevatedButton(
            onPressed: placeName.isEmpty || cakeName.isEmpty
                ? null
                : () {
                    FirebaseFirestore.instance.collection('places').add({
                      'name': placeName,
                      'ciastko': cakeName,
                      'rating': rating,
                    });
                    widget.onSave();
                  },
            style: ElevatedButton.styleFrom(primary: Colors.purple),
            child: const Text('Dodaj'),
          ),
        ],
      ),
    );
  }
}
