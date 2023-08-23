import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'color.dart';
import 'model.dart';


class More extends StatefulWidget {
  const More({Key? key}) : super(key: key);

  @override
  State<More> createState() => _MoreState();
}

class _MoreState extends State<More> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
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
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only( top: 8,bottom: 8.0,left: 16),
                child: SizedBox(
                  height: 20,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text("Battle Vids originals",
                      style:TextStyle(color: whi,fontSize: 18),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: 700,
                    child: GridView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        gridDelegate:  SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: 150,
                          childAspectRatio:  1.3/2,
                          crossAxisSpacing: 5,
                          mainAxisSpacing: 16,
                        ),
                        itemCount: lis.length,
                        itemBuilder: (BuildContext con,index)  {
                          return Container(
                            height: 200,
                            child: Column(
                              children: [
                                Container(
                                  height: 170,
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
            ],
          ),
        ),
      ),
    );
  }
}
