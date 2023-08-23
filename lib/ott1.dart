
import 'package:battlevids/morePage.dart';
import 'package:battlevids/profile.dart';
import 'package:battlevids/videoott.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:page_transition/page_transition.dart';
import 'color.dart';
import 'model.dart';



class Ott2 extends StatefulWidget {
  const Ott2({Key? key}) : super(key: key);

  @override
  State<Ott2> createState() => _Ott2State();
}

class _Ott2State extends State<Ott2> {

  int currentindex=0;
  ScrollController _scrollViewController = ScrollController();
  bool _showAppbar = true;
  bool isScrollingDown = false;

  @override
  void initState() {
    super.initState();
    _scrollViewController = ScrollController();
    _scrollViewController.addListener(() {
      if (_scrollViewController.position.userScrollDirection == ScrollDirection.reverse) {
        if (!isScrollingDown) {
          setState(() {
            isScrollingDown = true;
            _showAppbar = true;
          });
        }
      }
      else if (_scrollViewController.position.userScrollDirection == ScrollDirection.forward) {
        if (isScrollingDown) {
          setState(() {
            isScrollingDown = false;
            _showAppbar = true;
          });
        }
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
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
          child: DefaultTabController(
            length: 3,
            child: NestedScrollView(
                headerSliverBuilder: (BuildContext ctx , bool innerBoxisScrolled){
                  return[
                    SliverAppBar(
                      stretch: true,
                      automaticallyImplyLeading: false,
                      expandedHeight: _showAppbar ? 80.0 : 0.0,
                      title: RichText(
                        text: const TextSpan(
                            text: "B",style: TextStyle(
                            color: Colors.blue,
                            fontSize: 34,
                            fontWeight: FontWeight.bold),
                            children: [
                              TextSpan(text: "attleVids",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 24,
                                  ))
                            ]
                        ),
                      ) ,
                      actions: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: IconButton(onPressed: (){}, icon: const Icon(Icons.cast_outlined),),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: GestureDetector(
                            child: Container(
                              height: 30,
                              width: 30,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    image: AssetImage("assets/profile.jpg"),
                                    fit: BoxFit.cover),
                              ),
                            ),
                            onTap: (){
                              Navigator.push(
                                context,
                               PageTransition(child: Profile(),
                                   type: PageTransitionType.leftToRightPop,
                                   childCurrent: Ott2(),
                                   duration: Duration(milliseconds: 600),
                               )
                              );
                            },
                          ),
                        ),
                      ],
                      bottom:  TabBar(
                        indicator: BoxDecoration(
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.white30,
                        ),
                          tabs: [
                        Container(height: 40,child: Center(child: Text("All",style: ggnor,))),
                        Container(height:40,child: Center(child: Text("Movies",style: ggnor,))),
                        Container(height: 40,child: Center(child: Text("TV Shows",style: ggnor,))),
                      ]
                      ),
                    ),
                  ];
                },
                body: TabBarView(children: [
                   SingleChildScrollView(
                     controller: _scrollViewController,
                     child: Column(
                      children: [
                        Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: CarouselSlider.builder(
                          options: CarouselOptions(
                            onPageChanged: (index, reason){
                              setState(() {
                                currentindex=index;
                              });
                            },
                          height: 450,
                          aspectRatio: 16/9,
                          viewportFraction: 1,
                          initialPage: 0,
                          enableInfiniteScroll: true,
                          reverse: false,
                          autoPlay: true,
                          autoPlayInterval: const Duration(seconds: 3),
                          autoPlayAnimationDuration: const Duration(milliseconds: 800),
                          autoPlayCurve: Curves.fastOutSlowIn,
                          // onPageChanged: callbackFunction,
                          scrollDirection: Axis.horizontal,
                          ),
                          itemCount: lis.length,
                        itemBuilder: (BuildContext context, index, int pageViewIndex)
                        {
                          return Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              image: DecorationImage(
                                fit: BoxFit.fill,
                                image: AssetImage(lis[index].image),
                              )
                            ),
                            );
                        }
                        ),
                      ),
                        Padding(
                          padding: EdgeInsets.all(4.0),
                          child: DotsIndicator(
                            dotsCount: lis.length,
                            position: currentindex,
                            decorator: DotsDecorator(
                              activeColor: Colors.purple,
                              activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
                            )
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
                                    child: GestureDetector(
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
                                      onTap: (){
                                        Navigator.push(
                                          context,
                                         PageTransition(child: Video(),
                                             type: PageTransitionType.topToBottomPop,
                                             childCurrent: Ott2(),duration: Duration(milliseconds: 900) )
                                        );
                                      },
                                    ),
                                  );
                                }
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 16.0),
                              child: SizedBox(
                                height: 30,
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text("Movies",
                                    style: TextStyle(color: whi,fontSize: 20),
                                    ),
                                ),
                                ),
                              ),
                            Spacer(),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextButton(onPressed: (){
                                Navigator.push(context, MaterialPageRoute(
                                    builder: (context) => More())
                                );
                              } ,child: Text("More >>",style: ggnor15,)),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SizedBox(
                              height: 450,
                              child: GridView.builder(
                                scrollDirection: Axis.horizontal,
                                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                                      maxCrossAxisExtent: 250,
                                      childAspectRatio:  2.8/2,
                                      crossAxisSpacing: 0,
                                      mainAxisSpacing: 16,
                                  ),
                                  itemCount: lis.length,
                                  itemBuilder: (BuildContext con,index)  {
                                    return Container(
                                      height: 200,
                                      child: Column(
                                        children: [
                                          Container(
                                            height: 180,
                                            width: 190,
                                            decoration: BoxDecoration
                                              (
                                              shape: BoxShape.rectangle,
                                              borderRadius: BorderRadius.circular(10),
                                              image: DecorationImage(
                                                image: AssetImage(lis[index].image),
                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(top: 8.0),
                                            child: Container(
                                              height: 30,
                                              width: 160,
                                              decoration: const BoxDecoration
                                                (
                                                shape: BoxShape.rectangle,
                                              ),
                                              child: Center(child:
                                              Text(lis[index].text,
                                                style: TextStyle(color: whi,fontSize: 14),
                                              )),
                                            ),
                                          )
                                        ],
                                      ),
                                    );
                                  }),
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only( bottom: 8.0,left: 16),
                              child: SizedBox(
                                height: 20,
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text("Tv Shows",
                                    style:TextStyle(color: whi,fontSize: 18),
                                    ),
                                ),
                                ),
                              ),
                            Spacer(),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child:TextButton(onPressed: (){
                                Navigator.push(context, MaterialPageRoute(
                                    builder: (context) => More())
                                );
                              } ,child: Text("More >>",style: ggnor15,), ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            height: 180,
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: 7,
                                itemBuilder: (BuildContext con,index)
                                {
                                  return Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(
                                          height: 120,
                                          width: 190,
                                          decoration: BoxDecoration
                                            (
                                            shape: BoxShape.rectangle,
                                            borderRadius: BorderRadius.circular(10),
                                            image: const DecorationImage(
                                              image: AssetImage("assets/sana.jpg"),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 30,
                                        width: 190,
                                        child: Center(child: Text("Friends",
                                        style: ggnor15,
                                        )),
                                      )
                                    ],
                                  );
                                }
                            ),
                          ),
                        ),
                      ],
                  ),
                   ),
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top:8,left: 16),
                          child: SizedBox(
                            height: 30,
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text("Emmy awards",
                                style:TextStyle(color: whi,fontSize: 18),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: SizedBox(
                            height: 180,
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: lis.length,
                                itemBuilder: (BuildContext con,index)
                                {
                                  return Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(6.0),
                                        child: Container(
                                          height: 120,
                                          width: 190,
                                          decoration: BoxDecoration
                                            (
                                            shape: BoxShape.rectangle,
                                            borderRadius: BorderRadius.circular(10),
                                            image: DecorationImage(
                                              image: AssetImage(lis[index].image),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 30,
                                        width: 190,
                                        child: Center(child: Text("Friends",
                                          style: ggnor15,
                                        )),
                                      )
                                    ],
                                  );
                                }
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only( left: 16),
                          child: SizedBox(
                            height: 30,
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text("BattleVids Originals ",
                                style:TextStyle(color: whi,fontSize: 18),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: SizedBox(
                            height: 180,
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: 7,
                                itemBuilder: (BuildContext con,index)
                                {
                                  return Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(6.0),
                                        child: Container(
                                          height: 120,
                                          width: 190,
                                          decoration: BoxDecoration
                                            (
                                            shape: BoxShape.rectangle,
                                            borderRadius: BorderRadius.circular(10),
                                            image: const DecorationImage(
                                              image: AssetImage("assets/sana.jpg"),
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 30,
                                        width: 190,
                                        child: Center(child: Text("Friends",
                                          style: ggnor15,
                                        )),
                                      )
                                    ],
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
                                          image: AssetImage("assets/mv5.jpg"),
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
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top:8,left: 16),
                          child: SizedBox(
                            height: 30,
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text("Emmy awards",
                                style:TextStyle(color: whi,fontSize: 18),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: SizedBox(
                            height: 180,
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: lis.length,
                                itemBuilder: (BuildContext con,index)
                                {
                                  return Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(6.0),
                                        child: Container(
                                          height: 120,
                                          width: 190,
                                          decoration: BoxDecoration
                                            (
                                            shape: BoxShape.rectangle,
                                            borderRadius: BorderRadius.circular(10),
                                            image: DecorationImage(
                                              image: AssetImage(lis[index].image),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 30,
                                        width: 190,
                                        child: Center(child: Text("Friends",
                                          style: ggnor15,
                                        )),
                                      )
                                    ],
                                  );
                                }
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only( left: 16),
                          child: SizedBox(
                            height: 30,
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text("BattleVids Originals ",
                                style:TextStyle(color: whi,fontSize: 18),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: SizedBox(
                            height: 180,
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: 7,
                                itemBuilder: (BuildContext con,index)
                                {
                                  return Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(6.0),
                                        child: Container(
                                          height: 120,
                                          width: 190,
                                          decoration: BoxDecoration
                                            (
                                            shape: BoxShape.rectangle,
                                            borderRadius: BorderRadius.circular(10),
                                            image: const DecorationImage(
                                              image: AssetImage("assets/sana.jpg"),
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 30,
                                        width: 190,
                                        child: Center(child: Text("Friends",
                                          style: ggnor15,
                                        )),
                                      )
                                    ],
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
                                          image: AssetImage("assets/mv5.jpg"),
                                          fit: BoxFit.fill,
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

                ]
                ),
          ),
      ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _scrollViewController.dispose();
    _scrollViewController.removeListener(() {});
    super.dispose();
  }
}

