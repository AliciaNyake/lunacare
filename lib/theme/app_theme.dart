import 'package:flutter/material.dart';

Class AppTheme {   // classe qui servira à stocker les couleurs et thème
    static const Color primaryPurple = Color(0xFFB39DDB);  // une valeur fixe, couleur violette
    static const Color lightBackground = Color(0xFFF7F4FB);  //fond de couleur clair
    static const Color softPink = Color(0xFFF8D7DA); // couleur rose

    static ThemeData get lightTheme {  // On crée un thème clair accessible par AppTheme.lightTheme.
        return ThemeData(               // on retourne l'objet
            scaffoldBackgroundColor: lightBackground, //definit le background des pages
            primaryColor: primaryPurple,    // cette ligne definit la colour ptincipale des pages
            appBarTheme: const AppBarTheme(     //classe appbar personnalise la barre du haut
                backgroundColor: lightBackground,       //definit le fond(la couleure) de la barre
                foregroundColor: Colors.black,  //on defini la couleur du texte et des couleurs
                elevation: 0, // on enlève l'ombre de l'appbar
                centerTitle: true, // on centralise le titre
            ),
            ColorScheme: ColorScheme.fromSeed(
                seedColor: primaryPurple,  // on crée une palette de couleurs à partir du violet
            ),
            elevatedButtonTheme: ElevatedButtonThemeData(  // on personnalise les buttons élevés
                style: ElevatedButton.styleform( // défini le style du button
                    backgroundColor: primaryColor, // couleur de fond du button
                    foregroundColor: Colors.white, // couleur du texte(button)
                    shape: RoundedRectangleBorder( 
                        borderRadius: BorderRadius.circular(20), // donne des bords arrondis aux buttons
                    ),
                ),
            ),
        );
    }
}