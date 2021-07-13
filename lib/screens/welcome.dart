import 'dart:ui';
import 'package:flutter/material.dart';

class Welcome extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.only(
                    top: 100.0, left: 30.0, right: 30.0, bottom: 30.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Text(
                        'NEET GUIDANCE APP',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 29.0,
                          fontWeight: FontWeight.bold,
                          shadows:  [
                            Shadow(
                              blurRadius: 2.0,
                              color: Colors.grey,
                              offset: Offset(0.0, 2.0),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 24.0,),
                    Text(
                      'Stay connected for complete neet guidance !',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18.0,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    SizedBox(height: 30,),
                    Image.asset("images/medical.jpg",height: 300,),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: FlatButton(
                minWidth: 250.0,
                height: 50.0,
                child: Text('Admin'),
                color: Colors.blueAccent,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
                textColor: Colors.white,
                onPressed: () {
                  Navigator.pushNamed(context,'AdminLogin');
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: FlatButton(
                minWidth: 250.0,
                height: 50.0,

                onPressed: (){
                  Navigator.pushNamed(context,'signupview');
                },
                child: Text(
                  'Student',
                  style: TextStyle(
                    color: Colors.blueAccent,
                  ),
                ),
                color: Colors.white,
                shape: RoundedRectangleBorder(
                    side: BorderSide(
                        color: Colors.lightBlueAccent,
                        width: 1,
                        style: BorderStyle.solid),
                    borderRadius: BorderRadius.circular(30.0)),
              ),
            ),
            SizedBox(
              height: 30,
            )
          ]),
    );
  }
}
