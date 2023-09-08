

import 'package:battlevids/profilenew.dart';
import 'package:battlevids/theme.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'color.dart';
import 'ott.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> with SingleTickerProviderStateMixin{
  String title = "Karthi";
  late SharedPreferences logindata;
  late AnimationController _animationctrl ;
  late ScrollController scrollController;
  double imageSize = 0;
  double initialSize = 270;
  double containerHeight = 570;
  double containerinitalHeight = 570;
  double imageOpacity = 1;
  bool showTopBar = false;
  bool impleading = false;
  @override
  void initState(){
    super.initState();
    initial();
    _animationctrl =AnimationController(
        vsync: this ,duration: const Duration(seconds: 1) );
    imageSize = initialSize;
    scrollController = ScrollController()
      ..addListener(() {
        imageSize = initialSize - scrollController.offset;
        if (imageSize < 0) {
          imageSize = 0;
        }
        containerHeight = containerinitalHeight - scrollController.offset;
        if (containerHeight < 0) {
          containerHeight = 0;
        }
        imageOpacity = imageSize / initialSize;
        if (scrollController.offset>480){
          impleading=true;
        }
        else {
          impleading=false;
        }
        setState(() {});
      });
  }
  void initial() async {
    logindata= await SharedPreferences.getInstance();
  }
  bool close= false;
  void icontapped(){
    if(close==false){
      _animationctrl.forward();
      close = true;
    }
    else {
      _animationctrl.reverse();
      close=false;
    }
  }

  void _showAlertDialog() {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Log out'),
          content: Text('Are you sure you want to Log out?'),
          actions: [
            TextButton(
              onPressed: () {
                logindata.setBool("login",false);
                Navigator.of(context).pop();
              },
              child: Text('No'),
            ),
            TextButton(
              onPressed: () {
                logindata.setBool("login",true);
                Navigator.push(context,
                  PageTransition(
                      childCurrent: Ottpro(),child: Ott1(),
                      type: PageTransitionType.fade,duration: Duration(milliseconds: 900)),
                );
              },
              child: Text('Yes'),
            ),
          ],
        );
      },
    );
  }

  var data = Get.arguments;


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: Drawer(
          backgroundColor: Theme.of(context).colorScheme.primaryContainer.withOpacity(.7),
          elevation: 16,
          child: ListView(
            children: [

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: RichText(
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
                ),
              ) ,
               SizedBox(height: 30,),


              GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: (){
                  Provider.of<ThemeNotifier>(context,listen: false).toggleTheme();
                },
                child: SizedBox(
                  height: 60,
                  child: Row(
                    children: [
                      Icon(Icons.light,size: 40,),
                      Padding(
                        padding: const EdgeInsets.only(left: 40.0),
                        child: Text("Theme ",style: TextStyle(fontSize: 20)),
                      ),
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(Icons.toggle_off,size: 40,),
                      )
                    ],
                  ),
                ),
              ),
              Divider(height: 20,color: Colors.grey,),
              SizedBox(
                height: 60,
                child: Row(
                  children: [
                    Icon(Icons.settings_applications,size: 40,),
                    Padding(
                      padding: const EdgeInsets.only(left: 40.0),
                      child: Text("Account Settings",style: TextStyle(fontSize: 20)),
                    ),
                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(Icons.arrow_circle_right_outlined,size: 40,),
                    )
                  ],
                ),
              ),
              Divider(height: 20,color: Colors.grey,),
              SizedBox(
                height: 60,
                child: Row(
                  children: [
                    Icon(Icons.settings_applications,size: 40,),
                    Padding(
                      padding: const EdgeInsets.only(left:40.0),
                      child: Text("Download Settings",style: TextStyle(fontSize: 20)),
                    ),
                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(Icons.arrow_circle_right_outlined,size: 40,),
                    )
                  ],
                ),
              ),
              Divider(height: 20,color: Colors.grey),
              SizedBox(
                height: 60,
                child: Row(
                  children: [
                    Icon(Icons.settings_accessibility,size: 40,),
                    Padding(
                      padding: const EdgeInsets.only(left: 40.0),
                      child: Text("Parental Controls",style: TextStyle(fontSize: 20)),
                    ),
                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(Icons.arrow_circle_right_outlined,size: 40,),
                    )
                  ],
                ),
              ),
              Divider(height: 20,color: Colors.grey,),
              GestureDetector(
                behavior: HitTestBehavior.translucent,
                onLongPress: _showAlertDialog,
                onTap: (){
                  Fluttertoast.showToast(msg: "Long press to Log out",
                      timeInSecForIosWeb: 2,
                      toastLength: Toast.LENGTH_LONG,
                      gravity: ToastGravity.BOTTOM,
                      backgroundColor: Colors.blue,
                      textColor: Colors.white);
                },
                child: SizedBox(
                  height: 60,
                  child: Row(
                    children: [
                      Icon(Icons.logout_outlined,size: 40,),
                      Padding(
                        padding: const EdgeInsets.only(left: 40.0),
                        child: Text("Logout",style: TextStyle(fontSize: 20)),
                      ),
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(Icons.arrow_circle_right_outlined,size: 40,),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        body: DefaultTabController(
          length: 2,
          child: NestedScrollView(
            controller: scrollController,
            headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
              return [
                SliverAppBar(
                  expandedHeight: 450,
                  flexibleSpace: Stack(
                      children: [
                        Container(
                          height: containerHeight,
                          width: MediaQuery.of(context).size.width,
                          alignment: Alignment.center,
                          color: Colors.pink,
                          child: Opacity(
                            opacity: imageOpacity.clamp(0, 1.0),
                            child: Container(
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(.5),
                                    offset: Offset(0, 20),
                                    blurRadius: 32,
                                    spreadRadius: 16,
                                  )
                                ],
                              ),
                              child: Image(
                                image: AssetImage("assets/profile.jpg"),
                                width: imageSize,
                                height: imageSize,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                         left: 170,top: 360,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Text("Karthi",style: TextStyle(
                                  fontSize: 30,color: whi
                                )),
                              ),
                              ElevatedButton(onPressed: (){
                                Navigator.push( context,
                                    MaterialPageRoute(builder:  (context) =>  Ottpro()));
                              },
                                  child: Text("Edit profile",style: ggnor15,),
                              style: ButtonStyle(
                                backgroundColor: MaterialStatePropertyAll(Colors.black),
                              ),),
                            ],
                          ),
                        ),
                      ]
                  ),

                ),
                SliverAppBar(
                  backgroundColor: Color(0xff702b47).withOpacity(0.8),
                  automaticallyImplyLeading: impleading,
                  primary: false,
                  pinned: true,
                  floating: true,
                  title: TabBar(
                    tabs: [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text("Watchlist"),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text("Purchases"),
                    ),
                  ],
                      indicator: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.white30,
                      ),
                  ),
                ),

              ];
            },
            body: TabBarView(
                children: [
                  SizedBox(
                    height: 180,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          itemCount: 2,
                          itemBuilder: (BuildContext ctx,index){
                            return ListTile(
                              leading: SizedBox(height: 100,width: 80,
                                  child: Image.asset("assets/sana.jpg",fit: BoxFit.cover,)),
                              title: Text("Episodes 1",style: ggnor,),
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
                  Center(
                    child: Text("Rent & buy your favorites",
                      style: supergg,),
                  ),
                ]
            ),
          ),
    )
      )
      );
  }
}