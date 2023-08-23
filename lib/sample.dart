
import 'package:battlevids/videoott.dart';
import 'package:battlevids/videoplayer.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:readmore/readmore.dart';
import 'color.dart';
import 'model.dart';
import 'ott1.dart';

class Battlevids extends StatefulWidget {
  const Battlevids({Key? key}) : super(key: key);

  @override
  State<Battlevids> createState() => _BattlevidsState();
}

class _BattlevidsState extends State<Battlevids> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            gradient: LinearGradient(colors: [
              Theme.of(context).colorScheme.primary,
              Theme.of(context).colorScheme.secondary,
              Theme.of(context).colorScheme.tertiary,
            ],
                tileMode: TileMode.mirror,
                begin: AlignmentDirectional.topEnd,
                end: AlignmentDirectional.bottomCenter)
        ),
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: true,
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Sampleplayer(),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text("John Wick Chapter 2",style: supergg,)),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text("Description:",style: ggbold,)),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16.0,bottom: 8.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: ReadMoreText("Renowned assassin John Wick sets out for Rome to duel with some of the deadliest killers to fulfil a vow he made.\n"
                        "However, he soon learns that there is a huge bounty on his head.\n"
                        "Release date: 17 February 2017 (India)\nDirector: Chad Stahelski\nBudget: 4 crores USD\nBox office: 17.43 crores USD",
                      style: gggrey,
                    moreStyle: TextStyle(color: Colors.blue),
                    lessStyle: TextStyle(color: Colors.blue),
                    trimLines: 3,
                    trimLength: 80,
                    trimCollapsedText: "Show more",
                      trimExpandedText: "Show less",
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: SizedBox(
                    height: 30,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text("Contine Watching",
                        style:TextStyle(color: whi,fontSize: 20),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: 130,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 3,
                        itemBuilder: (BuildContext con,index)
                        {
                          return Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: Container(
                              width: 190,
                              decoration: BoxDecoration
                                (
                                shape: BoxShape.rectangle,
                                image: const DecorationImage(
                                  image: AssetImage("assets/mv1.jpg"),
                                  fit: BoxFit.cover,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          );
                        }
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: SizedBox(
                    height: 30,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text("You might like this",
                        style:TextStyle(color: whi,fontSize: 20),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: 130,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 5,
                        itemBuilder: (BuildContext con,index)
                        {
                          return Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: Container(
                              width: 190,
                              decoration: BoxDecoration
                                (
                                shape: BoxShape.rectangle,
                                image: const DecorationImage(
                                  image: AssetImage("assets/sana.jpg"),
                                  fit: BoxFit.cover,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          );
                        }
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: SizedBox(
                    height: 30,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text("Similar Videos",
                        style:TextStyle(color: whi,fontSize: 20),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: 130,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 3,
                        itemBuilder: (BuildContext con,index)
                        {
                          return Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: Container(
                              width: 190,
                              decoration: BoxDecoration
                                (
                                shape: BoxShape.rectangle,
                                image: const DecorationImage(
                                  image: AssetImage("assets/mv4.jpg"),
                                  fit: BoxFit.cover,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          );
                        }
                    ),
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
