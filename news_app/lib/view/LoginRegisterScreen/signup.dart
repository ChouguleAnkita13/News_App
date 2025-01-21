import 'package:flutter/material.dart';
import 'package:news_app/theme/app_theme.dart';
import 'package:news_app/view/LoginRegisterScreen/widgets/custom_textfield.dart';
import 'package:news_app/view/LoginRegisterScreen/widgets/password_textfield.dart';
import 'package:news_app/view/Widgets/button_container.dart'; // IMPORT THE THEME FILE

///REGISTERATION SCREEN
class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  /// TEXT EDITING CONTROLLERS TO HANDLE USER INPUT
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  /// GLOBAL KEY TO VALIDATE THE FORM
  final GlobalKey<FormState> _formKey = GlobalKey();

  /// BOOLEAN TO HANDLE THE "REMEMBER ME" CHECKBOX STATE
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 10, left: 30, right: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// BACK BUTTON TO NAVIGATE TO THE PREVIOUS SCREEN
              IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const Icon(
                  Icons.arrow_back_ios,
                  size: 24,
                  color: AppTheme.textColor,
                ),
              ),

              /// FORM TO HANDLE SIGN-UP DETAILS
              Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    /// DISPLAY THE LOGO
                    Image.asset(
                      "assets/images/logo.png",
                      height: 80,
                    ),

                    /// DISPLAY THE APP NAME
                    Text(
                      "inshorts",
                      style: AppTheme.lightTheme.textTheme.displayLarge,
                    ),
                    const SizedBox(height: 30),

                    /// HEADING: CREATE AN ACCOUNT
                    Container(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Create an account",
                        style: AppTheme.lightTheme.textTheme.titleLarge,
                      ),
                    ),

                    /// NAME INPUT FIELD
                    CustomTextfield(
                      controller: _nameController,
                      hintText: "  Enter your name",
                      icon: Icons.person_outline,
                      keyboardType: TextInputType.name,
                      validate: (value) {
                        if (value!.trim().isEmpty || value.length < 4) {
                          return "Please Enter Name";
                        }
                        return null;
                      },
                    ),

                    /// PHONE NUMBER INPUT FIELD
                    CustomTextfield(
                      controller: _phoneController,
                      validate: (value) {
                        if (value!.trim().isEmpty) {
                          return "Please Enter Mobile Number";
                        }
                        if (!RegExp(r'^[0-9]{10}$').hasMatch(value)) {
                          return 'Please enter a valid 10-digit mobile number';
                        }
                        return null;
                      },
                      hintText: "  Enter your phone number",
                      icon: Icons.phone_outlined,
                      keyboardType: TextInputType.number,
                    ),

                    /// EMAIL INPUT FIELD
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

                    /// PASSWORD INPUT FIELD
                    PasswordTextfield(controller: _passwordController),

                    /// "REMEMBER ME" CHECKBOX
                    Row(
                      children: [
                        Transform.scale(
                          scale: 1.1,
                          child: Checkbox(
                            value: _isChecked,
                            activeColor: AppTheme.primaryColor,
                            side: const BorderSide(
                                color: AppTheme.textColorLight),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6),
                            ),
                            onChanged: (value) {
                              setState(() {
                                _isChecked = value!;
                              });
                            },
                          ),
                        ),
                        Text.rich(TextSpan(
                          children: [
                            TextSpan(
                              text: "Remember Me?",
                              style: AppTheme.lightTheme.textTheme.bodySmall!
                                  .copyWith(color: AppTheme.textColor),
                            ),
                            TextSpan(
                              text: " Terms & Agreement",
                              style: AppTheme.lightTheme.textTheme.bodySmall
                                  ?.copyWith(
                                color: AppTheme.primaryColor,
                                fontWeight: FontWeight.w600,
                              ),
                            )
                          ],
                        )),
                      ],
                    ),
                    const SizedBox(height: 30),

                    /// SIGN-UP BUTTON
                    GestureDetector(
                        onTap: () {
                          bool isValidated = _formKey.currentState!.validate();
                          if (isValidated) {
                            Navigator.of(context).pop();
                          }
                        },
                        child: const ButtonContainer(text: "Sign Up")),
                    const SizedBox(height: 10),

                    /// NAVIGATION TO LOGIN SCREEN
                    Text.rich(TextSpan(children: [
                      TextSpan(
                        text: "Already have an account?",
                        style: AppTheme.lightTheme.textTheme.bodyMedium,
                      ),
                      WidgetSpan(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: Text("  Sign In",
                              style: AppTheme.lightTheme.textTheme.bodyLarge
                                  ?.copyWith(
                                fontWeight: FontWeight.w600,
                                color: AppTheme.primaryColor,
                              )),
                        ),
                      ),
                    ])),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
