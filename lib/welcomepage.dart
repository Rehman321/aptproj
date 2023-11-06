import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class Myhome extends StatefulWidget {
  const Myhome({super.key});

  @override
  State<Myhome> createState() => _MyhomeState();
}

class _MyhomeState extends State<Myhome> {
  List images =[
    "welcome-img1.jpg",
    "welcome-img2.jpg",
    "welcome-img3.jpg",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
          itemCount: images.length,
          scrollDirection: Axis.horizontal,
          itemBuilder:(context,index){
            return Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image:AssetImage(
                    "img/" + images[index],
                  ),
                  fit: BoxFit.cover
                )
              ),
              child: Container(
                margin: const EdgeInsets.only(top:400),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: List.generate(3, (indexDots){
                       return Container(
                         margin: const EdgeInsets.only(left:9),
                         height: 8,
                         width:index==indexDots?25:8,
                         decoration: BoxDecoration(
                           borderRadius: BorderRadius.circular(10),
                           color:index==indexDots?Colors.grey:Colors.white
                         ),
                       );
                      }),
                    ),
                  ],
                ),
              ),
            );

      }),
    );
  }
}