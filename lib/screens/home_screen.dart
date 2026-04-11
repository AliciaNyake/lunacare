import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
    const HomeScreen ({super.key}) ;

@override
Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text('luna_care') ,
        ),
        body: const Center(
            child: Text(
                'Bienvenue sur luna_care',
                style: TextStyle(fontsize: 30),
            ),
        ),
    );
    
}
}