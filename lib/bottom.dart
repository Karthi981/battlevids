import 'dart:collection';
import 'package:battlevids/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'search.dart';
import 'ott1.dart';


class Sec extends StatefulWidget {
  const Sec({Key? key}) : super(key: key);
  @override
  State<Sec> createState() => _SecState();
}
class _SecState extends State<Sec> {
    int _index = 0 ;
    final ListQueue<int> _navigationQueue = ListQueue();
    final pages = [
       Ott2(),
      Search(),
      Profile(),
    ];
    void tap(index){
      if(index != _index){
        _navigationQueue.removeWhere((element) => element == index);
        _navigationQueue.addLast(index);
        setState(() {
          _index = index;
        });
      }
  }
    void closeAppUsingSystemPop() {
      SystemChannels.platform.invokeMethod('SystemNavigator.pop');
    }
    Future<bool> _willpop() async {
      if (_index==0)
      {
        return (await showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Are you sure?'),
          content: Text('Do you want to exit an App'),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.of(context).pop(false), //<-- SEE HERE
              child: Text('No'),
            ),
            TextButton(
              // onPressed: ()  => Navigator.of(context).pop(true),
              onPressed: () {
                closeAppUsingSystemPop();
              },
              child: Text('Yes'),
            ),
          ],
        ),
      )) ;
      }
        setState(() {
          _navigationQueue.removeLast();
          int position = _navigationQueue.isEmpty ? 0 : _navigationQueue.last;
          _index = position;
          });
      return false;
    }


    @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: WillPopScope(
        onWillPop: _willpop,
        child: Scaffold(
          body: pages[_index],
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Colors.black,
              fixedColor: Colors.red,
              unselectedItemColor: Colors.white,
              items:  [
                BottomNavigationBarItem(icon: Icon(Icons.home),label: "Home"),
                BottomNavigationBarItem(icon: Icon(Icons.search),label: "Search"),
                BottomNavigationBarItem(icon: Icon(Icons.person_2_outlined),label: "My Space"),
              ],
            currentIndex: _index,
            onTap: tap,
          ),
        ),
      ),
    );
  }
}

