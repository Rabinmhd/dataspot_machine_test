import 'package:flutter/material.dart';

// ignore: must_be_immutable
class RegisterPage extends StatelessWidget {
  RegisterPage({Key? key});

  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _genderController = TextEditingController();
  final _emailController = TextEditingController();
  bool passwordHide = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Registration Page',
                style: TextStyle(fontSize: 30),
              ),
              const SizedBox(height: 10.0),
              const Text(
                'Username',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8.0),
              TextField(
                controller: _usernameController,
                decoration: const InputDecoration(
                  hintText: 'Enter your username',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10.0),
              const Text(
                'Email',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8.0),
              TextField(
                controller: _emailController,
                decoration: const InputDecoration(
                  hintText: 'Enter your email',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10.0),
              const Text(
                'Gender',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8.0),
              TextField(
                controller: _genderController,
                decoration: const InputDecoration(
                  hintText: 'Enter your gender',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10.0),
              const Text(
                'Password',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8.0),
              TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Enter your password',
                  border: OutlineInputBorder(),
                  suffixIcon: InkWell(
                    onTap: () {
                      passwordHide = !passwordHide;
                    },
                    child: passwordHide == true
                        ? const Icon(Icons.visibility_off)
                        : const Icon(Icons.visibility),
                  ),
                ),
              ),
              const SizedBox(height: 20.0),
              GestureDetector(
                onTap: () {
                  // Handle registration logic here
                  print('Register Button Clicked!');
                },
                child: Container(
                  width: double.infinity,
                  height: 50.0,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: const Center(
                    child: Text(
                      'Register',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10.0),
              GestureDetector(
                onTap: () {
                  // Handle back to login logic here

                  Navigator.pop(context);
                },
                child: Container(
                  width: double.infinity,
                  height: 50.0,
                  decoration: BoxDecoration(
                    color: Colors.indigo[50],
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: const Center(
                    child: Text(
                      'Back to Login',
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
