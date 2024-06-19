import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:school_app/components/custom_button.dart';
import 'package:school_app/constant.dart';
import 'package:school_app/routes.dart';
import 'package:school_app/screen/home_screen/home_screen.dart';
import 'package:school_app/screen/splash_screen/splash_screen.dart';

import '../ParentHomeScreen/ParentHomeScreen.dart';

late bool _passwordvisible;

class ParentLogin extends StatefulWidget {
  static String routeName = 'ParentLogin';


  @override
  State<ParentLogin> createState() => _ParentLoginState();
}

class _ParentLoginState extends State<ParentLogin> {
  final _formKey = GlobalKey<FormState>();

  get EmailValidator => null;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _passwordvisible = true;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      //when user tap anywhere on the screen == keyboard hides
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(

        appBar: AppBar(
          title: Text('Sign in'),
        ),
        body: ListView(

          //divide the body into half
          children: [
            Container(

              //media query == fit all screen sizes in same manner
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 2.8,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/images/boy.png', height: 150, width: 150),
                  SizedBox(height: kDefaultPadding / 2),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Welcome in',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(fontWeight: FontWeight.w200),
                          ),
                          Text('Bassmati School',
                              style: Theme.of(context).textTheme.bodyMedium)
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: kDefaultPadding,
                  ),
                  Text(
                    'Sign in to continue',
                    style: Theme.of(context).textTheme.bodySmall,
                  )
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(kDefaultPadding * 3),
                    topRight: Radius.circular(kDefaultPadding * 3)),
                color: kOtherColor,
              ),
              child: Padding(
                padding: const EdgeInsets.all(kDefaultPadding),
                child: Column(
                  children: [
                    Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            sizedBox,
                            buildEmailField(),
                            SizedBox(
                              height: kDefaultPadding,
                            ),
                            buildPasswordField(),
                            sizedBox,
                            DefualtButton(
                                onpress: () {
                                  if(_formKey.currentState!.validate()) {
                                    //go to next activity
                                    Navigator.pushNamedAndRemoveUntil(context,
                                        ParentHomeScreen.routeName, (route) => false);
                                  }
                                  else{
                                    AlertDialog(
                                      title: Text('ERROR'),
                                      content: Text('Email or password are not valid'),
                                      actions: [
                                        BackButtonIcon(

                                        )
                                      ],
                                    );

                                  }

                                },
                                title: 'SIGN IN',
                                iconData: Icons.arrow_forward_outlined),
                            sizedBox,
                            Align(

                              alignment: Alignment.bottomRight,
                              child:InkWell(
                                onTap: () {
                                  // يتم استدعاء هذا الكود عند النقر على النص
                                  // يمكنك هنا تنفيذ التنقل إلى الصفحة الأخرى
                                  Navigator.pushNamed(context, 'ForgetPassword');
                                },
                                child: Text(
                                  'Forget Password?',
                                  textAlign: TextAlign.end,
                                  style: TextStyle(
                                    color: kPrimaryColor,
                                    fontSize: 15,
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                              ),

                            )
                          ],
                        ))
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  TextFormField buildEmailField() {
    return TextFormField(
      textAlign: TextAlign.start,
      keyboardType: TextInputType.emailAddress,
      style: TextStyle(
        color: kTextBlackColor,
        fontSize: 17.0,
        fontWeight: FontWeight.w300,
      ),
      decoration: InputDecoration(
          labelText: 'Mobile Number/ Email',
          floatingLabelBehavior: FloatingLabelBehavior.always,
          isDense: true,
          prefixIcon: Icon(Icons.person)
        //style for form field
      ),
      autofillHints: [AutofillHints.email],
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (value){
        if(value!.isEmpty ||!RegExp(r'^[a-zA-Z]+$').hasMatch(value)){
          return 'please enter correct Email';
        }
      },
    );
  }

  TextFormField buildPasswordField() {
    return TextFormField(
      obscureText: _passwordvisible,
      textAlign: TextAlign.start,
      keyboardType: TextInputType.visiblePassword,
      style: TextStyle(
        color: kTextBlackColor,
        fontSize: 17.0,
        fontWeight: FontWeight.w300,
      ),
      decoration: InputDecoration(
          labelText: 'Password',
          floatingLabelBehavior: FloatingLabelBehavior.always,
          isDense: true,
          suffixIcon: IconButton(
            onPressed: () {
              setState(() {
                _passwordvisible = !_passwordvisible;
              });
            },
            icon: Icon(_passwordvisible
                ? Icons.visibility_off_outlined
                : Icons.visibility_off_outlined),
            iconSize: kDefaultPadding,
          ),
          prefixIcon: Icon(Icons.password_outlined)
        //style for form field

      ),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (value) {
        if (value!.isEmpty ||!RegExp(r'^[a-zA-Z]+$').hasMatch(value)){
          return 'Enter a correct password';

        } else if (value.length < 5) {
          return 'Password should be more than 5 characters';
        }
      },
    );
  }

/* String? validateEmail(String? email) {
    RegExp emailRegex = RegExp(r'^[\w\.-]+\.\w{2,3}(\.\w{2,3})?$');
    final isEmailValid = emailRegex.hasMatch(email ?? '');
    if (!isEmailValid){
      return 'Please enter a valid number';
    }
    return null;
  }*/
}
