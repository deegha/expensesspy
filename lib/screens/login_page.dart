import 'package:flutter/material.dart';

import 'package:expensesspy/services/auth_service.dart';
import 'package:expensesspy/utils/clip_path.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  final auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(elevation: 0),
      body: Column(
        children: [
          ClipPath(
            clipper: CurveClipper(),
            child: Container(
              color: Theme.of(context).primaryColor,
              height: 300,
              child: Center(
                child: Column(
                  children: [
                    const SizedBox(height: 50),
                    Text("Expensess Spy",
                        style: Theme.of(context).textTheme.headline1),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: 229,
                      child: Text(
                        "Easy way to track all your expenses",
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                const SizedBox(
                  height: 60,
                ),
                SizedBox(
                  width: 250,
                  child: FloatingActionButton.extended(
                    onPressed: () {
                      auth.signInWithGoogle();
                    },
                    label: const Text("Continue with Google"),
                    icon: Container(
                      width: 25,
                      height: 25,
                      decoration: BoxDecoration(
                          color: Colors.deepOrange,
                          borderRadius: BorderRadius.circular(50)),
                      child: const Center(
                        child: Text(
                          "G",
                        ),
                      ),
                    ),
                    backgroundColor: Theme.of(context).primaryColor,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                SizedBox(
                  width: 250,
                  child: FloatingActionButton.extended(
                    onPressed: () {},
                    label: const Text("Continue with Apple"),
                    icon: const Icon(Icons.apple),
                    backgroundColor: Colors.black,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                SizedBox(
                  width: 230,
                  height: 55,
                  child: Text(
                      "Continue with the either platform. If you  do not have an account already, this will create one for you",
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyText2),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
