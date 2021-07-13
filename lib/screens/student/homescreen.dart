import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

FirebaseUser loggedInUser;
class HomeScreen extends StatefulWidget {

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<HomeScreen> {
  FirebaseAuth _auth = FirebaseAuth.instance;
  String userMail = " ";
  FlutterLocalNotificationsPlugin fltrNotification;
  String task;
  String _selectedParam;
  int timerval;
  bool _visible= false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getuser_details();
    var androidInitialize = new AndroidInitializationSettings('app_icon');
    var iOSinitialize = new IOSInitializationSettings();
    var initializationSettings = new InitializationSettings(androidInitialize, iOSinitialize);
    fltrNotification=new FlutterLocalNotificationsPlugin();
    fltrNotification.initialize(initializationSettings, onSelectNotification: notificationSelected);
  }
  Future _showNotification() async
  {
    var androidDetails = new AndroidNotificationDetails("Channel ID","Neet Guidance","Neet Guidance mobile application",importance: Importance.Max);
    var iOSDetails = new IOSNotificationDetails();
    var generalNotificationDetails = new NotificationDetails(androidDetails, iOSDetails);
    var scheduledTime;
    if(_selectedParam == "Hour"){
      scheduledTime= DateTime.now().add(Duration(hours : timerval));
    }else if(_selectedParam == " Minute"){
      scheduledTime= DateTime.now().add(Duration(minutes : timerval));
    }else{
      scheduledTime= DateTime.now().add(Duration(seconds : timerval));
    }

    fltrNotification.schedule(1, "Remainder !!", task, scheduledTime, generalNotificationDetails);

  }
  void getuser_details() async{
    final user = await _auth.currentUser;
    if (user != null) {
      loggedInUser = user as FirebaseUser;
      userMail=loggedInUser.email;
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),

        title: Text(
          'DashBoard',
          style: TextStyle(
            color: Colors.black,
            fontFamily: 'Architects',
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: StreamBuilder(
        // ignore: deprecated_member_use
        stream: Firestore.instance.collection("CoachingCenter").snapshots(),
        builder: (context, snapshot){
          if(snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data.documents.length,
              itemBuilder: (context, index) {
                DocumentSnapshot data = snapshot.data.documents[index];
                return Card(
                  child: ExpansionTile(
                    title: Text(
                      data['Name'],
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.w700),
                    ),
                    children: <Widget>[
                      InkWell(
                          child: Text('Register :' + data['Link'],
                            style: TextStyle(
                                fontSize: 17.0, fontWeight: FontWeight.w700),
                          ),

                          onTap: () async {
                            if (await canLaunch(data['Link'])) {
                              await launch(data['Link']);
                            }
                          }
                      ),

                      ListTile(
                        title: Text('Register Deadline : ' +
                            data['Time'],
                          style: TextStyle(fontWeight: FontWeight.w400),
                        ),
                      ), ListTile(
                        title: Text('Fees : ' +
                            data['Fees'],
                          style: TextStyle(fontWeight: FontWeight.w400),
                        ),
                      ),

                      ListTile(
                        title: Text('Contact : ' +
                            data['Number'],
                          style: TextStyle(fontWeight: FontWeight.w400),
                        ),
                        subtitle: Column(
                          children: <Widget>[
                            SizedBox(height: 25.0,),
                            //Text("Set Alarm ?"),
                            // ignore: deprecated_member_use
                            RaisedButton(
                              onPressed: () {
                                setState(() {
                                  _visible = !_visible;
                                });
                              },
                              color: Colors.deepOrangeAccent,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              child: Text("Set Alarm !",),
                            ),
                            SizedBox(height: 10.0,),
                            Visibility(
                              visible: _visible,
                              child: Padding(padding: const EdgeInsets.all(1.0),
                                child: TextField(
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    hintText: "Enter the remainder task",),
                                  onChanged: (_val) {
                                    task = _val;
                                  },
                                ),
                              ),
                            ),
                            Visibility(
                              visible: _visible,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment
                                    .spaceAround,
                                children: <Widget>[
                                  DropdownButton(
                                    value: _selectedParam,
                                    items: [
                                      DropdownMenuItem(
                                        child: Text("Seconds"),
                                        value: "Seconds",
                                      ),
                                      DropdownMenuItem(
                                        child: Text("Minutes"),
                                        value: "Minutes",
                                      ),
                                      DropdownMenuItem(
                                        child: Text("Hours"),
                                        value: "Hours",
                                      ),
                                    ],
                                    hint: Text(
                                      "Select Time",
                                      style: TextStyle(
                                        color: Colors.black,
                                      ),
                                    ),
                                    onChanged: (_val) {
                                      setState(() {
                                        _selectedParam = _val;
                                      });
                                    },
                                  ),
                                  DropdownButton<int>(
                                    value: timerval,
                                    items: [
                                      DropdownMenuItem<int>(
                                        child: Text("1"),
                                        value: 1,
                                      ),
                                      DropdownMenuItem<int>(
                                        child: Text("2"),
                                        value: 2,
                                      ),
                                      DropdownMenuItem<int>(
                                        child: Text("3"),
                                        value: 3,
                                      ),
                                      DropdownMenuItem<int>(
                                        child: Text("4"),
                                        value: 4,
                                      ),
                                      DropdownMenuItem<int>(
                                        child: Text("5"),
                                        value: 5,
                                      ),
                                    ],
                                    hint: Text(
                                      "Select duration",
                                      style: TextStyle(
                                        color: Colors.black,
                                      ),
                                    ),
                                    onChanged: (_val) {
                                      setState(() {
                                        timerval = _val;
                                      });
                                    },
                                    elevation: 10,

                                  ),
                                ],
                              ),
                            ),
                            // ignore: deprecated_member_use
                            Visibility(
                              visible: _visible,
                              child: RaisedButton(
                                onPressed: _showNotification,
                                color: Colors.cyan,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                child: Text("Notify Me !"),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          }else{
            return Center(child: Text('Loading ...'));
          }
        },
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blueGrey,
              ),
              child:
              Center(
                child: Text('Hello '+ userMail,style: TextStyle(
                  fontSize:20.0,
                ),),
              ),
            ),
            SizedBox(height: 10,),
            ListTile(
                leading: Icon(Icons.psychology_outlined),
                title: Text('Quiz',style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                ),
                ),

                onTap: () {
                  Navigator.pushNamed(context, 'splash');
                }
            ),
            SizedBox(height: 10,),
            ListTile(
                leading: Icon(Icons.info_outline),
                title: Text('Neet Info',style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                ),
                ),

                onTap: () {
                  Navigator.pushNamed(context, 'NeetInfo');
                }
            ),
            SizedBox(height: 10,),
            ListTile(
                leading: Icon(Icons.question_answer_sharp),
                title: Text('Chatbot',style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                ),
                ),

                onTap: () {
                  Navigator.pushNamed(context, 'Chatbot');
                }
            ),
            SizedBox(height: 10,),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Log Out',style: TextStyle(
                color: Colors.black,
                fontSize: 20.0,
                fontFamily: 'Architects',

              ),),
              onTap: () {
                _auth.signOut();
                Navigator.pushNamedAndRemoveUntil(context, 'Welcome', (route) => false);
              },
            ),

          ],
        ),
      ),
    );
  }
  Future notificationSelected (String payload) async {
    showDialog(context: context,
      builder : (context) => AlertDialog(
        content : Text(" To Do : $task"),
      ),
    );
  }
}
