import 'package:flutter/material.dart';

class CardStart extends StatelessWidget {
  const CardStart({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
                  height: MediaQuery.of(context).size.height*0.3,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/libraries.jpg'),
                          fit: BoxFit.cover,
                          ),
                          ),
                      child: const Padding(
                        padding:  EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Align(
                              alignment: Alignment.bottomLeft,
                              child: Text('Book App', style: TextStyle(color: Colors.white, fontSize: 20),textAlign: TextAlign.left,)),
                            Align(
                              alignment: Alignment.bottomLeft,
                              child: Text('Enjoy reading', style: TextStyle(color: Colors.white ,fontSize: 13), textAlign: TextAlign.start,)),
                            SizedBox(height: 10,),
                            Center(child:Text('Bootcamp', style: TextStyle(color: Colors.white, fontSize: 26), textAlign: TextAlign.center,),)
                          ],
                        ),
                      ),
                      );
  }
}