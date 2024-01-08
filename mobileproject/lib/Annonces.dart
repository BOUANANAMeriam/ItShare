
import 'package:flutter/material.dart';
import 'package:mobileproject/Annonce.dart';
import 'package:mobileproject/PageAnnonces.dart';





List announces = [
  Announce("Hackathon", "L'événement se déroulera ce lundi. Venez mettre à l'épreuve vos compétences en codage et résoudre des problèmes passionnants !"),
  Announce("Conférence sur l'intelligence artificielle", "Rejoignez-nous demain pour une conférence fascinante sur l'intelligence artificielle et ses applications."),
  Announce("Atelier de développement web", "Apprenez les bases du développement web lors de notre atelier interactif. Aucune expérience préalable requise !"),
  Announce("Séminaire sur l'entrepreneuriat", "Découvrez les clés du succès en entrepreneuriat lors de notre séminaire spécialisé. Des entrepreneurs chevronnés partageront leurs expériences."),
  Announce("Formation sur la gestion du temps", "Améliorez votre productivité et apprenez à gérer votre temps de manière efficace lors de notre formation pratique."),
  Announce("Conférence sur la cybersécurité", "Soyez conscient des menaces en ligne et apprenez comment protéger vos données lors de notre conférence sur la cybersécurité."),
  Announce("Séance de méditation guidée", "Détendez-vous et libérez votre stress lors de notre séance de méditation guidée. Apportez votre tapis de yoga !"),
  Announce("Tournoi de jeux vidéo", "Affrontez d'autres joueurs dans notre tournoi de jeux vidéo et montrez vos compétences pour remporter des prix incroyables !"),
  Announce("Exposition artistique", "Admirez les créations d'artistes locaux lors de notre exposition artistique. Une expérience visuelle unique vous attend !")
];




class CardVilles extends StatefulWidget {
  @override
  _CardVillesState createState() => _CardVillesState();
}

class _CardVillesState extends State<CardVilles> {
  void _deleteAnnounce(int index) {
    setState(() {
      announces.removeAt(index);
    });
  }
  void _modifyAnnounce(int index) {
    // Retrieve the selected Ville object from the list
    Announce selectedAnnounce = announces[index];

    // Open a dialog for modifying the selected Ville
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // Variables for storing the modified values
        String modifiedName = selectedAnnounce.name;
        String modifiedDescription = selectedAnnounce.description;


        return AlertDialog(
          title: Text('Modifier une Announce'),
          content: SingleChildScrollView(
            child: Column(
              children: [
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Nom',
                  ),
                  onChanged: (value) {
                    modifiedName = value;
                  },
                  controller: TextEditingController(text: selectedAnnounce.name),
                ),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Description',
                  ),
                  onChanged: (value) {
                    modifiedDescription = value;
                  },
                  controller: TextEditingController(text: selectedAnnounce.description),
                ),

              ],
            ),
          ),
          actions: [
            TextButton(
              child: Text('Annuler'),

              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Modifier'),
              onPressed: () {
                // Update the selected Ville with the modified values
                announces[index] = Announce(
                  modifiedName,
                  modifiedDescription,

                );

                setState(() {
                  // Update the UI to reflect the changes
                });

                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _openAddAnnounceWindow(BuildContext context) {
    // Déclarer les variables pour stocker les valeurs saisies
    String name = '';
    String description = '';

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Ajouter une Announce'),
          content: SingleChildScrollView(
            child: Column(
              children: [
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Nom',
                  ),
                  onChanged: (value) {
                    name = value;
                  },
                ),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Description',
                  ),
                  onChanged: (value) {
                    description = value;
                  },
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              child: Text('Annuler'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Ajouter'),
              onPressed: () {
                // Créer une instance de Ville avec les valeurs saisies
                Announce newVille = Announce(name, description);


                // Ajouter la nouvelle ville au tableau des villes
                announces.add(newVille);
                setState(() {
                  // Mettre à jour la liste des villes
                });

                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DetailsPage'),
        backgroundColor: Colors.purple,
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              _openAddAnnounceWindow(context);
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: announces.length,
        itemBuilder: (BuildContext context, int index) {
          var announce = announces[index];

          return Card(

            child: GestureDetector(

              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PageAnnonces(announce)),
                );
              },
              child: ListTile(
                hoverColor: Colors.green,
                selectedColor: Colors.green,
                title: Text(announce.name, style: TextStyle(fontSize: 20,color: Colors.orange,fontStyle: FontStyle.italic)),
                subtitle: Text("Description :" + announce.description,style: TextStyle(color: Colors.grey)),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: Icon(Icons.edit),
                      onPressed: () {
                        _modifyAnnounce(index);
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () {
                        _deleteAnnounce(index);
                      },
                    ),
                  ],
                ),

              ),
            ),

          );
        },
      ),
    );
  }
}