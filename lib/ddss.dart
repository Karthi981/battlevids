import 'package:flutter/material.dart';


class simple extends StatefulWidget {
  const simple({Key? key}) : super(key: key);

  @override
  State<simple> createState() => _simpleState();
}

class _simpleState extends State<simple> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled){

        return[SliverAppBar(
          primary: true,
          expandedHeight: 200,
          flexibleSpace:FlexibleSpaceBar(
            title:SliverAppBar(
              expandedHeight: 100,
              primary: false,
              flexibleSpace: FlexibleSpaceBar(
                background: Image.asset("assets/jy.jpg"),
              ),
            ),
          )
        )];

      },
        body: ListView.builder(
        itemCount: 20,
        itemBuilder:(BuildContext con,index)
        {
          return ListTile(
            leading: Container(height: 50,width: 40,
                child: Image.asset("assets/jy.jpg",fit: BoxFit.fill,)),
            title: Text("Shut Down"),
            subtitle: Row(
              children: [
                Container(
                  height: 15,
                  width: 50,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: Colors.grey,
                  ),
                  child: Center(child: Text('LYRICS',
                    style: TextStyle(
                      fontSize: 11,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text("BLACKPINK"),
                ),
              ],
            ),
            trailing: Icon(Icons.more_vert_outlined),
          );
        } ,
      ),),
    );
  }
}
