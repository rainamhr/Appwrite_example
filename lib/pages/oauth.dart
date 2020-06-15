import 'package:appwrite_example/states/app_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MaterialApp(
    home: Playground(),
  ));
}

class Playground extends StatefulWidget {
  @override
  PlaygroundState createState() => PlaygroundState();
}

class PlaygroundState extends State<Playground> {
  String username = "Loading...";

  @override
  void initState() {
    Provider.of<NoteDataState>(context, listen: false).init();
    super.initState();
  }

  loginGoogle() async {
    var appState = Provider.of<NoteDataState>(context, listen: false);
    appState.loginWithGoogle();
  }

  loginFacebook() async {
    var appState = Provider.of<NoteDataState>(context, listen: false);
    appState.loginWithFb();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
//        appBar: AppBar(title: Text("❤"), backgroundColor: Colors.lightBlueAccent),
      body: Container(
        child: SingleChildScrollView(
          child: Column(children: <Widget>[
            Padding(padding: EdgeInsets.all(20.0)),

            ButtonTheme(
              minWidth: 280.0,
              height: 50.0,
              child: RaisedButton(
                  child: Text("Login with Google",
                      style: TextStyle(color: Colors.white, fontSize: 20.0)),
                  color: Colors.red,
                  onPressed: () {
                    loginGoogle();
                  }),
            ),

            Padding(padding: EdgeInsets.all(20.0)),

            ButtonTheme(
              minWidth: 280.0,
              height: 50.0,
              child: RaisedButton(
                  child: Text("Login with FB",
                      style: TextStyle(color: Colors.white, fontSize: 20.0)),
                  color: Colors.lightBlue,
                  onPressed: () {
                    loginFacebook();
                  }),
            ),

            Padding(padding: EdgeInsets.all(20.0)),
            Divider(),
            Padding(padding: EdgeInsets.all(20.0)),

//                      Text(username, style: TextStyle(color: Colors.black, fontSize: 20.0)),

            Padding(padding: EdgeInsets.all(20.0)),
            Divider(),
            Padding(padding: EdgeInsets.all(20.0)),

            Padding(padding: EdgeInsets.all(20.0)),
          ]),
        ),
      ),
    );
  }
}
