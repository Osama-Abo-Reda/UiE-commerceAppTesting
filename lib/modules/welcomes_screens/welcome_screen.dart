import 'package:flutter/material.dart';
import '../../shared/components/widgets.dart';
import '../../shared/styles/colors.dart';
import '../../modules/welcomes_screens/login_screen.dart';
import '../../modules/welcomes_screens/register_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Shop App',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            const Expanded(
              child: Image(
                image: AssetImage(
                  'assets/images/onBoarding4.png',
                ),
              ),
            ),
            // SizedBox(
            //   height: 16.0,
            // ),
            Text(
              'Hello !',
              style: Theme.of(context).textTheme.headline4?.copyWith(
                    color: Colors.black,
                  ),
              // TextStyle(
              //   fontSize: 26,
              //   fontWeight: FontWeight.bold,
              //   letterSpacing: 2.5,
              // ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Some title around a My App\nSome title around a My App',
              style: Theme.of(context).textTheme.bodyText2,
              // TextStyle(
              //   fontSize: 14,
              //   color: Colors.grey,
              //   fontWeight: FontWeight.bold,
              //   wordSpacing: 1.5,
              // ),
            ),
            const SizedBox(
              height: 36.0,
            ),
            defaultButton(
              title: 'login',
              color: defaultColor,
              onPressed: () {
                navigateTo(
                  context,
                  LoginScreen(),
                );
              },
            ),
            const SizedBox(
              height: 20,
            ),
            defaultButton(
              title: 'sign up',
              color: defaultColor,
              onPressed: () {
                navigateTo(
                  context,
                  RegisterScreen(),
                );
              },
            ),
            const SizedBox(
              height: 28.0,
            ),
          ],
        ),
      ),
    );
  }
}
