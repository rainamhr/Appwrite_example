import 'package:appwrite_example/pages/login.dart';
import 'package:appwrite_example/pages/oauth.dart';
import 'package:appwrite_example/pages/signup.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  MainPage({Key key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'WELCOME',
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.teal),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: MaterialButton(
                  onPressed: () {
                    setState(() {
                      Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (_) => Login()));
                    });
                  },
                  color: Colors.teal,
                  child: Text(
                    'LOGIN',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: MaterialButton(
                  onPressed: () {
                    setState(() {
                      Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (_) => Signup()));
                    });
                  },
                  color: Colors.teal,
                  child: Text(
                    'SIGNUP',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: MaterialButton(
                  onPressed: () {
                    setState(() {
                      Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (_) => Playground()));
                    });
                  },
                  color: Colors.teal,
                  child: Text(
                    'OAUTH',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
