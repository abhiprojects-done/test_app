import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'home_page.dart'; // ← your main / home screen
import 'forgot_password.dart';
import 'signup.dart';

class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _isLoading = false;

  //---------------------------------------------------------------------------
  //  AUTO-LOGIN  → skip the form if already logged-in
  //---------------------------------------------------------------------------
  @override
  void initState() {
    super.initState();
    _checkLoginStatus();
  }

  Future<void> _checkLoginStatus() async {
    final prefs = await SharedPreferences.getInstance();
    final loggedIn = prefs.getBool('isLoggedIn') ?? false;

    if (loggedIn && mounted) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => const TouristAttractionsScreen(),
        ),
      );
    }
  }

  //---------------------------------------------------------------------------
  //  LOGIN
  //---------------------------------------------------------------------------
  Future<void> _userLogin() async {
    setState(() => _isLoading = true);

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );

      // save flag
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool('isLoggedIn', true);

      // success toast
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        backgroundColor: Colors.green,
        content: Text('You have successfully logged in',
            style: TextStyle(fontSize: 16)),
      ));

      // go to home screen
      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (_) => const TouristAttractionsScreen(
              message: 'Login successful',
            ),
          ),
        );
      }
    } on FirebaseAuthException catch (e) {
      String message;
      if (e.code == 'user-not-found') {
        message = 'No user found for that email.';
      } else if (e.code == 'wrong-password') {
        message = 'Incorrect password.';
      } else {
        message = 'Something went wrong. Please try again.';
      }

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: Colors.orangeAccent,
        content: Text(message, style: const TextStyle(fontSize: 16)),
      ));
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  //---------------------------------------------------------------------------
  //  UI
  //---------------------------------------------------------------------------
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: const Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              const SizedBox(height: 40),

              //  Email
              _FieldContainer(
                child: TextFormField(
                  controller: _emailController,
                  validator: (v) =>
                      v == null || v.isEmpty ? 'Please enter email' : null,
                  decoration: _inputDecoration('Email'),
                ),
              ),
              const SizedBox(height: 20),

              //  Password
              _FieldContainer(
                child: TextFormField(
                  controller: _passwordController,
                  obscureText: true,
                  validator: (v) =>
                      v == null || v.isEmpty ? 'Please enter password' : null,
                  decoration: _inputDecoration('Password'),
                ),
              ),
              const SizedBox(height: 30),

              //  Login button
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF273671),
                  padding: const EdgeInsets.symmetric(vertical: 14.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                onPressed: _isLoading
                    ? null
                    : () {
                        if (_formKey.currentState!.validate()) {
                          _userLogin();
                        }
                      },
                child: _isLoading
                    ? const CircularProgressIndicator(color: Colors.white)
                    : const Text('Login',
                        style:
                            TextStyle(fontSize: 20.0, color: Colors.white)),
              ),
              const SizedBox(height: 20),

              //  Forgot password
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => ForgotPassword()),
                  );
                },
                child: const Center(
                  child: Text(
                    'Forgot Password?',
                    style: TextStyle(
                        color: Color(0xFF8c8e98),
                        fontSize: 18.0,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              const SizedBox(height: 40),

              //  Sign-up
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Don't have an account?",
                    style:
                        TextStyle(color: Color(0xFF8c8e98), fontSize: 18.0),
                  ),
                  const SizedBox(width: 5),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const SignUp()),
                      );
                    },
                    child: const Text(
                      'Sign Up',
                      style: TextStyle(
                          color: Color(0xFF273671),
                          fontSize: 20.0,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  InputDecoration _inputDecoration(String hint) => InputDecoration(
        border: InputBorder.none,
        hintText: hint,
        hintStyle:
            const TextStyle(color: Color(0xFFb2b7bf), fontSize: 18.0),
      );
}

//----------------------------------------------------------------------------
//  Reusable rounded field container
//----------------------------------------------------------------------------
class _FieldContainer extends StatelessWidget {
  const _FieldContainer({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 30.0),
      decoration: BoxDecoration(
        color: const Color(0xFFedf0f8),
        borderRadius: BorderRadius.circular(30),
      ),
      child: child,
    );
  }
}
