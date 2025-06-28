import 'package:flutter/material.dart';
import 'package:registration_ui/forgot_password_page.dart';
import 'package:registration_ui/register_email_page.dart';

class LoginEmailPage extends StatefulWidget {
  const LoginEmailPage({super.key});

  @override
  State<LoginEmailPage> createState() => _LoginEmailPageState();
}

class _LoginEmailPageState extends State<LoginEmailPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {

    Route _createRoute(){
      return PageRouteBuilder(pageBuilder: (context, animation, secondaryAnimation) => RegisterEmailPage(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const begin = Offset(1.0, 0.0);
            const end = Offset.zero;
            const curve = Curves.ease;

            var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

            return SlideTransition(position: animation.drive(tween),
                child: child);
          }
      );
    }
    Route _createRoute2(){
      return PageRouteBuilder(pageBuilder: (context, animation, secondaryAnimation) => ForgotPasswordPage(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const begin = Offset(1.0, 0.0);
            const end = Offset.zero;
            const curve = Curves.ease;

            var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

            return SlideTransition(position: animation.drive(tween),
                child: child);
          }
      );
    }

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Login"),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Profile image
            Container(
              decoration: const BoxDecoration(
                color: Colors.grey,
                shape: BoxShape.circle,
              ),
              padding: const EdgeInsets.all(8),
              child: const Icon(
                Icons.person,
                color: Colors.white,
                size: 60,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              "Login to your Account",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 12),
            // Email TextField
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: "Email",
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 12),
            // Password TextField
            TextField(
              controller: passwordController,
              obscureText: !_isPasswordVisible,
              decoration: InputDecoration(
                labelText: "Password",
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                suffixIcon: IconButton(
                  icon: Icon(
                    _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                  ),
                  onPressed: () {
                    setState(() {
                      _isPasswordVisible = !_isPasswordVisible;
                    });
                  },
                ),
              ),
            ),
            const SizedBox(height: 8),
            // Forgot password va Register
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).push(_createRoute());
                  },
                  child: const Text("No account? Register"),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).push(_createRoute2());
                  },
                  child: const Text("Forgot Password?"),
                ),
              ],
            ),
            const Spacer(),
            // Login Button
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  debugPrint("Email: ${emailController.text}");
                  debugPrint("Password: ${passwordController.text}");
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                ),
                child: const Text("Login"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
