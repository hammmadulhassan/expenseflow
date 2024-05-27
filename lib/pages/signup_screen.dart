
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:expenseflow/pages/signin_screen.dart';
import 'package:http/http.dart'  as http;

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool agreePersonalData = true;

  // Example of manual validation
  String? nameError;
  String? emailError;
  String? passwordError;



  void validateAndSave() {
    var formValid = true;
    if (_nameController.text.isEmpty) {
      nameError = 'Please enter Full Name';
      formValid = false;
    } else {
      nameError = null;
    }

    if (_emailController.text.isEmpty) {
      emailError = 'Please enter Email';
      formValid = false;
    } else {
      emailError = null;
    }

    if (_passwordController.text.isEmpty) {
      passwordError = 'Please enter Password';
      formValid = false;
    } else {
      passwordError = null;
    }

    setState(() {
      if (formValid && agreePersonalData) {
        showCupertinoDialog(
          context: context,
          builder: (BuildContext context) => CupertinoAlertDialog(
            title: Text('Success'),
            content: Text('You are signed up successfully!'),
            actions: <CupertinoDialogAction>[
              CupertinoDialogAction(
                isDefaultAction: true,
                onPressed: () => Navigator.pop(context),
                child: Text('OK'),
              ),
            ],
          ),
        );
      }
    });
  }

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<void> insertrecord() async {
    try {
      String uri = "http://192.168.109.9:5000/signup";
      var res = await http.post(
        Uri.parse(uri),
        headers: {
          'Content-Type': 'application/json', // Specify the content type
        },
        body: jsonEncode({
          "name": _nameController.text,
          "email": _emailController.text,
          "password": _passwordController.text,
        }),
      );

      if (res.statusCode == 200) {
        var response = jsonDecode(res.body);
        if (response.containsKey("success")) {
          print("record inserted");
          // Do something if the signup was successful
        } else {
          print("some issue came");
          // Do something if the signup failed
        }
      } else {
        // Handle server errors
        print("Server error: ${res.statusCode}");
      }
    } catch (e) {
      // Handle network errors
      print("Error: $e");
    }
  }



  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Sign Up'),
      ),
      child: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 40),
                Text(
                  'Get Started',
                  style: CupertinoTheme.of(context).textTheme.navLargeTitleTextStyle.copyWith(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 30),
                CupertinoTextField(
                  controller: _nameController,
                  placeholder: 'Full Name',
                  clearButtonMode: OverlayVisibilityMode.editing,
                  keyboardType: TextInputType.name,
                  textInputAction: TextInputAction.next,
                  decoration: BoxDecoration(
                    border: Border.all(color: nameError != null ? CupertinoColors.systemRed : CupertinoColors.systemGrey),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                if (nameError != null)
                  Padding(
                    padding: EdgeInsets.only(left: 10, top: 5),
                    child: Text(nameError!, style: TextStyle(color: CupertinoColors.systemRed, fontSize: 14)),
                  ),
                SizedBox(height: 20),
                CupertinoTextField(
                  controller: _emailController,
                  placeholder: 'Email',
                  clearButtonMode: OverlayVisibilityMode.editing,
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  decoration: BoxDecoration(
                    border: Border.all(color: emailError != null ? CupertinoColors.systemRed : CupertinoColors.systemGrey),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                if (emailError != null)
                  Padding(
                    padding: EdgeInsets.only(left: 10, top: 5),
                    child: Text(emailError!, style: TextStyle(color: CupertinoColors.systemRed, fontSize: 14)),
                  ),
                SizedBox(height: 20),
                CupertinoTextField(
                  controller: _passwordController,
                  placeholder: 'Password',
                  clearButtonMode: OverlayVisibilityMode.editing,
                  obscureText: true,
                  obscuringCharacter: '*',
                  decoration: BoxDecoration(
                    border: Border.all(color: passwordError != null ? CupertinoColors.systemRed : CupertinoColors.systemGrey),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                if (passwordError != null)
                  Padding(
                    padding: EdgeInsets.only(left: 10, top: 5),
                    child: Text(passwordError!, style: TextStyle(color: CupertinoColors.systemRed, fontSize: 14)),
                  ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CupertinoCheckbox(
                      value: agreePersonalData,
                      onChanged: (bool? value) {
                        setState(() {
                          agreePersonalData = value!;
                        });
                      },
                    ),
                    SizedBox(width: 2),
                    Text(
                      'I agree to proceed.',
                      style: TextStyle(
                        color: CupertinoColors.systemGrey,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 30),
                Center( // Centering the button
                  child: CupertinoButton.filled(
                    child: Text('Sign Up'),
                    onPressed:() {
    insertrecord();
    // Add validation and sign in logic here
    },
                  ),
                ),
                SizedBox(height: 20),
                Center(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        CupertinoPageRoute(
                          builder: (context) => const SignInScreen(),
                        ),
                      );
                    },
                    child: Text(
                      'Already have an account? Sign in',
                      style: TextStyle(
                        color: CupertinoTheme.of(context).primaryColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}