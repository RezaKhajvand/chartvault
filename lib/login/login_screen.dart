import 'dart:ui';
import 'package:chartvault/const/borderradius.dart';
import 'package:chartvault/const/colors.dart';
import 'package:chartvault/const/gradbackground.dart';
import 'package:chartvault/const/texttheme.dart';
import 'package:chartvault/home/view/home_screen.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //nativeside

  final double metaballheight = 250;
  final FocusNode usernameNode = FocusNode();
  final FocusNode passsNode = FocusNode();
  @override
  void initState() {
    super.initState();
    usernameNode.addListener(() => setState(() {}));
    passsNode.addListener(() => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Container(
      decoration: backgroundDecoration,
      child: SafeArea(
        child: GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: Colors.transparent,
            body: ClipRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 40.0, sigmaY: 40.0),
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Positioned(
                        top: 0,
                        child: SizedBox(
                          height: screenHeight * 0.32,
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Image.asset(
                              'images/loginimage.png',
                              height: double.infinity,
                            ),
                          ),
                        )),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: ClipRect(
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 20.0, sigmaY: 20.0),
                          child: AnimatedContainer(
                            curve: Curves.ease,
                            duration: const Duration(milliseconds: 300),
                            height: usernameNode.hasFocus || passsNode.hasFocus
                                ? screenHeight
                                : screenHeight * 0.65,
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.vertical(
                                  top: Radius.circular(20)),
                              color: CustomColors.loginCard,
                              border: Border(
                                top: BorderSide(
                                    width: 0.6,
                                    color: Colors.white.withOpacity(0.2)),
                              ),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SingleChildScrollView(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 30, vertical: 20),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text('Enter youre login information',
                                          style: context.dateSmall),
                                      const SizedBox(height: 15),
                                      TextField(
                                        keyboardType:
                                            TextInputType.emailAddress,
                                        textInputAction: TextInputAction.next,
                                        focusNode: usernameNode,
                                        style: const TextStyle(
                                            color: Colors.white),
                                        decoration: InputDecoration(
                                          labelStyle: context.bodyMedium,
                                          labelText: 'Username',
                                          prefixIcon: Icon(
                                            Icons.lock_outline_rounded,
                                            size: 20,
                                            color: usernameNode.hasFocus ||
                                                    passsNode.hasFocus
                                                ? CustomColors.brightBlue
                                                : null,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 15),
                                      TextField(
                                        textInputAction: TextInputAction.done,
                                        keyboardType:
                                            TextInputType.emailAddress,
                                        focusNode: passsNode,
                                        obscureText: true,
                                        style: const TextStyle(
                                            color: Colors.white),
                                        decoration: InputDecoration(
                                          labelStyle: context.bodyMedium,
                                          labelText: 'Password',
                                          prefixIcon: Icon(
                                            Icons.lock_outline_rounded,
                                            size: 20,
                                            color: usernameNode.hasFocus ||
                                                    passsNode.hasFocus
                                                ? CustomColors.brightBlue
                                                : null,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 20),
                                      Container(
                                        height: 45,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        width: double.infinity,
                                        child: ElevatedButton(
                                            onPressed: () =>
                                                Navigator.of(context)
                                                    .pushReplacement(
                                                        MaterialPageRoute(
                                                  builder: (context) =>
                                                      const HomeScreen(),
                                                )),
                                            child: const Text('Login')),
                                      ),
                                      const SizedBox(height: 25),
                                      Text('Or', style: context.headlineMedium),
                                      const SizedBox(height: 15),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: List.generate(
                                          3,
                                          (index) => Container(
                                            padding: const EdgeInsets.all(10),
                                            decoration: BoxDecoration(
                                                color: Colors.white
                                                    .withOpacity(0.1),
                                                borderRadius:
                                                    CustomRadius.cardRadius),
                                            child: const Icon(
                                              Icons.telegram,
                                              size: 30,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 20.0),
                                  child: Text('Don t have an account? Signup',
                                      style: context.labelSmall),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
