import 'package:flutter/material.dart';
import 'package:news_app/controller/login_register_provider.dart';
import 'package:news_app/controller/session_data.dart';
import 'package:news_app/theme/app_theme.dart';
import 'package:news_app/view/LoginRegisterScreen/widgets/custom_textfield.dart';
import 'package:news_app/view/LoginRegisterScreen/widgets/password_textfield.dart';
import 'package:news_app/view/Widgets/custom_snackbar.dart';
import 'package:provider/provider.dart';

///LOGIN SCREEN
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final loginRegisterProvider = Provider.of<LoginRegisterProvider>(context);

    /// GLOBAL KEY TO VALIDATE THE FORM
    final GlobalKey<FormState> formKey = GlobalKey();

    return Scaffold(
      /// WRAPS THE ENTIRE SCREEN WITH A SCROLLABLE VIEW TO AVOID OVERFLOW ON SMALLER SCREENS
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 60, left: 30, right: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// FORM WIDGET TO HANDLE VALIDATION AND INPUT FIELDS
              Form(
                  key: formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      /// LOGO IMAGE AT THE TOP OF THE SCREEN
                      Image.asset(
                        "assets/images/logo.png",
                        height: 80,
                      ),

                      /// APP NAME TEXT WITH CUSTOM STYLING
                      Text(
                        "inshorts",
                        style: AppTheme.lightTheme.textTheme.displayLarge,
                      ),

                      const SizedBox(
                        height: 5,
                      ),

                      /// WELCOME MESSAGE BELOW THE APP NAME
                      Text(
                        "Welcome! Lets dive into your account",
                        style: AppTheme.lightTheme.textTheme.titleMedium,
                      ),

                      /// CUSTOM TEXT FIELD FOR EMAIL INPUT
                      CustomTextfield(
                          controller: loginRegisterProvider.emailController,
                          hintText: "  Enter your email",
                          icon: Icons.email_outlined,
                          keyboardType: TextInputType.emailAddress),

                      /// CUSTOM PASSWORD FIELD WITH OBSCURE TEXT FUNCTIONALITY
                      const PasswordTextfield(),

                      /// FORGOT PASSWORD LINK
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

                      /// SIGN IN BUTTON WITH VALIDATION
                      GestureDetector(
                        onTap: () async {
                          /// CALL LOGIN METHOD FROM LOGINREGISTERPROVIDER AND PASS USER INPUTS
                          await loginRegisterProvider.loginWithEmailAndPassword(
                              email: loginRegisterProvider.emailController.text,
                              password: loginRegisterProvider
                                  .passwordController.text);

                          /// CHECK IF LOGIN IS SUCCESSFUL
                          if (loginRegisterProvider.loginMessage == "") {
                            /// STORE SESSION DATA ON SUCCESSFUL LOGIN
                            await SessionData.storeSessionData(true);

                            /// SHOW SUCCESS SNACKBAR MESSAGE
                            CustomSnackbar.showCustomSnackbar(
                                context, "Login successful");

                            /// NAVIGATE TO THE HOME SCREEN AFTER A SUCCESSFUL LOGIN
                            Navigator.of(context).popAndPushNamed("/home");
                          } else {
                            /// SHOW ERROR MESSAGE IF LOGIN FAILS
                            CustomSnackbar.showCustomSnackbar(
                                context, loginRegisterProvider.loginMessage);
                          }
                        },

                        /// CONTAINER REPRESENTING THE SIGN IN BUTTON
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

                      /// LINK TO NAVIGATE TO THE SIGN-UP SCREEN
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
