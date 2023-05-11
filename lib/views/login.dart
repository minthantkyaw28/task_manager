import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            width: double.infinity,
            height: 40.0,
          ),
          Container(
            margin:
                EdgeInsets.only(left: double.infinity, right: double.infinity),
            width: 200,
            height: 200,
            child: Text(
              "Logo",
              style: TextStyle(fontSize: 70),
            ),
          ),
          Text(
            "Login",
            style: TextStyle(
              fontSize: 30,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Column(
            children: [
              //Email field
              SizedBox(
                width: 250,
                height: 50,
                child: TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Your email',
                    contentPadding: EdgeInsets.all(10.0),
                    border: OutlineInputBorder(),
                  ),
                ),
              ),

              const SizedBox(
                height: 20,
              ),

              //password field
              SizedBox(
                width: 250,
                height: 50,
                child: TextFormField(
                  obscureText: true,
                  decoration: const InputDecoration(
                    hintText: 'Password',
                    contentPadding: EdgeInsets.all(10.0),
                    border: OutlineInputBorder(),
                  ),
                ),
              ),

              const SizedBox(
                height: 20,
              ),

              Container(
                width: 250,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    // Perform action when the button is pressed
                  },
                  child: const Text(
                    'Submit',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
              ),

              const SizedBox(
                height: 15,
              ),

              const Text(
                'Don\'t have an account ?',
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
              const Text(
                'Register Here',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.redAccent,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
