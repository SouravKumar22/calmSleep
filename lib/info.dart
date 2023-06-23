import 'package:demo/bottomSheet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Info extends StatelessWidget{
  final AnimationController animationController;
  Info({super.key, required this.animationController});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black54,
      body: SlideTransition(
        position: Tween<Offset>(begin: const Offset(-1, 0),
        end: Offset.zero).animate(animationController),
        child: Stack(
          children: [
          SizedBox(
              height:MediaQuery.of(context).size.height,
              child: Image.network("https://gretastravels.com/wp-content/uploads/2022/08/DSC_0126.jpg",fit: BoxFit.fill,)),
            Container(color:Colors.black54,alignment: Alignment.topCenter,
              height:MediaQuery.of(context).size.height,
              padding: const EdgeInsets.only(top: 30, bottom: 15.0, left: 15, right: 15),
              child: SingleChildScrollView(
                child: Column(crossAxisAlignment: CrossAxisAlignment.start,mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(onPressed: (){
                          Navigator.pop(context);
                        }, icon: const Icon(Icons.arrow_back_ios,color: Colors.white,)),
                        const Text("NEW OSOGBO", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),),
                        IconButton(onPressed: (){}, icon: const Icon(Icons.more_vert,color: Colors.white,)),
                      ],),
                    SizedBox(height: MediaQuery.of(context).size.height/2-200,),
                    const Center(child:Text("Santorini", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),),),
                    Center(
                      child: Container(alignment: Alignment.center,
                        decoration:const BoxDecoration(
                          color: Colors.white24,
                          borderRadius: BorderRadius.all(Radius.circular(7))),
                        padding: EdgeInsets.all(10), margin: EdgeInsets.all(15),
                        width: MediaQuery.of(context).size.width/2-30,
                        child: Row(mainAxisAlignment: MainAxisAlignment.center,crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(Icons.wb_sunny,color: Colors.yellow.shade200,),
                            const Text(" Weather Now \n 32 °C - Light Rain", style: TextStyle(fontSize: 13,color: Colors.white70)),
                          ],
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 25,vertical: 20.0),
                      child: Center(
                        child:Text("Santorini is one of the Cyclades islands in the Aegean Sea. It was devastated by a volcanic eruption in the 16th century BC, forever shaping its rugged landscape",
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white,fontSize: 16,),),),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(25.0),
                      child: Center(
                        child: Row(mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(onPressed: (){}, icon: const Icon(Icons.videogame_asset_rounded,color: Colors.pink,)),
                            const Text("VR TOUR ", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),),
                            const Text(" | ", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),),
                            IconButton(onPressed: (){}, icon: const Icon(Icons.video_collection,color: Colors.pink,)),
                            const Text(" GALLERY", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),),

                          ],),
                      ),
                    ),
                    Center(
                      child: Container(alignment: Alignment.center,width: MediaQuery.of(context).size.width/2,
                        child: ElevatedButton(
                          style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.pinkAccent)),
                          onPressed: () {
                            showModalBottomSheet(backgroundColor: Colors.transparent,isScrollControlled: true,
                                context: context,
                                builder: (BuildContext context) {
                              return BottomSheetContent();});
                          },
                          child: const Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Icon(Icons.rocket,size: 16,),
                              Text(" SCHEDULE TRIP",
                                style: TextStyle(
                                    color: Colors.white,fontSize: 15),),
                            ],
                          ),
                        ),
                      ),
                    ),

                  ],
                ),
              ),
            ),
          ]
        ),),
    );
  }
}

Widget bottomDetailsSheet() {
  return DraggableScrollableSheet(
    initialChildSize: .2,
    minChildSize: .1,
    maxChildSize: .6,
    builder: (BuildContext context, ScrollController scrollController) {
      return Container(
        color: Colors.lightGreen[100],
        child: ListView(
          controller: scrollController,
          children: const [
            ListTile(
              title: Text(
                "NAME",
              ),
              subtitle: Text("",
              ),
            ),
            ListTile(
              title: Text(
                "FAMILY",
              ),
              subtitle: Text("",
              ),
            ),
            ListTile(
              title: Text(
                "LIFESPAN",
              ),
              subtitle: Text("",
              ),
            ),
            ListTile(
              title: Text(
                "WEIGHT",
              ),
              subtitle: Text("",
              ),
            ),
          ],
        ),
      );
    },
  );
}
