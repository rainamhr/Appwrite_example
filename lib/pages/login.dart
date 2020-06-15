import 'package:appwrite_example/Session/session_manager.dart';
import 'package:appwrite_example/states/app_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'home.dart';

class Login extends StatefulWidget {
  Login({Key key}) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<Login> {
  final usernameTextController = TextEditingController();
  final passwordTextController = TextEditingController();

  @override
  void initState() {
    usernameTextController.text = "appnote@test.com";
    passwordTextController.text= "appnote123456";
    Provider.of<NoteDataState>(context, listen: false).init();
    super.initState();
  }

  @override
  void dispose() {
    usernameTextController.dispose();
    passwordTextController.dispose();
    super.dispose();
  }

  _submitLogin() async {
    if ((usernameTextController.text == '') ||
        (passwordTextController.text == '')) {
      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text("Email and password empty"),
      ));
      return null;
    }
    print(usernameTextController.text);
    print(passwordTextController.text);
    var appState = Provider.of<NoteDataState>(context, listen: false);
    appState.login(
        username: usernameTextController.text,
        password: passwordTextController.text);
    if (appState.getUserInfo() != '') {
      SessionManager.setEmail("USERNAME",usernameTextController.text);
      print("getemail----------");
      print(SessionManager.getEmail("USERNAME"));
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (_) => Home()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Login',
              style: TextStyle(fontSize: 20, color: Colors.teal),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                autofocus: true,
                controller: usernameTextController,
                decoration: InputDecoration(hintText: 'E-mail'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                autofocus: true,
                obscureText: true,
                controller: passwordTextController,
                decoration: InputDecoration(hintText: 'Password'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: MaterialButton(
                onPressed: _submitLogin,
                color: Colors.teal,
                child: Text(
                  'Login',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
