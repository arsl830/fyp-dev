import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fyp_dev/login1.dart';

class MyLogin extends StatefulWidget {
  @override
  _MyLoginState createState() => _MyLoginState();
}

class _MyLoginState extends State<MyLogin> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/logins.jpg'), fit: BoxFit.cover
          )
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
            child: ListView(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    SizedBox(height: 50,),
                    Image.asset('assets/logos.png'),
                    SizedBox(height: 180,),
                    FlatButton(
                        onPressed: (){
                          Navigator.push(context,
                            MaterialPageRoute(builder: (context)=>MyLogin1()),
                          );
                        },
                        minWidth: double.infinity,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)
                        ),
                        color: Colors.black87,
                        padding: EdgeInsets.all(12),
                        child: Text('SIGN IN', style: TextStyle(
                            color: Colors.white,
                            fontSize:15,
                            fontWeight: FontWeight.bold
                        ),)
                    ),
                    SizedBox(height: 5,),
                    FlatButton(
                        onPressed: (){},
                        minWidth: double.infinity,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)
                        ),
                        color: Colors.black87,
                        padding: EdgeInsets.all(12),
                        child: Text('SIGN UP', style: TextStyle(
                            color: Colors.white,
                            fontSize:15,
                            fontWeight: FontWeight.bold
                        ),
                        )
                    )
                  ],
                ),
              ],
            )
        ),
      ),
    );
  }
}
