
import 'package:flutter/material.dart';
class Profil extends StatefulWidget {
  final String username;
  final String email;
  final String niveau;
  final String photo;

  const Profil({Key? key,required this.username , required this.email , required this.photo , required this.niveau}) : super(key: key);

  @override
  State<Profil> createState() => _ProfilState();
}

class _ProfilState extends State<Profil> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        elevation: 0,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 130),
        child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CircleAvatar(
              backgroundImage: AssetImage(widget.photo),
              radius: 80,
              backgroundColor: Colors.grey[300],
            ),
            const SizedBox(
            height: 30,
            ),
            const SizedBox(height: 4),
            Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
                      const Text("Full Name", style: TextStyle(fontSize: 17)),
                      Text(widget.username, style: const TextStyle(fontSize: 17)),
                ],
            ),
           const Divider(
          height: 40, color: Colors.purple,
           ),
            Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: [
          const Text("Email", style: TextStyle(fontSize: 17)),
               Text( widget.email, style: const TextStyle(fontSize: 17)),
             ],
          ),
            const Divider(
              height: 40, color: Colors.purple,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Niveau", style: TextStyle(fontSize: 17)),
                Text( widget.niveau, style: const TextStyle(fontSize: 17)),
              ],
            ),
         ],
    ),
    ),


    );
  }
}





