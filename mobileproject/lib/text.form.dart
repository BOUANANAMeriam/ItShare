import 'package:flutter/material.dart';

class TextFormD extends StatefulWidget {
  const TextFormD(
      {super.key,
      required this.controller,
      required this.textF,
      required this.textInputType,
      required this.obscure});
  final TextEditingController controller;
  final String textF;
  final TextInputType textInputType;
  final bool obscure;


  @override
  State<TextFormD> createState() => _TextFormDState();
}

class _TextFormDState extends State<TextFormD> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      padding: const EdgeInsets.only(left: 15, top: 3),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(6),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 7,
            )
          ]),
      child: TextFormField(
        controller: widget.controller,
        keyboardType: widget.textInputType,
        obscureText: widget.obscure,
        decoration: InputDecoration(
          hintText: widget.textF,
          border: InputBorder.none,
          contentPadding: const EdgeInsets.all(0),
          hintStyle: const TextStyle(
            height: 1,
          ),
        ),
      ),
    );
  }
}
