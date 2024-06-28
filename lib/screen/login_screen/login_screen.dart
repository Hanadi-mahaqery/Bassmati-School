import 'package:flutter/material.dart';
import 'package:school_app/components/custom_button.dart';
import 'package:school_app/constant.dart';
import 'package:school_app/routes.dart';
import 'package:school_app/screen/home_screen/home_screen.dart';
import 'package:school_app/screen/splash_screen/splash_screen.dart';
import 'package:school_app/services/auth_services.dart';

late bool _passwordvisible;

class LoginScreen extends StatefulWidget {
  static String routeName = 'LoginScreen';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  // final AuthService _authService = AuthService();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
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
                      //  key: _formKey,
                        child: Column(
                          children: [
                            SizedBox(height: kDefaultPadding),
                            buildEmailField(),
                            SizedBox(
                              height: kDefaultPadding,
                            ),
                            buildPasswordField(),
                            SizedBox(height: kDefaultPadding),
                            DefualtButton(
                                onpress: () async {
                                  Navigator.pushNamedAndRemoveUntil(
                                    context,
                                    HomeScreen.routeName,
                                        (route) => false,
                                  );
                                  if (_formKey.currentState!.validate()) {
                                   // try {
                                      // await _authService.login(
                                      //   _emailController.text,
                                      //   _passwordController.text,
                                      // );

                                    // } catch (e) {
                                    //   showDialog(
                                    //     context: context,
                                    //     builder: (context) {
                                    //       return AlertDialog(
                                    //         title: Text('ERROR'),
                                    //         content: Text(
                                    //             'Email or password are not valid'),
                                    //         actions: [
                                    //           TextButton(
                                    //             onPressed: () {
                                    //               Navigator.of(context).pop();
                                    //             },
                                    //             child: Text('OK'),
                                    //           ),
                                    //         ],
                                    //       );
                                    //     },
                                    //   );
                                    // }
                                  } else {
                                    showDialog(
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                          title: Text('ERROR'),
                                          content: Text(
                                              'Email or password are not valid'),
                                          actions: [
                                            TextButton(
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                              child: Text('OK'),
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  }
                                },
                                title: 'SIGN IN',
                                iconData: Icons.arrow_forward_outlined),
                            SizedBox(height: kDefaultPadding),
                            Align(
                              alignment: Alignment.bottomRight,
                              child: InkWell(
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, 'ForgetPassword');
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
                            ),
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
      controller: _emailController,
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
          prefixIcon: Icon(Icons.person)),
      autofillHints: [AutofillHints.email],
      autovalidateMode: AutovalidateMode.onUserInteraction,
    );
  }

  TextFormField buildPasswordField() {
    return TextFormField(
      controller: _passwordController,
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
                : Icons.visibility_outlined),
            iconSize: kDefaultPadding,
          ),
          prefixIcon: Icon(Icons.password_outlined)),
      autovalidateMode: AutovalidateMode.onUserInteraction,
    );
  }
}
