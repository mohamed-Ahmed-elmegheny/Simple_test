import 'package:flutter/material.dart';
import 'package:user_input/models/profile.dart';
import 'package:user_input/screens/profile.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Profile> profiles = [];
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  final TextEditingController name = TextEditingController();
  final TextEditingController age = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController image = TextEditingController();
String _email,_name,_image;
String _age;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Container(
        child: Form(
          key: _globalKey,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  TextFormField(
                    controller: name,
                    onSaved: (value){
                      _name = value;
                    },
                    validator: (value){
                      if(value.isEmpty){
                        return 'Enter Name';
                      }
                      return '';
                    },
                    decoration: InputDecoration(
                        hintText: 'Name',
                      hintStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                      ),
                      filled: true,
                        fillColor: Colors.purple,
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                                color: Colors.white
                            )
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                                color: Colors.white
                            )
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                                color: Colors.white
                            )
                        )
                    ),
                    ),
                  SizedBox(height: 20,),
                  TextFormField(
                    controller: age,
                    keyboardType: TextInputType.number,
                    onSaved: (value){
                     _age = value;
                    },
                    validator: (value){
                      if(value.isEmpty || value.length >3){
                        return 'Age must be at least 3 characters';
                      }
                      return '';
                    },
                    decoration: InputDecoration(
                        hintText: 'Age',
                        hintStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold
                        ),
                        filled: true,
                        fillColor: Colors.purple,
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                                color: Colors.white
                            )
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                                color: Colors.white
                            )
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                                color: Colors.white
                            )
                        )
                    ),
                  ),
                  SizedBox(height: 20,),
                  TextFormField(
                    controller: email,
                    keyboardType: TextInputType.emailAddress,
                    onSaved: (value){
                      _email = value;
                    },
                    validator: (value){
                      if(value.isEmpty|| !value.contains('@')){
                        return 'Email must be real';
                      }
                      return '';
                    },
                    decoration: InputDecoration(
                        hintText: 'mohammedhassan@gmail.com',
                        hintStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                        ),
                        filled: true,
                        fillColor: Colors.purple,
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                                color: Colors.white
                            )
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                                color: Colors.white
                            )
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                                color: Colors.white
                            )
                        )
                    ),
                  ),
                  SizedBox(height: 20,),
                  TextFormField(
                    controller: image,
                    onSaved: (value){
                      _image = value;
                    },
                    validator: (value){
                      if(value.isEmpty){
                        return 'Enter ImageUrl';
                      }
                      return '';
                    },
                    decoration: InputDecoration(
                        hintText: 'Image Url',
                        hintStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold
                        ),
                        filled: true,
                        fillColor: Colors.purple,
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                                color: Colors.white
                            )
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                                color: Colors.white
                            )
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                                color: Colors.white
                            )
                        )
                    ),
                  ),
                  SizedBox(height: 80,),
                  FlatButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)
                    ),
                    color: Colors.pink,
                    onPressed: (){
                        _globalKey.currentState.save();
                        profiles.add(Profile(
                          name: _name,
                          age: _age,
                          email: _email,
                          image: _image,
                        )
                        );
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) =>
                              ProfileScreen(profiles: profiles,)),
                        );
                        setState(() {
                          name.text = '';
                          age.text = '';
                          email.text = '';
                          image.text = '';
                        });


                    },
                    child: Text('Go To Profile',style: TextStyle(fontSize:
                    25),),
                  ),
                ]
                  ),
              ),
            ),
          ),
        ),
      );

  }
}
