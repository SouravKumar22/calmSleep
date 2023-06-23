import 'dart:math';

import 'package:flutter/material.dart';


class BottomSheetContent extends StatefulWidget {
  @override
  _BottomSheetContentState createState() => _BottomSheetContentState();
}

class _BottomSheetContentState extends State<BottomSheetContent> {
  bool _isExpanded = false;

  DateTime? selectedDate;

  @override
  Widget build(BuildContext context) {
    return Container(height: MediaQuery.of(context).size.height*0.75,
      decoration: const BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25.0),
              topRight: Radius.circular(25.0))),
      child: SingleChildScrollView(reverse: true,
        child: Column(
          children: [
            Theme(
              data: Theme.of(context).copyWith(
                colorScheme: ColorScheme.dark(
                  primary: Colors.pink, // header background color
                  onPrimary: Colors.white, // header text color
                  onSurface: Colors.white, // body text color
                ),
                dialogBackgroundColor: Colors.black,
                textButtonTheme: TextButtonThemeData(
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.pink, // button text color
                  ),
                ),
              ),
              child: DatePickerDialog(
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2100),
              ),
            ),
            ElevatedButton(
            style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.pinkAccent)),
            onPressed: () {
              showModalBottomSheet(backgroundColor: Colors.transparent,isScrollControlled: true,
                context: context,
                builder: (BuildContext context) {
                  return BottomSheetContent2();
                },
              );
            },
            child:  Container(width: MediaQuery.of(context).size.width,alignment: Alignment.center,height: 70,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(10),topRight: Radius.circular(10))
              ),
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(" SEATS",
                    style: TextStyle(
                        color: Colors.white,fontSize: 18),),
                  Icon(Icons.arrow_upward)
                ],
              ),
            ),
          ),
        ],),
      ),);
  }
}



class BottomSheetContent2 extends StatefulWidget {
  @override
  _BottomSheetContentState2 createState() => _BottomSheetContentState2();
}

class _BottomSheetContentState2 extends State<BottomSheetContent2> {
  late PageController _pageController;
  int _currentPage = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
  @override
  void initState() {
    _pageController =
        PageController(initialPage: _currentPage, viewportFraction: 0.8);
    super.initState();
  }

  DateTime? selectedDate;


  @override
  Widget build(BuildContext context) {
    return Container(height: MediaQuery.of(context).size.height*0.75,
      decoration: const BoxDecoration(
          color: Colors.pink,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25.0),
              topRight: Radius.circular(25.0))),
      child: SingleChildScrollView(reverse: true,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 22.0,right: 22,left: 22),
              child: Text("How Many Adults?", style: TextStyle(color: Colors.white,
                  fontWeight: FontWeight.bold, fontSize: 25),),
            ),

            Container(height: 130,width: MediaQuery.of(context).size.width,
              child: AspectRatio(
                aspectRatio: 0.85,
                child: PageView.builder(clipBehavior: Clip.antiAlias,
                    itemCount: 30,
                    physics: const ClampingScrollPhysics(),
                    controller: _pageController,
                    itemBuilder: (cntxt, index) {
                      return carouselCard( context,index);
                    }),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 22.0,right: 22,left: 22),
              child: Text("How Many Children?", style: TextStyle(color: Colors.white,
                  fontWeight: FontWeight.bold, fontSize: 25),),
            ),

            Container(height: 130,width: MediaQuery.of(context).size.width,
              child: AspectRatio(
                aspectRatio: 0.85,
                child: PageView.builder(clipBehavior: Clip.antiAlias,
                    itemCount: 30,
                    physics: const ClampingScrollPhysics(),
                    controller: _pageController,
                    itemBuilder: (cntxt, index) {
                      return carouselCard( context,index);
                    }),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(22),
              child: Text("Total: 2.4 BTC", style: TextStyle(color: Colors.white,
                  fontWeight: FontWeight.bold, fontSize: 25),),
            ),
            ElevatedButton(
              style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.black)),
              onPressed: () {
                showModalBottomSheet(backgroundColor: Colors.transparent,
                  context: context,
                  builder: (BuildContext context) {
                    return BottomSheetContent3();
                  },
                );
              },
              child:  Container(width: MediaQuery.of(context).size.width,alignment: Alignment.center,height: 70,
               color: Colors.black,
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(" Pay",
                      style: TextStyle(
                          color: Colors.white,fontSize: 18),),
                    Icon(Icons.arrow_upward)
                  ],
                ),
              ),
            ),
          ],),
      ),);
  }

  Widget carouselCard(BuildContext context,int index) {
    return Center(
      child: Container(margin: const EdgeInsets.symmetric(horizontal: 10,vertical: 0),height: 50,
        child: Text("$index",style: TextStyle(fontSize: 50,fontWeight: FontWeight.bold,color: Colors.white),),
      ),
    );
  }
}


class BottomSheetContent3 extends StatefulWidget {
  @override
  _BottomSheetContentState3 createState() => _BottomSheetContentState3();
}

class _BottomSheetContentState3 extends State<BottomSheetContent3> {



  @override
  Widget build(BuildContext context) {
    return Container(height: MediaQuery.of(context).size.height-100,
      decoration: const BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25.0),
              topRight: Radius.circular(25.0))),
      child: Column(mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(22.0),
            child: Text("Total", style: TextStyle(color: Colors.white,
                fontWeight: FontWeight.bold, fontSize: 25),),
          ),
          Padding(
            padding: const EdgeInsets.all(22.0),
            child: Text("2.4 BTC", style: TextStyle(color: Colors.white,
                fontWeight: FontWeight.bold, fontSize: 25),),
          ),
          Icon(Icons.tag_faces,size: 100,color: Colors.pink,)

        ],),);


  }
}
