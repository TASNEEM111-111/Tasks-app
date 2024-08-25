import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        leading: Icon(Icons.menu),
        title: Text(
          'FIRST APP',
        ),
        centerTitle: true,
        actions: [
          IconButton(
              icon: Icon(Icons.notification_important),
              onPressed: () {
                print("clicked");
              }),
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              print("wolkomeno");
            },
          )
        ],
        elevation: 50,
      ),
      /* body:Container(
        color: Colors.blueGrey,
        width: double.infinity,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              color: Colors.blue,
              child: Text(' first text ',
              style: TextStyle(
                color: Colors.white ,
                fontSize: 50.0,
              ),
              ),
            ),
            Expanded(
              child: Container(
                color: Colors.deepPurple,
                child: Text(' scound text ',
                  style: TextStyle(
                    color: Colors.white ,
                    fontSize: 50.0,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                color:Colors.blueGrey,
                child: Text(' third text ',
                  style: TextStyle(
                    color: Colors.white ,
                    fontSize: 50.0,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                color: Colors.teal,
                child: Text(' fourth text ',
                  style: TextStyle(
                    color: Colors.white ,
                    fontSize: 50.0,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),*/
      /*  body: Container(
        color: Colors.amber,
        height: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              color: Colors.teal,
              child: Text('first text',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
              ),
              ),
            ),
          /*  Container(
              color: Colors.blueGrey,
              child: Text('second text',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),),
            ),
            Container(
              color: Colors.blueAccent,
              child: Text('third text',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),),
            ),
            Container(
              color: Colors.cyan,
              child: Text('fourth text',
                style: TextStyle(
                  color: Colors.white,
                 fontSize: 20.0,
                ),
                ),

            ),*/
          ],
        ),
      ),*/
      /*body:SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:
          [
            Text('first',
            style: TextStyle(
              fontSize: 30.0,
            ),),
            Text('second',
            style: TextStyle(
              fontSize: 30.0,
            ),),
            Text('third',
            style: TextStyle(
              fontSize: 30.0,
            ),),
            Text('fourth',
            style: TextStyle(
              fontSize: 30.0,
            ),),
            Text('first',
              style: TextStyle(
                fontSize: 30.0,
              ),),
            Text('second',
              style: TextStyle(
                fontSize: 30.0,
              ),),
            Text('third',
              style: TextStyle(
                fontSize: 30.0,
              ),),
            Text('fourth',
              style: TextStyle(
                fontSize: 30.0,
              ),),
            Text('first',
              style: TextStyle(
                fontSize: 30.0,
              ),),
            Text('second',
              style: TextStyle(
                fontSize: 30.0,
              ),),
            Text('third',
              style: TextStyle(
                fontSize: 30.0,
              ),),
            Text('fourth',
              style: TextStyle(
                fontSize: 30.0,
              ),),
            Text('first',
              style: TextStyle(
                fontSize: 30.0,
              ),),
            Text('second',
              style: TextStyle(
                fontSize: 30.0,
              ),),
            Text('third',
              style: TextStyle(
                fontSize: 30.0,
              ),),
            Text('fourth',
              style: TextStyle(
                fontSize: 30.0,
              ),),
            Text('first',
              style: TextStyle(
                fontSize: 30.0,
              ),),
            Text('second',
              style: TextStyle(
                fontSize: 30.0,
              ),),
            Text('third',
              style: TextStyle(
                fontSize: 30.0,
              ),),
            Text('fourth',
              style: TextStyle(
                fontSize: 30.0,
              ),),


          ],
        ),
      ),*/
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(50),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadiusDirectional.only(
                  topStart: Radius.circular(20.0),
                ),
              ),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Image(
                    image: NetworkImage(
                        'https://img.freepik.com/premium-photo/astronaut-outer-open-space-planet-earth-stars-provide-background-erforming-space-planet-earth-sunrise-sunset-our-home-iss-elements-this-image-furnished-by-nasa_150455-16829.jpg?w=2000'),
                    height: 200,
                    width: 200,
                    fit: BoxFit.cover,
                  ),
                  Container(
                    alignment: Alignment.center,
                    width: 200,
                    color: Colors.black.withOpacity(.3),
                    padding: EdgeInsets.symmetric(
                      vertical: 10.0,
                    ),
                    child: Text(
                      'Supernova',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
