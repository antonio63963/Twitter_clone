import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:twitter_clone/common/common.dart';
import 'package:twitter_clone/constants/ui.dart';
import 'package:twitter_clone/features/auth/view/login_view.dart';
import 'package:twitter_clone/features/auth/widgets/auth_input.dart';
import 'package:twitter_clone/theme/pallete.dart';

class SignupView extends StatefulWidget {
  static route() => MaterialPageRoute(builder: (context) => const SignupView());
  const SignupView({super.key});

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  final GlobalKey _formKey = GlobalKey();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final appBar = Ui.appBar();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: appBar,
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  AuthInput(
                    controller: _emailController,
                    hintText: 'Enter Email',
                  ),
                  const SizedBox(height: 30),
                  AuthInput(
                    controller: _passwordController,
                    hintText: 'Enter Password',
                  ),
                  const SizedBox(height: 40),
                  Align(
                    alignment: Alignment.topRight,
                    child: RoundedSmallButton(
                      onTap: () {},
                      label: "Done",
                    ),
                  ),
                  const SizedBox(height: 40),
                  RichText(
                    text: TextSpan(
                      text: "Already have an account?",
                      children: [
                        TextSpan(
                          text: '  Login',
                          style: const TextStyle(
                            color: Pallete.blueColor,
                            fontSize: 16,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.push(context, LoginView.route());
                            },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    ));
  }
}
