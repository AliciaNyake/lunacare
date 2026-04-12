import 'package:flutter/material.dart';
import '../services/cycle_service.dart';
import '../services/cycle_logic_service.dart';

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
                style: TextStyle(fontSize: 30),
            ),
        ),
    );
    
}
}