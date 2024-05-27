import 'package:flutter/cupertino.dart';
import 'package:expenseflow/pages/signin_screen.dart';
import 'package:expenseflow/pages/signup_screen.dart';


class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key}) ;

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Column(
        children: [
          Expanded(
            flex: 8,
            child: Container(
              padding: const EdgeInsets.symmetric(
                vertical: 0,
                horizontal: 40.0,
              ),
              child: Center(
                child: RichText(
                  textAlign: TextAlign.center,
                  text: const TextSpan(
                    children: [
                      TextSpan(
                        text: 'Welcome To ExpenseFlow!\n',
                        style: TextStyle(
                          fontSize: 45.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      TextSpan(
                        text: '\nEmpower your financial journey and take control of your expenses.',
                        style: TextStyle(
                          fontSize: 20,
                          // height: 0,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: CupertinoButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        CupertinoPageRoute(builder: (context) => SignInScreen()),
                      );
                    },
                    child: Text(
                      'SignIn',
                      style: TextStyle(color: CupertinoColors.white),
                    ),
                    color: CupertinoColors.activeBlue,
                  ),
                ),
                Expanded(
                  child: CupertinoButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        CupertinoPageRoute(builder: (context) => const SignUpScreen()),
                      );
                    },
                    child: Text(
                      'SignUp',
                      style: TextStyle(color: CupertinoColors.activeBlue),
                    ),
                    color: CupertinoColors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}