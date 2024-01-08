import 'package:flutter/material.dart';

class Accueil extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Padding(
        padding: EdgeInsets.only(top: 100,left:16,right: 16,bottom:16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [

            Text(
              'Bienvenue sur votre application IT Share !',
              style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey
              ),
              textAlign: TextAlign.center,

            ),
            SizedBox(height: 16.0),
            Image.asset(
              'images/itShare.png', // Chemin de votre image
              height: 300.0,
              width: 300.0,
            ),
            SizedBox(height: 10.0),
            Text(
              'Bienvenue sur votre applicaion IT Share dédiée aux étudiants de la filière génie informatique. Cette application vous permet de partager des informations, poser des questions et interagir avec vos collègues de manière simple et efficace.',
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 50.0),
            ElevatedButton(
              onPressed: () {
               Navigator.pushNamed(context, '/login');
              },
              child: Text('Commencer'),
              style: ElevatedButton.styleFrom(
                primary: Colors.purple[500], // Couleur de fond du bouton
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0), // Bordures arrondies du bouton
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}