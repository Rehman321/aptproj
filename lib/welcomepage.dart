import 'package:aptproj/cubit/app_cubits.dart';
import 'package:aptproj/homepage.dart';
import 'package:aptproj/widgets/large-text.dart';
import 'package:aptproj/widgets/responsive-button.dart';
import 'package:aptproj/widgets/small-text.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Myhome extends StatefulWidget {
  const Myhome({super.key});

  @override
  State<Myhome> createState() => _MyhomeState();
}

class _MyhomeState extends State<Myhome> {
  List images =[
    "welcome-img3.jpg",
    "welcome-img2.jpg",
    "welcome-img3.jpg",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
          itemCount: images.length,
          scrollDirection: Axis.vertical,
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
                margin: const EdgeInsets.only(top:150,left: 20,right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppLargeText(text: "Trip"),
                        AppText(text: "Let's Discover"),
                        SizedBox(height: 20,),
                        GestureDetector(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage(),));
                          },
                          child: Container(

                              child: ResponsvieButton(width: 120,)),
                        )
                      ],
                    ),
                    Column(
                      children: List.generate(3, (indexDots){
                       return Container(
                         margin: const EdgeInsets.only(left:120,),
                         height: index==indexDots?25:8,
                         width:8,
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
      }
      ),

    );
  }
}