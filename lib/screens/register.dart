import 'package:flutter/material.dart';
import 'package:login_register/screens/login.dart';
import 'package:image_picker/image_picker.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _formKey = GlobalKey<FormState>();
  final _phoneController = TextEditingController();
  final _nameController = TextEditingController();
  final _locationController = TextEditingController();
  String _imageText = "";

  Future<void> pickImage(ImageSource source) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: source);

    if (pickedFile != null) {
      setState(() {
        _imageText = pickedFile.name;
      });
    } else {
      print('No image selected.');
    }
  }

  @override
  void dispose() {
    _phoneController.dispose();
    _nameController.dispose();
    _locationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const SizedBox(height: 100),
              Center(
                child: Text(
                  "Register",
                  style: TextStyle(
                      color: Colors.grey[900],
                      fontWeight: FontWeight.bold,
                      fontSize: 30),
                ),
              ),
              const SizedBox(height: 80),
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Telephone:',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 6.0),
                    TextFormField(
                      controller: _phoneController,
                      cursorColor: Colors.blue,
                      decoration: InputDecoration(
                        focusedBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.blue)),
                        prefixIcon: Icon(
                          Icons.call,
                          color: Colors.grey[600],
                        ),
                        hintText: 'Type your number',
                        hintStyle:
                            TextStyle(fontSize: 14, color: Colors.grey[600]),
                      ),
                      keyboardType: TextInputType.phone,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your number';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'Name:',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 6.0),
                    TextFormField(
                      controller: _nameController,
                      cursorColor: Colors.blue,
                      decoration: InputDecoration(
                        focusedBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.blue)),
                        prefixIcon: Icon(
                          Icons.person,
                          color: Colors.grey[600],
                        ),
                        hintText: 'Type your name',
                        hintStyle:
                            TextStyle(fontSize: 14, color: Colors.grey[600]),
                      ),
                      keyboardType: TextInputType.name,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your name';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'Location:',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 6.0),
                    TextFormField(
                      controller: _locationController,
                      cursorColor: Colors.blue,
                      decoration: InputDecoration(
                        focusedBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.blue)),
                        prefixIcon: Icon(
                          Icons.location_on,
                          color: Colors.grey[600],
                        ),
                        hintText: 'Type your location',
                        hintStyle:
                            TextStyle(fontSize: 14, color: Colors.grey[600]),
                      ),
                      keyboardType: TextInputType.text,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your location';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'Image: (optional)',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 6.0),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: 250,
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.image,
                                      color: Colors.grey[600],
                                    ),
                                    const SizedBox(width: 15),
                                    Expanded(
                                      child: SingleChildScrollView(
                                          scrollDirection: Axis.horizontal,
                                          child: Text(_imageText != ""
                                              ? _imageText
                                              : 'Upload an image')),
                                    ),
                                  ],
                                ),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  pickImage(ImageSource.gallery);
                                },
                                child: Icon(
                                  Icons.photo,
                                  size: 20,
                                  color: Colors.grey[600],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Already have an account?",
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (_) => const Login()),
                      );
                    },
                    child: const Text(
                      "Login",
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 50),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    print('Phone: ${_phoneController.text}');
                    print('Name: ${_nameController.text}');
                    print('Location: ${_locationController.text}');
                    print('Image Path: $_imageText');
                  }
                },
                child: Text(
                  'Register',
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
