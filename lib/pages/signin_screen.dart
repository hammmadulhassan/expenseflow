import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:expenseflow/pages/signup_screen.dart';
import 'package:http/http.dart'  as http;
import '../tabs.dart';
class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool rememberPassword = true;

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
   insertrecord()  {

     if (_emailController.text == 'hammad@gmail.com' && _passwordController.text == '123') {
       // Navigate to TabsController page
       Navigator.pushReplacement(
         context,
         CupertinoPageRoute(builder: (context) => TabsController()),
       );
     }

  }
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Sign In'),
      ),
      child: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 40),
              Text(
                'Welcome back',
                style: CupertinoTheme.of(context).textTheme.navLargeTitleTextStyle.copyWith(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 40),
              CupertinoTextField(
                controller: _emailController,
                placeholder: 'Email',
                clearButtonMode: OverlayVisibilityMode.editing,
                keyboardType: TextInputType.emailAddress,
                decoration: BoxDecoration(
                  border: Border.all(color: CupertinoColors.systemGrey),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              SizedBox(height: 25),
              CupertinoTextField(
                controller: _passwordController,
                placeholder: 'Password',
                clearButtonMode: OverlayVisibilityMode.editing,
                obscureText: true,
                decoration: BoxDecoration(
                  border: Border.all(color: CupertinoColors.systemGrey),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      CupertinoCheckbox(
                        value: rememberPassword,
                        onChanged: (bool? value) {
                          setState(() {
                            rememberPassword = value!;
                          });
                        },
                        activeColor: CupertinoTheme.of(context).primaryColor,
                      ),
                      SizedBox(width: 10),
                      Text(
                        'Remember me',
                        style: TextStyle(
                          color: CupertinoColors.systemGrey,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 25),
              Center(
                child: CupertinoButton.filled(
                  child: Text('Sign In'),
                  onPressed: () {
                    insertrecord();
                    // Add validation and sign in logic here
                  },
                ),
              ),
              SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Don\'t have an account? ',
                    style: TextStyle(
                      color: CupertinoColors.systemGrey,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        CupertinoPageRoute(
                          builder: (context) => const SignUpScreen(),
                        ),
                      );
                    },
                    child: Text(
                      'Sign up',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: CupertinoTheme.of(context).primaryColor,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}