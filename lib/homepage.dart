import 'package:aptproj/widgets/large-text.dart';
import 'package:aptproj/widgets/small-text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
var images = {
  "welcome-img1.jpg":"Review1",
  "welcome-img2.jpg":"Review2",
  "welcome-img3.jpg":"Review3",
  "welcomefour.jpg":"Review4",
};
  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 5, vsync: this);
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //menu text
          Container(
            padding: const EdgeInsets.only(top: 20,left: 20),
            child: Row(
              children: [
                Icon(Icons.menu,color: Colors.black, size: 30,),
                Expanded(child: Container()),
                Container(
                  margin: const EdgeInsets.only(right: 20),
                  width: 40,
                  height: 30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey,
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 20,),
          //Plan a trip
          Container(
            margin: const EdgeInsets.only(left: 20),
            child: AppLargeText(text: "Plan Your Perfect Trip"),
          ),
          SizedBox(height: 10,),
          //tapbar
          Container(
            child: Align(
              alignment: Alignment.centerLeft,
              child: TabBar(
                labelPadding: const EdgeInsets.only(left:20, right:0 ),
                controller: _tabController,
                labelColor: Colors.blueAccent,
                unselectedLabelColor: Colors.grey,
                isScrollable: true,
                indicatorSize: TabBarIndicatorSize.label,
                tabs: [
                  Tab(text: "Mountains",),
                  Tab(text: "Sea",),
                  Tab(text: "Surfing",),
                  Tab(text: "Forest",),
                  Tab(text: "Hunting",),
                ],
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left:10,),
            width: double.maxFinite,
            height: 250,
            child: TabBarView(
              controller: _tabController,
              children: [
                ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount:3,
                  itemBuilder: (BuildContext context, int index)
                  {
                    return Container(
                      margin: const EdgeInsets.only(right: 20,top: 10,),
                      width: 200,
                    height: 300,
                    decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                  image: AssetImage(
                  "img/welcome-img3.jpg"
                  ),
                   fit: BoxFit.cover,
                    )
                    ),
                    );
                  },
                ),
                Tab(text: "Sea",),
                Tab(text: "Surfing",),
                Tab(text: "Forest",),
                Tab(text: "Hunting",),
              ],
            ),
          ),
          SizedBox(height: 30,),
          Container(
            margin: const EdgeInsets.only(left: 20,right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppLargeText(text: "Users Reviews",size: 20,),
                AppText(text: "Updated At",),
              ],
            ),
          ),
          SizedBox(height: 10,),
          Container(
            width:double.maxFinite,
            height: 120,
            margin: const EdgeInsets.only(left: 20, ),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 4,
                itemBuilder: (context,index){
              return Container(
                margin: const EdgeInsets.only(right: 30),
                child: Column(
                  children: [
                Container(
                //margin: const EdgeInsets.only(right: 50,),
                    width: 80,
                    height: 90,
                    decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                    image: AssetImage("img/"+images.keys.elementAt(index)),
                    fit: BoxFit.cover,)),
                ),
                    SizedBox(height:5,),
                    Container(
                      child: AppText(text:images.values.elementAt(index)),
                    )
                  ],
                ),
              );
            }),
          )

        ],
      ),
    );
  }
}
