
import 'dart:math';
import 'dart:ui';

import 'package:demo/info.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
      home: AbstractionLayer()));
}

class AbstractionLayer extends StatefulWidget{

  @override
  State<AbstractionLayer> createState() => _AbstractionLayerState();
}

class _AbstractionLayerState extends State<AbstractionLayer> with SingleTickerProviderStateMixin{
  late AnimationController _animationController;

  late PageController _pageController;
  int _currentPage = 0;
  var datalist = ["A", "B", "C", "D"];

  @override
  void initState() {
    // TODO: implement initState
    _pageController =
        PageController(initialPage: _currentPage, viewportFraction: 0.8);
    _animationController = AnimationController(vsync: this,duration: const Duration(milliseconds: 2000));
    _animationController.forward();
    super.initState();

  }

  @override
  void dispose() {
    // TODO: implement dispose

    _pageController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(

      // appBar: AppBar(),
      backgroundColor: Colors.black,

      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(
                top: 30, bottom: 15.0, left: 15, right: 15),
            child: Row(mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Column(crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Discover", style: TextStyle(color: Colors.white,
                        fontWeight: FontWeight.bold, fontSize: 20),),
                    Text("Trending Locations Today",
                        style: TextStyle(color: Colors.white70))
                  ],),
                const Spacer(),
                IconButton(onPressed: () {}, icon: Icon(Icons.filter_list,color: Colors.white,),),
                CircleAvatar(
                  backgroundImage: const NetworkImage(
                    "https://upload.wikimedia.org/wikipedia/commons/thumb/b/b6/Image_created_with_a_mobile_phone.png/220px-Image_created_with_a_mobile_phone.png",),
                  backgroundColor: Colors.grey.shade200,)
              ],),
          ),
          AspectRatio(
            aspectRatio: 0.85,
            child: PageView.builder(
                itemCount: datalist.length,
                physics: const ClampingScrollPhysics(),
                controller: _pageController,
                itemBuilder: (cntxt, index) {
                  return carouselView(index, context);
                }),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 15,vertical: 0),
            child: Text("Feeling Adventurous?", style: TextStyle(color: Colors.white,
                fontWeight: FontWeight.bold, fontSize: 20),),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.0,vertical: 8),
            child: Text("Get Inspiration from these trending categories",
                style: TextStyle(color: Colors.white70)),
          ),
          Container(margin: const EdgeInsets.symmetric(horizontal: 15,vertical: 15),height: MediaQuery.of(context).size.height,
            child:GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
                itemBuilder: (BuildContext context, int index) {
                  return Stack(fit: StackFit.passthrough,
                    children: [
                      Container(height: 100,
                          clipBehavior: Clip.hardEdge,
                        margin: const EdgeInsets.symmetric(horizontal: 5,vertical: 5),
                        decoration:const BoxDecoration(color:Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(7))),
                        child: Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRi4NMpwFwJEiGb6rlhcGRZ0TyTD6mZTnN7-QBLAOJ25lc4_rFX90a7nLEDAjkK66dlTVeMCSKYsSo&usqp=CAU&ec=48665701",fit: BoxFit.fill,)
                      ),
                      Container(height: 100,
                        width: MediaQuery.of(context).size.width/2-15,
                        clipBehavior: Clip.hardEdge,
                        margin: const EdgeInsets.symmetric(horizontal: 5,vertical: 5),
                        decoration:const BoxDecoration(color:Colors.black26,
                            borderRadius: BorderRadius.all(Radius.circular(7))),
                        child: const Center(
                          child: Text("Nature", style: TextStyle(color: Colors.white,
                              fontWeight: FontWeight.bold, fontSize: 20),),
                        ),
                      ),
                    ],
                  );}),),
        ],),
      extendBody: true,
      bottomNavigationBar: Theme(
        data: ThemeData(
            canvasColor: Colors.black54),
        child: BottomNavigationBar(
          fixedColor: Colors.pinkAccent,
          items: [
            BottomNavigationBarItem(
                label: "",
                icon: IconButton(
                  onPressed: () {  },
                  icon: const Icon(Icons.home),
                )),
            BottomNavigationBarItem(
                label: "",
                icon: IconButton(
                  onPressed: () {  },
                  icon: Padding(
                    padding: const EdgeInsets.only(bottom: 8.0,right: 8),
                    child: Transform.rotate(angle:95,child: const Icon(Icons.navigation)),
                  ),
                )),
            BottomNavigationBarItem(
                label: "",
                icon: IconButton(
                  onPressed: () {  },
                  icon: const Icon(Icons.search),
                )),
            BottomNavigationBarItem(
                label: "",
                icon: IconButton(
                  onPressed: () {  },
                  icon: const Icon(Icons.person),
                ))
          ],
        ),
      ),
    );
  }

  Widget carouselView(int index, BuildContext context) {
    return AnimatedBuilder(
        animation: _pageController, builder: (context, child) {
      double value = 0.0;
      if (_pageController.position.haveDimensions) {
        value = index.toDouble() - (_pageController.page ?? 0);
        value = (value * 0.02).clamp(-1,1);
      }
      return Transform.rotate(
          angle: pi * value,
          child: carouselCard(context)
      );
    });
  }

  Widget carouselCard(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>Info(animationController: _animationController)));
      },
      child: Stack(
        children: [
          Container(margin: const EdgeInsets.symmetric(horizontal: 10,vertical: 0),
            height: MediaQuery.of(context).size.height - 410,
            child: Card(
              clipBehavior: Clip.hardEdge,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              elevation: 10,
              child: Image.network("https://images7.alphacoders.com/112/1120507.jpg",
                fit: BoxFit.fill,),
            ),
          ),
          Container(margin: const EdgeInsets.symmetric(horizontal: 10,vertical: 0),
            height: MediaQuery.of(context).size.height - 410,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                gradient: const LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [Colors.black87, Colors.transparent])),
          ),
          const Positioned(bottom: 120, left: 20,
            child: Padding(
              padding: EdgeInsets.only(top: 20.0),
              child: Text("San Diego",
                style: TextStyle(
                    color: Colors.white60,
                    fontSize: 23,
                    fontWeight: FontWeight.bold),),
            ),
          ),
          const Positioned(bottom: 100, left: 20,
            child: Padding(
              padding: EdgeInsets.only(top: 20.0),
              child: Text("Los Angeles",
                style: TextStyle(
                    color: Colors.white60,
                    fontSize: 16),),
            ),
          ),
          Positioned(bottom: 100, right: 25,width: 100,
            child: ElevatedButton(
              style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.pinkAccent)),
              onPressed: () {  },
              child: const Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(Icons.rocket,size: 16,),
                  Text(" 2.8 BTC",
                    style: TextStyle(
                        color: Colors.white,fontSize: 13),),
                ],
              ),
            ),
          ),
        ],),
    );
  }
}