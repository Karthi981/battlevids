
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker_gallery_camera/image_picker_gallery_camera.dart';
import 'package:page_transition/page_transition.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'color.dart';


class Ottpro extends StatefulWidget {
  const Ottpro({Key? key}) : super(key: key);

  @override
  State<Ottpro> createState() => _OttproState();
}


class _OttproState extends State<Ottpro> {
  var _image;

  Future getImage(ImgSource source) async {
    var image = await ImagePickerGC.pickImage(
        enableCloseButton: true,
        closeIcon: Icon(
          Icons.close,
          color: Colors.red,
          size: 12,
        ),
        context: context,
        source: source,
        barrierDismissible: true,
        cameraIcon: Icon(
          Icons.camera_alt,
          color: Colors.red,
        ), //cameraIcon and galleryIcon can change. If no icon provided default icon will be present
        cameraText: Text(
          "From Camera",
          style: TextStyle(color: Colors.red),
        ),
        galleryText: Text(
          "From Gallery",
          style: TextStyle(color: Colors.blue),
        ));
    setState(() {
      _image = image;
    });
  }

  void help(){
    showDialog(context: context,
        builder: (BuildContext context){

      return AlertDialog(
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        title: Text("Help",style: ggbold),
        content: Text("Payment and Subscription Models: Implement secure and seamless payment\n"
            " gateways to allow users to subscribe to your service and access premium content.\n"
            " Consider offering various subscription options, such as monthly, yearly, or pay-per-view.",
        style: ggnor,),
          actions: <Widget>[
      TextButton(
      style: TextButton.styleFrom(
          textStyle: Theme.of(context).textTheme.labelLarge,
          ),
          child: Text('Ok',style: ggnor),
          onPressed: () {Navigator.of(context).pop();
        },
          )
      ]
      );
        },
      barrierDismissible: false,
        );
  }

  @override
  Widget build(BuildContext context) {
    final pitem=TextEditingController();
    final rpitem=TextEditingController();
    final skey=GlobalKey<FormState>();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          flexibleSpace:Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  Theme.of(context).colorScheme.primary,
                  Theme.of(context).colorScheme.secondary,
                  Theme.of(context).colorScheme.tertiary,
                ])
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: GestureDetector(
                  onTap: help,
                  child: Text.rich(
                    TextSpan(
                        children: [
                          WidgetSpan(child: Icon(Icons.help,size: 20,color: whi,)),
                          TextSpan(text:'Help',style: TextStyle(fontSize: 15,color: whi)),
                        ]
                    ),
                  ),
                ),
              ),
            )],
        ),

        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(child: Text("Profile",style: TextStyle(fontSize: 28,fontWeight: FontWeight.w700),)),
              ),
              Stack(
                  children:[ InkWell(
                    child: Center(
                      child: ClipOval(
                       child:SizedBox.fromSize(size: Size.fromRadius(100),
                        child: _image!=null ?  Image.file(File(_image.path),fit: BoxFit.cover,) : Image(image: AssetImage("assets/profile.jpg"),fit:BoxFit.cover,),
                      ),
                    ),
                  ),
                  ),
                    Positioned(left: 300,top: 120,
                        child: Container(
                            height: 40,width: 40,decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: whi.withOpacity(.7)

                        ),
                            child: Center(
                              child: IconButton(
                                  onPressed: () => getImage(ImgSource.Both),
                                  icon: Icon(Icons.add_a_photo)),
                            )))
                  ],
              ),
              Divider(),
              SizedBox(height: 30,),
              Center(
                child: Container(width: 350,height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Theme.of(context).colorScheme.primaryContainer,
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(0,5),
                          color:org.withOpacity(.2),
                          spreadRadius: 2,
                          blurRadius: 10,
                        )
                      ]
                  ),
                  child: Center(
                    child: ListTile(
                      onTap: toast,
                      leading: Icon(Icons.person),
                      title:  Text("karthi_98"),
                      subtitle: Text(""),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Center(
                child: Container(width: 350,height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Theme.of(context).colorScheme.primaryContainer,
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(0,5),
                          color:org.withOpacity(.2),
                          spreadRadius: 2,
                          blurRadius: 10,
                        )
                      ]
                  ),
                  child: Center(
                    child: ListTile(
                      onTap: toast,
                      leading: Icon(Icons.mail),
                      title: const Text("Email-id"),
                      subtitle: Text(""),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Center(
                child: Container(width: 350,height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Theme.of(context).colorScheme.primaryContainer,
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(0,5),
                          color:org.withOpacity(.2),
                          spreadRadius: 2,
                          blurRadius: 10,
                        )
                      ]
                  ),
                  child: Center(
                    child: ListTile(
                      onTap: toast,
                      leading: Icon(Icons.phone_iphone_rounded),
                      title: const Text("Mobile.no"),
                      subtitle: Text(""),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Center(
                child: Container(width: 350,height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Theme.of(context).colorScheme.primaryContainer,
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(0,5),
                          color:org.withOpacity(.2),
                          spreadRadius: 2,
                          blurRadius: 10,
                        )
                      ]
                  ),
                  child: Center(
                    child: ListTile(
                      onTap: toast,
                      leading: Icon(Icons.password),
                      title: const Text("Password"),
                      subtitle: Text(""),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Center(
                child: TextButton(onPressed:(){
                  showModalBottomSheet(context: context,
                      isScrollControlled: true,
                      useSafeArea: true,
                      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50),
                      ),
                      builder: (BuildContext context){
                        return FractionallySizedBox(
                          heightFactor: 0.9,
                          child: Form(
                            key: skey,
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Container(
                                    height: 80,
                                    width: 350,
                                    child: Center(
                                      child: TextFormField(
                                          decoration: InputDecoration(
                                            border: OutlineInputBorder(),
                                              errorStyle: TextStyle(fontSize: 15),
                                              hintText: "Name",
                                              hintStyle: TextStyle(fontWeight: FontWeight.bold),
                                          ),
                                          keyboardType: TextInputType.text,
                                          validator: (value) {
                                            String? regx = r'^[a-z A-Z]';
                                            RegExp rgx = new RegExp(regx);

                                            if (value == null || value.isEmpty) {
                                              return 'Please enter some text';
                                            } else if (!rgx.hasMatch(value)) {
                                              return 'use only alphabets';
                                            } else
                                              return null;
                                          }
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Container(
                                    height: 80,
                                    width: 350,
                                    child: Center(
                                      child: TextFormField(
                                          decoration: InputDecoration(
                                            border: OutlineInputBorder(),
                                              errorStyle: TextStyle(fontSize: 15),
                                              hintText: "Mail-id",
                                              hintStyle: TextStyle(fontWeight: FontWeight.bold)
                                          ),
                                          keyboardType: TextInputType.emailAddress,
                                          validator: (value) {
                                            String? regx = r'\S+@\S+\.\S+';
                                            RegExp rgx = new RegExp(regx);

                                            if (value == null || value.isEmpty) {
                                              return 'Please enter  mail-id';
                                            } else if (!rgx.hasMatch(value)) {
                                              return 'Enter valid one';
                                            } else
                                              return null;
                                          }
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Container(
                                    height: 80,
                                    width: 350,
                                    child: Center(
                                      child: TextFormField(
                                          decoration: InputDecoration(
                                            border: OutlineInputBorder(),
                                              errorStyle: TextStyle(fontSize: 15),
                                              hintText: "Mobile-Number",
                                              hintStyle: TextStyle(fontWeight: FontWeight.bold)
                                          ),
                                          keyboardType: TextInputType.number,
                                          validator: (value) {
                                            String? regx =  r'^(?:[+0]9)?[0-9]{10}$';
                                            RegExp rgx = new RegExp(regx);
                                            if (value == null || value.isEmpty) {
                                              return 'Please enter some text';
                                            } else if (!rgx.hasMatch(value)) {
                                              return 'Number Incorrect';
                                            } else
                                              return null;
                                          }
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Container(
                                    height: 80,
                                    width: 350,
                                    child: Center(
                                      child: TextFormField(
                                          controller: pitem,
                                          decoration: InputDecoration(
                                            border: OutlineInputBorder(),
                                              errorStyle: TextStyle(fontSize: 15),
                                              hintText: "Password",
                                              hintStyle: TextStyle(fontWeight: FontWeight.bold)
                                          ),
                                          keyboardType: TextInputType.text,
                                          validator: (value) {
                                            String? regx = r'^[a-z A-Z]';
                                            RegExp rgx = new RegExp(regx);
                                            if (value == null || value.isEmpty) {
                                              return 'Please enter some text';
                                            } else if (!rgx.hasMatch(value)) {
                                              return 'Enter valid one';
                                            } else
                                              return null;
                                          }
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Container(
                                    height: 80,
                                    width: 350,
                                    child: Center(
                                      child: TextFormField(
                                          controller: rpitem,
                                          decoration: InputDecoration(
                                            border: OutlineInputBorder(),
                                              errorStyle: TextStyle(fontSize: 15),
                                              hintText: "Re-Enter Password",
                                              hintStyle: TextStyle(fontWeight: FontWeight.bold)
                                          ),
                                          keyboardType: TextInputType.text,
                                          validator: (value) {

                                            if (value == null || value.isEmpty) {
                                              return 'Please enter some text';
                                            } else if (pitem.text!=rpitem.text) {
                                              return 'Enter valid one';
                                            } else
                                              return null;
                                          }
                                      ),
                                    ),
                                  ),
                                ),
                                ElevatedButton(onPressed: (){
                                  if(skey.currentState!.validate())
                                  {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(content: Text('Created',style: TextStyle(color: Colors.white,fontSize: 20),)),
                                    );

                                    Navigator.push(
                                        context,PageTransition(child: Ottpro(), type: PageTransitionType.fade,duration: Duration(seconds: 1))
                                    );
                                  }
                                }, child: Text("Update"),)
                              ],
                            ),
                          ),
                        );
                      });
                },
                  child: Text("EDIT",
                      style: TextStyle(fontSize: 16,color: Colors.white70)
                  ),
                  style: TextButton.styleFrom(
                      backgroundColor: Colors.black,
                      disabledBackgroundColor: Colors.green),
                ),
              ),
            ],
          ),
        ),

      ),
    );

  }

  void toast(){
    Fluttertoast.showToast(msg: "Press Edit button to edit",
        timeInSecForIosWeb: 1,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.blue,
        textColor: Colors.white);
  }
}