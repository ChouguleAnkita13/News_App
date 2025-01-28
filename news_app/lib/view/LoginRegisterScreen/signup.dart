import 'package:flutter/material.dart';
import 'package:news_app/controller/login_register_provider.dart';
import 'package:news_app/theme/app_theme.dart';
import 'package:news_app/view/LoginRegisterScreen/widgets/custom_textfield.dart';
import 'package:news_app/view/LoginRegisterScreen/widgets/password_textfield.dart';
import 'package:news_app/view/Widgets/button_container.dart';
import 'package:news_app/view/Widgets/custom_snackbar.dart';
import 'package:provider/provider.dart'; // IMPORT THE THEME FILE

///REGISTERATION SCREEN
class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final loginRegisterProvider = Provider.of<LoginRegisterProvider>(context);

    /// GLOBAL KEY TO VALIDATE THE FORM
    final GlobalKey<FormState> formKey = GlobalKey();

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
                key: formKey,
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
                      controller: loginRegisterProvider.nameController,
                      hintText: "  Enter your name",
                      icon: Icons.person_outline,
                      keyboardType: TextInputType.name,
                    ),

                    /// PHONE NUMBER INPUT FIELD
                    CustomTextfield(
                      controller: loginRegisterProvider.phoneController,
                      hintText: "  Enter your phone number",
                      icon: Icons.phone_outlined,
                      keyboardType: TextInputType.number,
                    ),

                    /// EMAIL INPUT FIELD
                    CustomTextfield(
                        controller: loginRegisterProvider.emailController,
                        hintText: "  Enter your email",
                        icon: Icons.email_outlined,
                        keyboardType: TextInputType.emailAddress),

                    /// PASSWORD INPUT FIELD
                    const PasswordTextfield(),

                    /// "REMEMBER ME" CHECKBOX
                    Row(
                      children: [
                        Transform.scale(
                          scale: 1.1,
                          child: Consumer<LoginRegisterProvider>(

                              /// ACCESS THE NEWS PROVIDER INSTANCE
                              builder: (context, loginRegisterProvider, child) {
                            return Checkbox(
                              value: loginRegisterProvider.isChecked,
                              activeColor: AppTheme.primaryColor,
                              side: const BorderSide(
                                  color: AppTheme.textColorLight),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6),
                              ),
                              onChanged: (value) {
                                loginRegisterProvider.toggleCheckbox();
                              },
                            );
                          }),
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
                        onTap: () async {
                          await loginRegisterProvider
                              .signUpWithEmailAndPassword(
                                  name:
                                      loginRegisterProvider.nameController.text,
                                  email: loginRegisterProvider
                                      .emailController.text,
                                  password: loginRegisterProvider
                                      .passwordController.text,
                                  phone: loginRegisterProvider
                                      .passwordController.text);

                          ///
                          if (loginRegisterProvider.signUpMessage == "") {
                            Navigator.of(context).pop();
                          } else {
                            CustomSnackbar.showCustomSnackbar(
                                context, loginRegisterProvider.signUpMessage);
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
