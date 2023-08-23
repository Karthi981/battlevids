import 'package:battlevids/profile.dart';
import 'package:battlevids/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'bottom.dart';
import 'color.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          leading: IconButton(onPressed: (){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Sec()),
            );
          }, icon: const Icon(Icons.arrow_back_ios_new),),
          title: Text("Find",style: ggnor,),
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
                        image: AssetImage("assets/sana.jpg"),
                        fit: BoxFit.cover),
                  ),
                ),
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Profile()),
                  );
                },
              ),
            ),
          ],
        ),
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
          child: Column(
            children: [
              Text("Genres",style: ggbold),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Wrap(
                  spacing: 8.0,
                  children: [
                    _buildPopularSearchItem('Action'),
                    _buildPopularSearchItem('Comedy'),
                    _buildPopularSearchItem('Drama'),
                    _buildPopularSearchItem('Adventure'),
                    _buildPopularSearchItem('Romance'),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0,right: 8.0),
                      child: _buildPopularSearchItem('Sci-Fi'),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: _buildPopularSearchItem('Thriller'),
                    ),
                  ],
                ),
              ),
              // Padding(
              //   padding: const EdgeInsets.all(8.0),
              //   child: SizedBox(
              //     height: 200,
              //     child: GridView.builder(
              //         gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              //             maxCrossAxisExtent: 200,
              //             childAspectRatio: 7/ 2,
              //             crossAxisSpacing: 2,
              //             mainAxisSpacing: 2),
              //         itemCount: 6,
              //         itemBuilder: (BuildContext con,index)  {
              //           return Padding(
              //             padding: const EdgeInsets.all(8.0),
              //             child: Container(
              //               height: 20,
              //               width: 50,
              //               decoration: BoxDecoration(
              //                 shape: BoxShape.rectangle,
              //                 color: abc,
              //               ),
              //               child: Center(child: Text("Action and Adventure",
              //               style: ggnor,
              //               ),
              //               ),
              //             ),
              //           );
              //         }),
              //   ),
              // ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Search",
                    style: ggbold),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  height: 80,
                  child: Center(
                    child: TextFormField(
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.search),
                        hintText: 'Search',
                        suffixIcon: IconButton(onPressed: (){}, icon: const Icon(Icons.lens_blur_outlined),),
                        filled: true,
                        fillColor: whi,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Provider.of<ThemeNotifier>(context, listen: false).toggleTheme();
                },
                child: Text('Toggle Theme',style: ggnor15,),
              ),
            ],
          ),
        ),
      ),
    );
  }
  Widget _buildPopularSearchItem(String text) {
    return Chip(
      label: Text(
        text,
        style: TextStyle(
          color: Colors.deepOrange,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}


