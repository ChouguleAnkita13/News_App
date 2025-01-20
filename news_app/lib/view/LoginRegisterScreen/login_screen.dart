import 'package:flutter/material.dart';
import 'package:news_app/theme/app_theme.dart';
import 'package:news_app/view/LoginRegisterScreen/widgets/custom_textfield.dart';
import 'package:news_app/view/LoginRegisterScreen/widgets/password_textfield.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  //TextEditingControllers
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  //GlobalKey
  final GlobalKey<FormState> _formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 60, left: 30, right: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/images/logo.png",
                        height: 80,
                      ),
                      Text(
                        "inshorts",
                        style: AppTheme.lightTheme.textTheme.displayLarge,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Welcome! Lets dive into your account",
                        style: AppTheme.lightTheme.textTheme.titleMedium,
                      ),
                      CustomTextfield(
                          controller: _emailController,
                          validate: (value) {
                            if (value!.trim().isEmpty ||
                                !RegExp(r'\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Z|a-z]{2,}\b')
                                    .hasMatch(value)) {
                              return 'Please Enter Valid Email';
                            }
                            return null;
                          },
                          hintText: "  Enter your email",
                          icon: Icons.email_outlined,
                          keyboardType: TextInputType.emailAddress),
                      PasswordTextfield(controller: _passwordController),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "Forgot password?",
                            style: AppTheme.lightTheme.textTheme.bodySmall,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      GestureDetector(
                        onTap: () {
                          bool loginValidated =
                              _formKey.currentState!.validate();
                          if (loginValidated) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                backgroundColor: Colors.green,
                                content: Text("Login successful"),
                                duration: Duration(seconds: 1),
                              ),
                            );

                            //   Future.delayed(const Duration(milliseconds: 400),
                            //       () {
                            Navigator.of(context).popAndPushNamed("/home");
                            //   });
                          }
                        },
                        child: Container(
                          width: MediaQuery.sizeOf(context).width,
                          alignment: Alignment.center,
                          height: 56,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color:
                                      const Color.fromRGBO(255, 179, 182, 1)),
                              borderRadius: BorderRadius.circular(32),
                              gradient: AppTheme.primaryGradient),
                          child: Text(
                            "Sign In",
                            style: AppTheme.lightTheme.textTheme.labelLarge,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text.rich(TextSpan(children: [
                        TextSpan(
                          text: "Don’t have an account?",
                          style: AppTheme.lightTheme.textTheme.bodyLarge,
                        ),
                        WidgetSpan(
                            child: GestureDetector(
                          onTap: () {
                            Navigator.of(context).pushNamed("/signup");
                          },
                          child: Text(
                            "  Sign up",
                            style: AppTheme.lightTheme.textTheme.bodyLarge
                                ?.copyWith(
                              fontWeight: FontWeight.w600,
                              color: AppTheme.primaryColor,
                            ),
                          ),
                        ))
                      ])),
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
