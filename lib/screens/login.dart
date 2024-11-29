import 'package:flutter/material.dart';
import 'package:login_register/screens/register.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const SizedBox(
                height: 100,
              ),
              Center(
                child: Text(
                  "Login",
                  style: TextStyle(
                      color: Colors.grey[900],
                      fontWeight: FontWeight.bold,
                      fontSize: 30),
                ),
              ),
              const SizedBox(
                height: 80,
              ),
              Form(
                  key: _formKey,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Telephone:',
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 6.0),
                        TextFormField(
                          controller: _controller,
                          cursorColor: Colors.blue,
                          decoration: InputDecoration(
                              focusedBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.blue)),
                              prefixIcon: Icon(
                                Icons.call,
                                color: Colors.grey[600],
                              ),
                              hintText: 'Type your number',
                              hintStyle: TextStyle(
                                  fontSize: 14, color: Colors.grey[600])),
                          keyboardType: TextInputType.phone,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your number';
                            }
                            return null;
                          },
                        ),
                      ])),
              const SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Don't have an account?",
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (_) => const Register()));
                    },
                    child: const Text(
                      "register",
                      style: TextStyle(color: Colors.blue),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    print('Name: ${_controller.text}');
                  }
                },
                child: Text(
                  'Login',
                  style: TextStyle(color: Colors.grey[900]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
