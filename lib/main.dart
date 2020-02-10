import 'package:flutter/material.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';
import 'package:ui_practice/styleguide.dart';
import 'package:ui_practice/utils.dart';
import 'package:ui_practice/widgets/moods.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Health Profile",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage([Key key]) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  void onTapped(int value) {
    setState(() {
      _selectedIndex = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainBgColor,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            _buildTopStack(),
            SizedBox(height: 50.0),
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  _buildNotificationCard(),
                  _buildNextAppointmentTitle(),
                  _buildNextAppointmentInfo(),
                ],
              ),
            ),
          ]
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
          showSelectedLabels: false,
          showUnselectedLabels: false,
          currentIndex: _selectedIndex,
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                LineAwesomeIcons.home,
                size: 30.0,
              ),
              title: Text("1"),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                LineAwesomeIcons.search,
                size: 30.0,
              ),
              title: Text("1"),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                LineAwesomeIcons.gratipay,
                size: 30.0,
              ),
              title: Text("1"),
            ),
          ],
          onTap: onTapped,
        ),
    );
  }

  Stack _buildTopStack() {
    return Stack(
            alignment: AlignmentDirectional.topCenter,
            overflow: Overflow.visible,
            children: <Widget>[
              _buildBackgroundCover(),
              _buildGreetings(),
              _buildMoodHolder(),
            ],
          );
  }

  _buildBackgroundCover() {
    return Container(
      height: 260.0,
      decoration: BoxDecoration(
        gradient: purpleGradient,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(40),
          bottomRight: Radius.circular(40),
        )
      ),
    );
  }

  _buildGreetings() {
    return Positioned(
      left: 20.0,
      bottom: 90.0,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("Hi Mike",
          style: greetingTitleStyle,
          ),
          SizedBox(
            height: 10,
          ),
          Text("How are you feeling today ?",
          style: greetingSubtitleStyle,),
        ],
      ),
    );
  }

  _buildMoodHolder() {
    return Positioned(
      bottom: -45,
      child: Container(
        height: 100,
        width: MediaQuery.of(context).size.width - 40,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(25)),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              spreadRadius: 5.5,
              blurRadius: 5.5,
            )
          ]
        ),
        child: MyMoods(),
      ),
    );
  }

  _buildNotificationCard() {
    return Container(
      padding: EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: lightColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        leading: Icon(
          LineAwesomeIcons.calendar_check_o,
          color: Colors.white,
          size: 32,
        ),
        title: Text("Your visit with \n Dr. james",
        style: notificationTitleStyle,
        ),
        trailing: OutlineButton(
          onPressed: () {},
          color: Colors.transparent,
          borderSide: BorderSide(
            color: Colors.white,
            width: 1.0
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(26),
          ),
          child: Text(
            "Review & Add Notes",
            style: notificationButtonStyle,
          ),
        ),
      ),
    );
  }

  _buildNextAppointmentTitle() {
    return Container(
      margin: EdgeInsets.only(top: 20.0, bottom: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            'Your Next Appointment',
            style: nextAppointmentTitleStyle,
          ),
          Text(
            'See All',
            style: nextAppointmentSubtitleStyle,
          )
        ],
      ),
    );
  }

  _buildNextAppointmentInfo(){
    return Container(
      padding: EdgeInsets.symmetric(vertical: 14.0, horizontal: 18.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              CircleAvatar(
                backgroundColor: Colors.grey,
                backgroundImage: NetworkImage(USER_IMAGE),
                radius: 36,
              ),
              RichText(
                text: TextSpan(
                  text: ' Dr Ismail',
                  style: appointmentMainStyle,
                  children: [
                    TextSpan(
                      text: '\n Sunday, June 5th at 6:00pm',
                      style: appointmentDateStyle,
                    ),
                    TextSpan(
                      text: '\n Aruna Ogun Special Hospital\n Ikorodu Lagos',
                      style: appointmentVenueStyle,
                    ),
                  ]
                )
              ),
            ],
          ),
          
        ],
      ),
    );
  }
}