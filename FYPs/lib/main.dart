import 'package:FYPs/doc_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BookMyDoc',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Avenir'),
      home: MyHomePage(),
      routes: {
        '/categoryPage': (context) => DocScreen(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BookMyDoc'),
        backgroundColor: Color(0xffe1bee7),
      ),
      backgroundColor: Color(0xfff8f8f8),
      body: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height * 0.43,
                width: MediaQuery.of(context).size.width,
                color: Color(0xff80deea),
                child: Container(
                  margin: EdgeInsets.only(right: 40, top: 20, bottom: 20),
                  alignment: Alignment.centerLeft,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/peda.jpg'),
                          fit: BoxFit.contain)),
                ),
              )
            ],
          ),
          Column(
            children: <Widget>[
              SizedBox(
                height: 200,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.9,
                padding: EdgeInsets.symmetric(vertical: 3, horizontal: 20),
                decoration: BoxDecoration(
                    color: Colors.teal[50],
                    borderRadius: BorderRadius.all(Radius.circular(40))),
                child: Row(
                  children: <Widget>[
                    Icon(
                      Icons.search,
                      size: 30,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Search',
                          hintStyle: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  childAspectRatio: 0.8,
                  children: <Widget>[
                    categoryWidget('dentist', "Dentist"),
                    categoryWidget('gyno', "Gynocologist"),
                    categoryWidget('cardio', "Cardiologist"),
                    categoryWidget('derma', "Dermatologist"),
                    categoryWidget('physio', "Physiotherapist"),
                    categoryWidget('ophtha', "Ophthalmologist"),
                    categoryWidget('neuro', "Neurologist"),
                    categoryWidget('radio', "Radiologist"),
                    categoryWidget('anest', "Anesthesiologists"),
                    categoryWidget('ent', "ENT"),
                    categoryWidget('pedia', "Pediatrician"),
                    categoryWidget('rheum', "Rheumatologist"),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 15),
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        FaIcon(FontAwesomeIcons.calendar),
                        Text('My Appointment')
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        FaIcon(
                          FontAwesomeIcons.home,
                          color: Colors.pink[200],
                        ),
                        Text(
                          'Home',
                          style: TextStyle(
                            color: Colors.pink[200],
                            fontWeight: FontWeight.w700,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        FaIcon(FontAwesomeIcons.star),
                        Text('Favorite'),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  Container categoryWidget(String img, String title) {
    return Container(
      margin: EdgeInsets.only(
        left: 10,
        right: 10,
        top: 30,
      ),
      width: MediaQuery.of(context).size.width * 0.3,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(30)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 20,
              spreadRadius: 1,
              offset: Offset(0, 10),
            )
          ]),
      child: InkWell(
        onTap: () => openDentistPage(context),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/$img.png'),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              padding: EdgeInsets.all(20),
              child: Text(
                '$title',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 10,
            )
          ],
        ),
      ),
    );
  }

  void openDentistPage(BuildContext ctx) {
    Navigator.of(ctx).push(
      MaterialPageRoute(
        builder: (_) {
          return DocScreen();
        },
      ),
    );
  }
}


