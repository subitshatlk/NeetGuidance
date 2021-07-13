import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class AddCenters extends StatefulWidget {
  const AddCenters({Key key, this.name, this.fees, this.time, this.number, this.link}) : super(key: key);

  @override
  AddCentersState createState() => AddCentersState();
  final name;
  final fees;
  final time;
  final number;
  final link;
}

class AddCentersState extends State<AddCenters> {
  TextEditingController _nameController,_feesController,_timeController,_numberController, _linkController;
  DatabaseReference _ref;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _feesController=TextEditingController();
    _timeController=TextEditingController();
    _numberController=TextEditingController();
   _linkController=TextEditingController();


  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('Coaching center', style: TextStyle(fontSize: 20 ,color: Colors.white)),

      ),
      body: Container(
        margin: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 70,),
            TextFormField(
              controller: _nameController,
              decoration:
              InputDecoration(
                hintText: 'Enter name of the coaching center',
                prefixIcon:Icon(Icons.corporate_fare,size: 30,),
                fillColor: Colors.white,
                filled: true,
                contentPadding: EdgeInsets.all(15),
              ),
            ),
            SizedBox(height: 25),
            TextFormField(
              controller: _feesController,
              decoration:
              InputDecoration(
                hintText: 'Enter approx fees',
                prefixIcon:Icon( Icons.attach_money,size: 30,),
                fillColor: Colors.white,
                filled: true,
                contentPadding: EdgeInsets.all(15),
              ),
            ),
            SizedBox(height: 25,),
            TextFormField(
              controller: _timeController,
              decoration:
              InputDecoration(
                hintText: 'Enter the deadline to register',
                prefixIcon:Icon(Icons.calendar_today_outlined,size: 30,),
                fillColor: Colors.white,
                filled: true,
                contentPadding: EdgeInsets.all(15),
              ),
            ),
            SizedBox(height: 25,),
            TextFormField(
              controller: _numberController,
              decoration:
              InputDecoration(
                hintText: 'Enter phone number to contact',
                prefixIcon:Icon(Icons.call,size: 30,),
                fillColor: Colors.white,
                filled: true,
                contentPadding: EdgeInsets.all(15),
              ),
            ),
            SizedBox(height: 25,),
            TextFormField(
              controller: _linkController,
              decoration:
              InputDecoration(
                hintText: 'Enter link to register',
                prefixIcon:Icon(Icons.link,size: 30,),
                fillColor: Colors.white,
                filled: true,
                contentPadding: EdgeInsets.all(15),
              ),
            ),
            SizedBox(height: 50,),
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 10),
              // ignore: deprecated_member_use
              child: ButtonTheme(
                height: 50,
                child: RaisedButton(
                  child: Text('Post it !',
                      style: TextStyle(fontSize: 20 ,color: Colors.white)
                  ),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
                  onPressed: (){
                    saveData();
                    Navigator.pushNamedAndRemoveUntil(context, 'AdminHome', (route) => false);
                  },
                  color: Theme.of(context).primaryColor,

                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  void saveData(){
    String name = _nameController.text;
    String fees = _feesController.text;
    String time = _timeController.text;
    String number = _numberController.text;
    String link = _linkController.text;

    Map<String,String> data = {
      'name':name,
      'fees' :fees,
      'time' : time,
      'number' : number,
      'link'   : link,
    };

    FirebaseFirestore.instance.runTransaction((Transaction transaction) async {
      CollectionReference reference = FirebaseFirestore.instance.collection('CoachingCenter');

      await reference.add({"Name": "$name","Fees": "$fees","Time": "$time","Number": "$number", "Link": "$link"});
    });
  }
}