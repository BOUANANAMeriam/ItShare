
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Annonce.dart';

class PageAnnonces extends StatelessWidget {
  final Announce announce;

  PageAnnonces(this.announce);

  @override
  Widget build(BuildContext context) {
    // Build the UI for the OtherPage using the provided 'ville' object
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 191, 179, 191),
      appBar: AppBar(
        title: Text('Description page'),
        backgroundColor: Colors.purple,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 50),
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: AssetImage("../images/announce.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 70),

            Text(
              announce.name,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 4, 9, 76),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.all(20),
              child: SingleChildScrollView(
                child: Text(
                  announce.description,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );




  }
}