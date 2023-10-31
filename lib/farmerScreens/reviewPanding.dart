import 'package:farmwise/main.dart';
import 'package:flutter/material.dart';

class reviewPanding extends StatefulWidget {
  const reviewPanding({super.key});

  @override
  State<reviewPanding> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<reviewPanding> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            flexibleSpace: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("bgAppbar.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            title: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Review Panding",
                  style: TextStyle(
                      color: Color.fromARGB(255, 192, 226, 190),
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      fontFamily: 'Montserrat'),
                ),
                
              ],
            )),
       
          
        );
  }
}
