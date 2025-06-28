import 'package:flutter/material.dart';

class RegisterEmailPage extends StatefulWidget {
  const RegisterEmailPage({super.key});

  @override
  State<RegisterEmailPage> createState() => _RegisterEmailPageState();
}

class _RegisterEmailPageState extends State<RegisterEmailPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
        title: Text("Register"),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Profile image
            Container(
              decoration: BoxDecoration(
                color: Colors.blue, // XML-dagi #2196F3
                shape: BoxShape.circle,
              ),
              padding: EdgeInsets.all(8),
              child: Icon(
                Icons.person,
                color: Colors.white,
                size: 60,
              ),
            ),
            SizedBox(height: 12),
            Text(
              "Create a new account",
              style: Theme.of(context).textTheme.titleMedium,
            ),
            SizedBox(height: 12),

            // Email
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: "Email",
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(height: 12),
            // Password
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: "Password",
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                suffixIcon: Icon(Icons.visibility_off),
              ),
            ),
            SizedBox(height: 12),
            // Confirm Password
            TextField(
              controller: confirmPasswordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: "Confirm password",
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                suffixIcon: Icon(Icons.visibility_off),
              ),
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Already have an account? ",
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                TextButton(
                  onPressed: () {
                    // Login sahifasiga yo'naltirish
                    debugPrint("Login bosildi");
                  },
                  child: Text("Login"),
                ),
              ],
            ),
            Spacer(),
            // Register button
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  // Login bosilganda
                  debugPrint("Email: ${emailController.text}");
                  debugPrint("Password: ${passwordController.text}");
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                ),
                child: Text("Register"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
