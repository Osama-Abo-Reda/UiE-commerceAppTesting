import 'package:flutter/material.dart';
import '../../modules/welcomes_screens/login_screen.dart';
import '../../shared/components/widgets.dart';
import '../../shared/styles/colors.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  var namecontroller = TextEditingController();
  var textcontroller = TextEditingController();
  var passcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Hi!',
                style: TextStyle(
                  fontSize: 34,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 4,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              const Text(
                'Create a new account',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.5,
                ),
              ),
              const SizedBox(
                height: 44,
              ),
              defaultTextField(
                controller: namecontroller,
                label: 'Name',
                prefix: Icons.person,
                validator: (value) {},
                textType: TextInputType.name,
              ),
              const SizedBox(
                height: 35,
              ),
              defaultTextField(
                controller: textcontroller,
                label: 'Email Adress',
                prefix: Icons.email,
                validator: (value) {},
                textType: TextInputType.emailAddress,
              ),
              const SizedBox(
                height: 35,
              ),
              defaultTextField(
                controller: passcontroller,
                label: 'Password',
                prefix: Icons.lock,
                validator: (value) {
                  print(value);
                },
                textType: TextInputType.visiblePassword,
              ),
              const SizedBox(
                height: 44,
              ),
              Container(
                width: double.infinity,
                child: Column(
                  children: [
                    defaultButton(
                      title: 'sign up',
                      onPressed: () {},
                      color: defaultColor,
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    defaultDivider(context: context),
                  ],
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              socialMediaIconButton(),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Already have account?',
                  ),
                  defaultTextButton(
                    onPressed: () => navigateTo(context, LoginScreen()),
                    title: '\t\tSign in',
                  ),
                  // InkWell(
                  //   onTap: () => navigateTo(context, LoginScreen()),
                  //   child: const Text(
                  //     '\t\tSign in',
                  //     style: TextStyle(
                  //       fontWeight: FontWeight.bold,
                  //     ),
                  //   ),
                  // ),
                ],
              ),
              //
            ],
          ),
        ),
      ),
    );
  }
}
