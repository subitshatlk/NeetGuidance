import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NeetInfo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text(
          'Neet Information',
          style: TextStyle(
            color: Colors.black,
            fontFamily: 'Architects',
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      backgroundColor: Colors.white,

      body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.only(
                    top: 30.0, left: 20.0, right: 20.0, bottom: 30.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'NEET (UG) is one of the toughest medical entrance examinations conducted in India. National Eligibility cum Entrance Test is conducted by the National Testing Agency (NTA) '
                          'for admission to undergraduate (MBBS/BDS/Ayush Courses) every year. As per Government of India, it is a mandated requirement to qualify NEET Exam to study medical'
                          ' courses in India and abroad. NTA NEET2021 Exam will be conducted on 1st week of May 2021. Before Start NEET 2021 Preparation. Aspirants Need to Know the Complete'
                          ' process & important Exam Date or Application form of NEET 2021',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18.0,
                      ),
                    ),
                    SizedBox(height: 10,),
                    Image.asset("images/medical.jpg",height: 250,),
                    SizedBox(height: 20,),
                    Text('Official website : www.nta.ac.in ',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    SizedBox(height: 35,),
                    Text('Frequently Asked Questions : ',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 23.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 20.0, left: 11.0, right: 20.0, bottom: 20.0),
                      child: Column(
                          children: [
                            Text('1. What is the distribution of questions ?',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 10,),
                            Text('The total marks (720) is split into \n Physics : 45, Chemistry : 45, Biology : 90 which is divided into Zoology : 45 and Botany : 45.',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18.0,
                              ),
                            ),
                        ]
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only( left: 11.0, right: 20.0, bottom: 20.0),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text('2. What is the mode of questioning ?',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 10,),
                            Text('180 Multiple choice questions that covers total of 720 marks. Marking structure : Correct answer : +4 , Incorrect Answer : -1',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18.0,
                              ),
                            ),
                          ]
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 11.0, right: 20.0, bottom: 20.0),
                      child: Column(
                          children: [
                            Text('3. What is the medium of paper ?',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 10,),
                            Text('The are several modes of languages : English, Hindi,Urdu, Telugu, Bengali, Kannada, Gujarati, Tamil, Marathi, Assamese and Oriya (as per the location of the Candidate). ',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18.0,
                              ),
                            ),
                          ]
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ]),
    );
  }
}
