import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:user_input/models/profile.dart';

class ProfileScreen extends StatefulWidget {
final List<Profile> profiles;

  const ProfileScreen({Key key, this.profiles}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<ProfileScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: (){
            widget.profiles.clear();

            Navigator.pop(context);

          },
        ),
        centerTitle: true,
        title: Text('Profile Data'),
      ),
      body: ListView.builder(
        itemCount: widget.profiles.length,
          itemBuilder: (context,index)=>Padding(
            padding: const EdgeInsets.all(11),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    color: Colors.grey,
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width ,
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Center(
                            child: Image(
                              image: NetworkImage(widget.profiles[index].image),
                            ),
                          ),
                          SizedBox(height: 15,),
                          Text('Name: ${widget.profiles[index].name}',
                            style: TextStyle(
                              fontSize: 25
                            ),
                          ),
                          SizedBox(height: 15,),
                          Text('Age: ${widget.profiles[index].age}',
                            style: TextStyle(
                                fontSize: 25
                            ),
                          ),
                          SizedBox(height: 15,),
                          Text('Email: ${widget.profiles[index].email}',
                            style: TextStyle(
                                fontSize: 25
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
      ),
      );
  }
}
