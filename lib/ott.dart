

import 'package:battlevids/bottom.dart';
import 'package:battlevids/ott1.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shared_preferences/shared_preferences.dart';



class Ott1 extends StatefulWidget {
  const Ott1({Key? key}) : super(key: key);

  @override
  State<Ott1> createState() => _Ott1State();
}

class _Ott1State extends State<Ott1> {

  static final _formfield = GlobalKey<FormState>();
  final usercontroller = TextEditingController();
  final passcontroller = TextEditingController();

  late SharedPreferences logindata;
  late bool newUser;



 Widget sheetbuild() => Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.only(topLeft: Radius.circular(50),
          topRight: Radius.circular(50)),
      color: Color(0xff2d3969),
    ),
    child: Column(
      children: [
        SizedBox(
          height: 60,
        ),
    Padding(
      padding: const EdgeInsets.all(24.0),
      child: TextField(
        autofocus: true,
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white70,),
          ),
          labelText: 'Name',
          labelStyle: TextStyle(color: Colors.white70),
        ),
      ),
    ),
    Padding(
      padding: const EdgeInsets.all(24.0),
      child: TextField(
        autofocus: true,
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white70,),
          ),
          labelText: 'Email',
          labelStyle: TextStyle(color: Colors.white70),
        ),
      ),
    ),
    Padding(
      padding: const EdgeInsets.all(24.0),
      child: TextField(
        autofocus: true,
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white70,),
          ),
          labelText: 'Password',
          labelStyle: TextStyle(color: Colors.white70),
        ),
      ),
    ),
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(onPressed: (){}, child: Text("Save")),
    ),
        Padding(padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom )
        ),
    ],
      ),
      );
@override
 void initState(){
  super.initState();
  check_if_login();
}


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: (){
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: WillPopScope(
          onWillPop: () async => false,
          child: Scaffold(
            resizeToAvoidBottomInset:false,
            backgroundColor: Colors.white,
            body: ListView(
              reverse: true,
              children: [
                Column(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: <Color>[
                            Color(0xff183ada),
                            Color(0xff193096),
                            Color(0xff161e54),
                            Color(0xff111333),
                            Color(0xff111b3a),
                            Color(0xff0d153d),
                            Color(0xff0b1549),
                            Color(0xff041148),
                          ],
                          // Gradient from https://learnui.design/tools/gradient-generator.html
                          tileMode: TileMode.mirror,
                        ),
                      ),
                      child: Form(
                        key: _formfield,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 450.0),
                              child: Container(
                                height: 100,
                                width: 100,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                    image: AssetImage("assets/profile.jpg"),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 35.0, right: 35, bottom: 20, top: 20),
                              child: TextFormField(
                                style: TextStyle(color: Colors.white),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Enter Username';
                                  }
                                  final uservalid = RegExp(r"^[a-zA-Z0-9_]+@[a-z]+[.]+[a-z]").hasMatch(value);
                                  if (!uservalid) {
                                    return "Enter Valid Username";
                                  }
                                  return null;
                                },
                                decoration: const InputDecoration(
                                  errorStyle: TextStyle(fontSize: 16),
                                  prefixIcon: Icon(Icons.person, color: Colors.white70),
                                  focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white70)),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                  ),
                                  labelText: "Enter Username",
                                  labelStyle: TextStyle(color: Colors.white60),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 35.0, right: 35, bottom: 20, top: 20),
                              child: TextFormField(
                                style: TextStyle(color: Colors.white),

                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Enter Password';
                                  }
                              final uservalid = RegExp(
                                  r"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{8,}$").hasMatch(value);
                                  if (!uservalid) {
                                    return "Enter Valid Password";
                                  }
                                  return null;
                                },
                                decoration: const InputDecoration(
                                  errorStyle: TextStyle(fontSize: 16),
                                  focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white70)),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.white,),
                                  ),
                                  prefixIcon: Icon(Icons.password, color: Colors.white70,),
                                  labelText: "Enter password",
                                  labelStyle: TextStyle(color: Colors.white60),
                                ),
                              ),
                            ),
                            Row(
                              children: [
                                SizedBox(width: 160,),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: SizedBox(
                                    height: 40,
                                    width: 80,
                                    child: ElevatedButton(onPressed: () {
                                      if (_formfield.currentState!.validate()) {
                                        passcontroller.clear();
                                        ScaffoldMessenger.of(context).showSnackBar(
                                             SnackBar(content: Text("ok valid")));
                                        logindata.setBool("login", false);
                                        logindata.setString("username",usercontroller.text);
                                            //   Navigator.push(
                                            // context,
                                            // MaterialPageRoute(
                                            //     builder: (context) =>  Sec()) );
                                        Get.to(Sec(),arguments: [usercontroller.text]);
                                      }
                                    },
                                      style: ButtonStyle(
                                        foregroundColor: MaterialStateProperty.all<Color>(
                                            Colors.black),
                                        backgroundColor: MaterialStateProperty.all<Color>(
                                            const Color(
                                                0xFF6E6ED7)),
                                        shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(10),
                                          ),
                                        ),
                                      ),
                                      child: const Text("Login", style: TextStyle(
                                          color: Colors.white70),),
                                    ),
                                  ),
                                ),
                                TextButton(
                                    child: Text(
                                      "Sign Up?",
                                      style: TextStyle(
                                        color: Colors.red,
                                      ),
                                    ),
                                    onPressed: () =>
                                        showModalBottomSheet(
                                          isScrollControlled: true,
                                          backgroundColor: Colors.transparent,
                                          useSafeArea: true,
                                          context: context,
                                          builder: (context) => sheetbuild(),
                                        )
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),

                    ),
                    Padding(
                      padding:EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                    ),
                  ],
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
  void check_if_login() async {
  logindata = await SharedPreferences.getInstance();
  newUser = logindata.getBool("login")?? true ;
  if (newUser == false){

    Get.to(Sec());
  }
  }
  void dispose(){
  usercontroller.dispose();
  passcontroller.dispose();
  super.dispose();
  }
}
