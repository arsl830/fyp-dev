// main.dart
import 'package:flutter/material.dart';
//import 'package:getwidget/getwidget.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Remove the debug banner
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Define a key to access the form
  final _formKey = GlobalKey<FormState>();

  String _userEmail = '';
  String _userName = '';
  String _password = '';
  String _confirmPassword = '';
  String _cnic = '';
  String _RegNo = '';

  // This function is triggered when the user press the "Sign Up" button
  void _trySubmitForm() {
    final isValid = _formKey.currentState!.validate();
    if (isValid) {
      print(_userEmail);
      print(_userName);
      print(_password);
      print(_confirmPassword);
      print(_cnic);
      print(_RegNo);

      /* 
      for processing data in database or api calling 
      */
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.grey,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        centerTitle: true,
      ),
      //  Container(
      //               alignment: Alignment.center,
      //               padding: EdgeInsets.all(10),
      //               child: Text(
      //                 'Sign in',
      //                 style: TextStyle(fontSize: 20),
      //               )),

      body: Container(
        color: Colors.white,
        alignment: Alignment.center,
        child: Center(
          child: Card(
            margin: EdgeInsets.symmetric(vertical: 40, horizontal: 20),
            // child: Padding(
            //   // padding: const EdgeInsets.all(10),
            child: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    /////////////////////////////////////////
                    /// Eamil
                    Container(
                        alignment: Alignment.center,
                        child: Text(
                          'Create Account as travel Agency',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        )),

                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25.0)),
                        labelText: 'Email',
                      ),
                      validator: (value) {
                        if (value!.trim().isEmpty) {
                          return 'Please enter your email address';
                        }
                        // Check if the entered email has the right format
                        if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                          return 'Please enter a valid email address';
                        }
                        // Return null if the entered email is valid
                        return null;
                      },
                      onChanged: (value) => _userEmail = value,
                    ),
                    SizedBox(
                      height: 5,
                    ),

                    /////////////////////////////////////////
                    /// username

                    TextFormField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25.0)),
                          labelText: 'Username'),
                      validator: (value) {
                        if (value!.trim().isEmpty) {
                          return 'This field is required';
                        }
                        if (value.trim().length < 4) {
                          return 'Username must be at least 4 characters in length';
                        }
                        // Return null if the entered username is valid
                        return null;
                      },
                      onChanged: (value) => _userName = value,
                    ),
                    SizedBox(
                      height: 5,
                    ),

                    ////////////////////////////////////
                    /// Password
                    TextFormField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25.0)),
                          labelText: 'Password'),
                      obscureText: true,
                      validator: (value) {
                        if (value!.trim().isEmpty) {
                          return 'This field is required';
                        }
                        if (value.trim().length < 8) {
                          return 'Password must be at least 8 characters in length';
                        }
                        // Return null if the entered password is valid
                        return null;
                      },
                      onChanged: (value) => _password = value,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    //////////////////////////////////
                    /// Confirm Password
                    TextFormField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25.0)),
                          labelText: 'Confirm Password'),
                      obscureText: true,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'This field is required';
                        }

                        if (value != _password) {
                          return 'Confimation password does not match the entered password';
                        }

                        return null;
                      },
                      onChanged: (value) => _confirmPassword = value,
                    ),
                    SizedBox(height: 5),
                    //CNIC
                    TextFormField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25.0)),
                          labelText: 'CNIC'),
                      validator: (value) {
                        if (value!.trim().isEmpty) {
                          return 'This field is required';
                        }
                      },
                      onChanged: (value) => _cnic = value,
                    ),
                    SizedBox(height: 5),
                    //registration No
                    TextFormField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25.0)),
                          labelText: 'Registration No'),
                      onChanged: (value) => _RegNo = value,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                        width: 300.0,
                        height: 50.0,
                        child: OutlinedButton(
                            child: Text('Sign Up'),
                            style: OutlinedButton.styleFrom(
                              primary: Colors.white,
                              backgroundColor: Colors.teal,
                              shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                            ),
                            onPressed: _trySubmitForm)),
                  ],
                )),
          ),
        ),
      ),
    );
  }
}
