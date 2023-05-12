import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            width: double.infinity,
            height: 85.0,
          ),
          // Container(
          //   margin:
          //       EdgeInsets.only(left: double.infinity, right: double.infinity),
          //   width: 200,
          //   height: 200,
          //   child: Text(
          //     "Logo",
          //     style: TextStyle(fontSize: 70),
          //   ),
          // ),
          Text(
            "Register",
            style: TextStyle(
              fontSize: 30,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Column(
            children: [
              //Name field
              SizedBox(
                width: 250,
                height: 50,
                child: TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Your name',
                    contentPadding: EdgeInsets.all(10.0),
                    border: OutlineInputBorder(),
                  ),
                ),
              ),

              const SizedBox(
                height: 20,
              ),
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

              //password confirm field
              SizedBox(
                width: 250,
                height: 50,
                child: TextFormField(
                  obscureText: true,
                  decoration: const InputDecoration(
                    hintText: 'Confirm Password',
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
                'Already have an account ?',
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
              const Text(
                'Login Here',
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
