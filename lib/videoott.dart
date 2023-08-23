
import 'package:battlevids/ott.dart';
import 'package:battlevids/sample.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'color.dart';
class Video extends StatefulWidget {
  const Video({Key? key}) : super(key: key);

  @override
  State<Video> createState() => _VideoState();
}
class _VideoState extends State<Video> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: DefaultTabController(
          length: 2,
          child: NestedScrollView(
              headerSliverBuilder: (BuildContext context,bool innerBoxisScrolled){
                return[
                    SliverAppBar(
                      expandedHeight: 500,
                      pinned: true,
                      flexibleSpace: FlexibleSpaceBar(
                        collapseMode: CollapseMode.parallax,
                        centerTitle: true,
                        title: Text("John Wick 2",
                          style: TextStyle(
                            fontSize: 24,color: whi,
                          ),),
                        background: Container(
                          height: 200,
                          decoration: const BoxDecoration(
                            shape: BoxShape.rectangle,
                            image: DecorationImage(
                              image: AssetImage("assets/mv1.jpg"),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ),
                      leading: IconButton(
                        onPressed: (){
                          Navigator.pop(
                            context,
                            MaterialPageRoute(builder: (context) => Ott1()),
                          );
                        }, icon: const Icon(Icons.arrow_back),),
                      actions: const [
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Icon(Icons.more_vert_outlined),
                        ),
                      ],
                    ),
                    SliverAppBar(
                    automaticallyImplyLeading: false,
                    toolbarHeight: 50,
                    pinned: true,
                    primary: false,
                      floating: true,
                      title: TabBar(
                          indicator: BoxDecoration(
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(50),
                            color: Colors.white30,
                          ),
                          tabs: [
                            Container(height: 33,child: Center(child: Text("About",style: ggnor,))),
                            Container(height:33,child: Center(child: Text("Episodes",style: ggnor,))),
                            // Container(height: 33,child: Center(child: Text("TV Shows",style: ggnor,))),
                          ]

                      ),
                        backgroundColor: Color(0xff1b1a1c),
                )
                ];
              },
              body:TabBarView(children: [
                SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 60.0,bottom: 20,top: 20,right: 20),
                                child: SizedBox(
                                  height: 80,
                                  width: 80,
                                  child: Column(
                                    children: [
                                      Container(
                                          height: 50,
                                          width: 50,
                                          decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Color(0xff57699a),
                                          ),
                                          child: const Center(child: Icon(Icons.watch_later_outlined,color: Colors.white,size: 30,))),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 8.0),
                                        child: SizedBox(
                                          height: 20,
                                          width: 80,
                                          child: Center(
                                              child: Text("WatchList",
                                                style: ggnor,)),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: SizedBox(
                                  height: 80,
                                  width: 80,
                                  child: Column(
                                    children: [
                                      Container(
                                          height: 50,
                                          width: 50,
                                          decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Color(0xff57699a),
                                          ),
                                          child: const Center(child: Icon(Icons.star_rate,color: Colors.white,size: 30,))),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 8.0),
                                        child: SizedBox(
                                          height: 20,
                                          width: 80,
                                          child: Center(
                                              child: Text("Rate this",
                                                style: ggnor,)),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: SizedBox(
                                  height: 80,
                                  width: 80,
                                  child: Column(
                                    children: [
                                      Container(
                                          height: 50,
                                          width: 50,
                                          decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Color(0xff57699a),
                                          ),
                                          child: const Center(child: Icon(Icons.share,color: Colors.white,size: 30,))),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 8.0),
                                        child: SizedBox(
                                          height: 20,
                                          width: 80,
                                          child: Center(
                                              child: Text("Share",
                                                style: ggnor,)),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: SizedBox(
                          height: 50,
                          child: ElevatedButton(
                            onPressed: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const Battlevids()),
                            );
                          },
                            child: Center(child: Text("Resume Ep.1",style: ggbold,)),
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(Color(0xff57699a)),
                          ),
                          ),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text("Casts :",style: GoogleFonts.lato(color: whi,fontSize: 18),)),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                            height: 150,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                                itemCount: 8,
                                itemBuilder: (BuildContext ctx,index){
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: SizedBox(
                                    height: 150,
                                    child: Column(
                                      children: [
                                        Container(
                                            height: 100,
                                            width: 100,
                                            decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                            image: DecorationImage(image: AssetImage("assets/jy.jpg"),
                                          fit: BoxFit.fill,
                                          )
                                          ),
                                        ),
                                        const Padding(
                                          padding: EdgeInsets.only(top: 5.0),
                                          child: SizedBox(
                                            height: 20,
                                            width: 80,
                                            child: Center(
                                                child: Text("jeongyeon",
                                                  style: TextStyle(color: Colors.white,),)),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                            }
                            ),
                          ),
                      ),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Text("Trailers :",style: GoogleFonts.lato(color: whi,fontSize: 18),)),
                      SizedBox(
                        height: 500,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                              itemCount: 5,
                              itemBuilder: (BuildContext ctx,index){
                                return ListTile(
                                  title: Row(
                                    children: [
                                      SizedBox(height: 80,width: 120,
                                          child: Image.asset("assets/tv2.jpg",fit: BoxFit.cover,)),
                                      SizedBox(width: 20,),
                                      Text("Trailer 1",style: ggnor,),
                                    ],
                                  ),
                                  subtitle: Text("EN 100%",
                                    style: TextStyle(
                                      color:grey,
                                    ),),
                                  trailing: const Icon(Icons.more_vert_outlined),
                                );
                              }
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text("Episodes :",style: GoogleFonts.lato(color: whi,fontSize: 20),)),
                        ),
                        SizedBox(
                          height: 800,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                                scrollDirection: Axis.vertical,
                                itemCount: 8,
                                itemBuilder: (BuildContext ctx,index){
                                  return ListTile(
                                    title: Row(
                                      children: [
                                        SizedBox(height: 90,width: 120,
                                            child: Image.asset("assets/tv2.jpg",fit: BoxFit.cover,)),
                                        SizedBox(height: 20,),
                                        Text("Episodes 1",style: ggnor,),
                                      ],
                                    ),
                                    subtitle: Text("EN 100%",
                                      style: TextStyle(
                                        color:grey,
                                      ),),
                                    trailing: const Icon(Icons.more_vert_outlined),
                                  );
                                }
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ])
          ),
        ),
      ),
    );
  }
}
