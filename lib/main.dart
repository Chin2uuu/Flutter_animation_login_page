import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext) {
    return MaterialApp(
      home: LoginPage(),
      theme: ThemeData(primaryColor: Colors.blue),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  late Animation<double> iconanimation;
  late AnimationController iconanimationController;
  @override
  void initState() {
    super.initState();
    iconanimationController = new AnimationController(
        vsync: this, duration: new Duration(milliseconds: 400));
    iconanimation = new CurvedAnimation(
        parent: iconanimationController, curve: Curves.bounceIn);
    iconanimation.addListener(() {
      this.setState(() {});
    });
    iconanimationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 223, 200, 134),
      body: new Stack(fit: StackFit.expand, children: <Widget>[
        new Image(
          image: AssetImage("assets/login-bg.jpg"),
          fit: BoxFit.cover,
          color: Color.fromARGB(255, 47, 27, 50).withOpacity(0.3),
          colorBlendMode: BlendMode.darken,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FlutterLogo(
              size: iconanimationController.value * 100,
            ),
            new Form(
                child: Theme(
              data: new ThemeData(
                brightness: Brightness.dark,
                primarySwatch: Colors.blue,
                inputDecorationTheme: new InputDecorationTheme(
                  labelStyle: new TextStyle(
                    color: Colors.blue,
                    fontSize: 20.0,
                  ),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: new Column(
                  children: <Widget>[
                    new TextFormField(
                      decoration:
                          new InputDecoration(hintText: "Enter Your Email"),
                      keyboardType: TextInputType.emailAddress,
                    ),
                    new TextFormField(
                      decoration:
                          new InputDecoration(hintText: "Enter Your Email"),
                      keyboardType: TextInputType.text,
                      obscureText: true,
                    ),
                    new Padding(padding: const EdgeInsets.only(top: 25.0)),
                    new MaterialButton(
                      onPressed: () => {},
                      color: Colors.blue,
                      textColor: Colors.white,
                      child: Text("Log In"),
                      splashColor: Colors.white38,
                    )
                  ],
                ),
              ),
            ))
          ],
        )
      ]),
    );
  }
}
