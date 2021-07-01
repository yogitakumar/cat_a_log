import 'package:catlog/Model/CatModel.dart';
import 'package:catlog/Screens/AddCat.dart';
import 'package:catlog/Widgets/MainDrawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Text _buildRatingStars(int rating) {
    String stars = '';
    for (int i = 0; i < rating; i++) {
      stars += '⭐';
    }
    stars.trim();
    return Text(stars);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF2471A3),
        title: Text(widget.title),
        centerTitle: true,
        actions: [Icon(Icons.more_vert)],
      ),
      drawer: Drawer(
        child: MainDrawer(),
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Container(
            //color: Colors.green,
            height: 900,
            width: 400,
            child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: shopFor.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Column(
                        children: [
                          Container(
                            height: 270,
                            width: 340,
                            child: Column(
                              children: [
                                Image.asset(
                                  shopFor[index].image,
                                  fit: BoxFit.cover,
                                ),
                                Container(
                                    height: 35,
                                    //color: Colors.grey,
                                    child: Center(
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                Icon(
                                                  CupertinoIcons
                                                      .smallcircle_circle,
                                                  color: Colors.blue,
                                                ),
                                                SizedBox(
                                                  width: 4,
                                                ),
                                                Text(
                                                  shopFor[index].name,
                                                  style:
                                                  TextStyle(fontSize: 16),
                                                ),
                                              ],
                                            ),
                                            _buildRatingStars(
                                                shopFor[index].rating)
                                          ],
                                        ),
                                      ),
                                    )),
                                SizedBox(
                                  //width:1,
                                  child: Divider(
                                    thickness: 1,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
          ),
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            height: 40,
            width: 40,
            child: FloatingActionButton(
              backgroundColor: Colors.white70,
              onPressed: () {},
              child: Icon(CupertinoIcons.clear, color: Colors.grey[700]),
            ),
          ),
          SizedBox(
            height: 7,
          ),
          Container(
            height: 40,
            width: 40,
            child: FloatingActionButton(
              backgroundColor: Colors.white70,
              onPressed: () {},
              child: Icon(CupertinoIcons.ant, color: Colors.grey[700]),
            ),
          ),
          SizedBox(
            height: 7,
          ),
          Container(
            height: 40,
            width: 40,
            child: FloatingActionButton(
              backgroundColor: Colors.white70,
              onPressed: () {},
              child: Icon(Icons.favorite, color: Colors.grey[700]),
            ),
          ),
          SizedBox(
            height: 7,
          ),
          Container(
            height: 40,
            width: 40,
            child: FloatingActionButton(
              backgroundColor: Colors.white70,
              onPressed: () {},
              //tooltip: 'Increment',
              child: Icon(Icons.edit, color: Colors.grey[700]),
            ),
          ),
          SizedBox(
            height: 7,
          ),
          FloatingActionButton(
            backgroundColor: Color(0xFFff3300), //.red,
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => AddCat()));
            },
            child: Icon(Icons.list),
          ),
        ],
      ),
    );
  }
}