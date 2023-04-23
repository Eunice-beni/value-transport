import "package:flutter/material.dart";

class Thanks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Column(
        children: [
        Container(
          margin: EdgeInsets.only(top: 30),
          child: CircleAvatar(
            foregroundImage: AssetImage("images/logo.png"),
            radius: 40,
            ),
        ),
        SizedBox(height: 10),
        Text("Prix",
            style: TextStyle(
              fontSize: 20, 
              fontWeight: FontWeight.bold
              ),
            ),
        SizedBox(height: 10),
        SizedBox(height: 20),
        SizedBox(height: 20),
      
      ]
    ),
    );
  }
}
