import 'package:flutter/material.dart';

import '../widgets/button_next_page.dart';
import 'book_shelf.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery. of(context). size. width ;
    double screenHeight = MediaQuery. of(context). size. height;
    return Container(
          height: screenHeight,
          width: screenWidth,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/background.jpg'),
              fit: BoxFit.fill
              ),
          ),
        child: Padding(
          padding: EdgeInsets.fromLTRB(30,0,30,screenHeight*0.15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
                const Row(
                  children: [
                    Text('¿Qué \ndeseas \nleer ?',
                    style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                  Spacer()
                  ],
                ),
                const Text('La lectura de libros es un pasaporte a otros mundos, una puerta a la imaginación que nos transporta a tierras lejanas, épocas pasadas o futuros inexplorados. Cada libro es un viaje único que nos permite crecer y transformarnos, todo mientras exploramos el poder de las palabras impresas.',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                textAlign: TextAlign.justify,
                ),
                const SizedBox(height: 15,),
                Row(
                  children: [
                    const Spacer(),
                    GestureDetector(
                      child: const ButtonNext(boxColor: Colors.purple, boxText: 'Bookshelf'),
                      onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const BookShelf(), 
                        ),
                      );
                    },
                      ),
                  ],
                )
              ],
            ),
        ),
    );
  }}