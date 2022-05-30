import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
import 'package:flutter_auth_q/authentication.dart';
import 'package:flutter_auth_q/home.dart';

class Signup extends StatelessWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: <Widget>[
          const SizedBox(height: 80),
          //logo
          Column(
            children: [
              Container(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Image.asset('assets/logo-utter-academy-white.png')),
            ],
          ),
          const SizedBox(height: 50),
          const Text(
            ' Welcome',
            style: TextStyle(fontSize: 24),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: SignupForm(),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                // Container(child:
                Row(
                  children: <Widget>[
                    const SizedBox(width: 70),
                    const Text('Have Account? ',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18)),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Text(
                        'Log in!',
                        style: TextStyle(fontSize: 18, color: Colors.blue),
                      ),
                    )
                  ],
                ),
                // ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Container buildLogo() {
    return Container(
      height: 80,
      width: 80,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: Colors.blue),
      child: const Center(
        child: Text(
          "T",
          style: TextStyle(color: Colors.white, fontSize: 60.0),
        ),
      ),
    );
  }
}

class SignupForm extends StatefulWidget {
  const SignupForm({Key? key}) : super(key: key);
  @override
  MySignupFormState createState() => MySignupFormState();
}

class MySignupFormState extends State<SignupForm> {
  final _formKey = GlobalKey<FormState>();

  String? email;
  String? password;
  String? name;

  bool _obscureText = false;
  bool agree = false;
  final pass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var myborder = const OutlineInputBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(100.0),
      ),
    );

    var space = const SizedBox(height: 10);
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          //form input email
          TextFormField(
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.email_outlined),
              labelText: 'Email',
              border: myborder,
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter your email';
              }
              return null;
            },
            onSaved: (val) {
              email = val;
            },
            keyboardType: TextInputType.emailAddress,
          ),
          space,

          //form input pasword
          TextFormField(
            controller: pass,
            obscureText: !_obscureText,
            decoration: InputDecoration(
                labelText: 'Password',
                prefixIcon: const Icon(Icons.lock_outline),
                border: myborder,
                suffixIcon: GestureDetector(
                  child: Icon(
                    _obscureText ? Icons.visibility : Icons.visibility_off,
                  ),
                  onTap: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                )),
            onSaved: (val) {
              password = val;
            },
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter your password';
              }
              return null;
            },
          ),
          space,

          //form input confimr pasword
          TextFormField(
            controller: pass,
            obscureText: !_obscureText,
            decoration: InputDecoration(
              labelText: 'Confimr Password',
              prefixIcon: const Icon(Icons.lock_outline),
              border: myborder,
              // suffixIcon: GestureDetector(
              //   child: Icon(
              //     _obscureText ? Icons.visibility : Icons.visibility_off,
              //   ),
              //   onTap: () {
              //     setState(() {
              //       _obscureText = !_obscureText;
              //     });
              //   },
              // )),
              // onSaved: (val) {
              //   password = val;
              // },
            ),
            // obscureText: true;
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please re-enter your password';
              } else if (value != pass.text) {
                return 'Password not match';
              }
              return null;
            },
          ),
          space,

          //form input full name
          TextFormField(
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.account_circle),
              labelText: 'Full name',
              border: myborder,
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter your full name';
              }
              return null;
            },
            onSaved: (val) {
              name = val;
            },
          ),
          // space,
          Row(
            children: <Widget>[
              Checkbox(
                  value: agree,
                  onChanged: (_) {
                    setState(() {
                      agree = !agree;
                    });
                  }),
              const Flexible(
                child: Text(
                    'By creating account, I agree to Term & Conditions and Privacy Policy.'),
              ),
            ],
          ),

          const SizedBox(
            height: 10,
          ),

          SizedBox(
            height: 50,
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();

                  AuthenticationHelper()
                      .signIn(email: email!, password: password!)
                      .then((result) {
                    if (result == null) {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (countext) => const Home()));
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            result,
                            style: const TextStyle(fontSize: 16),
                          ),
                        ),
                      );
                    }
                  });
                }
              },
              style: ElevatedButton.styleFrom(
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(24.0)))),
              child: const Text('Signup', style: TextStyle(fontSize: 20)),
            ),
          ),
        ],
      ),
    );
  }
}
