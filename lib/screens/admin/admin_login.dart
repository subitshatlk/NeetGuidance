import 'package:flutter/material.dart';
import 'package:email_auth/email_auth.dart';
import 'admin_home.dart';

class AdminLogin extends StatefulWidget {
  @override
  _AdminLoginState createState() => _AdminLoginState();
}

class _AdminLoginState extends State<AdminLogin> {

  TextEditingController emailInputController;
  TextEditingController _otpInputController;
  String _selected=null;

  void sendOTP() async {
    EmailAuth.sessionName = "Test Session";
    var res = await EmailAuth.sendOtp(receiverMail: _selected);
    if (res) {
      print("OTP Sent");
    }
    else {
      print("OTP send failed");
    }
  }

  void verifyOTP() async {
    var res = EmailAuth.validate(
        receiverMail: _selected, userOTP: _otpInputController.text
    );
    if (res) {
      print("OTP Verified");
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => AdminHome()),
      );
    }
    else {
      print("Invalid OTP");
    }
  }

  otpDialogBox(BuildContext context) {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return new AlertDialog(

            title: Text('Enter your OTP'),
            content: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: InputDecoration(
                  border: new OutlineInputBorder(
                    borderRadius: const BorderRadius.all(
                      const Radius.circular(30),
                    ),
                  ),
                ),
                controller: _otpInputController,
              ),
            ),
            contentPadding: EdgeInsets.all(10.0),
            actions: <Widget>[
              FlatButton(
                onPressed: () => verifyOTP(),
                child: Text(
                  'Submit',
                ),
              ),
            ],
          );
        });
  }

  initState() {
    emailInputController = new TextEditingController();
    _otpInputController = new TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List <String> account = [
      'admin1@gmail.com'
    ] ;
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.2,
              ),
              Text(
                "Admin Login",
                style: TextStyle(
                  color: Colors.cyan,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Image.network(
                "https://avatars1.githubusercontent.com/u/41328571?s=280&v=4",
                height: 150,
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: <Widget>[
                    // keyboardType: TextInputType.phone,
                    Container(
                        padding: EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: Colors.grey[100],
                            ),
                          ),
                        ),
                        child: DropdownButtonFormField(
                            value: _selected,
                            items: _dropDownItem(),
                            onChanged: (value){
                              _selected=value;
                            },
                            hint: Text('Select Account'),
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),),
                            )
                        )
                    ),
                  ],
                ),),
              SizedBox(
                height: 10.0,
              ),
              RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
                onPressed: () =>
                _selected == null ? null : otpDialogBox(context),
                child: Text(
                  "Login",
                  style: TextStyle(color: Colors.white),
                ),
                elevation: 7.0,
                color: Colors.cyan,
              ),
              SizedBox(
                height: 20,
              ),
              RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
                onPressed: () =>
                _selected == null ? null : sendOTP(),
                child: Text(
                  "Send OTP",
                  style: TextStyle(color: Colors.white),
                  //onPressed: () => otpDialogBox(context),
                ),
                elevation: 7.0,
                color: Colors.cyan,
              ),

              SizedBox(
                height: 20,
              ),

              SizedBox(
                height: 20,
              ),
            ],
          ),
        )
    );
  }
  List<DropdownMenuItem<String>> _dropDownItem() {
    List<String> ddl = ["admin1@gmail.com","ananya0814@gmail.com", "subitsha1602@gmail.com", "prathikshapadmanaban@gmail.com"];
    return ddl.map(
            (value) =>
            DropdownMenuItem(
              value: value,
              child: Text(value),
            )
    ).toList();
  }
}