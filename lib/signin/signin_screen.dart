import 'dart:ui';
import 'package:chartvault/const/colors.dart';
import 'package:chartvault/const/gradbackground.dart';
import 'package:chartvault/const/router.dart';
import 'package:chartvault/const/texttheme.dart';
import 'package:chartvault/signin/bloc/login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SinginPage extends StatefulWidget {
  const SinginPage({super.key});

  @override
  State<SinginPage> createState() => _SinginPageState();
}

class _SinginPageState extends State<SinginPage> {
  //nativeside
  final formkey = GlobalKey<FormState>();
  final TextEditingController usernameController =
      TextEditingController(text: 'owner@chartvault.com');
  final TextEditingController passwordController =
      TextEditingController(text: 'password');
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
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    usernameNode.dispose();
    passsNode.dispose();
    super.dispose();
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
            bottomNavigationBar: TextButton(
              onPressed: () => context.go(signupPage),
              child: Text('Don t have an account? Signup',
                  style: context.labelSmall),
            ),
            body: ClipRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 40.0, sigmaY: 40.0),
                child: Column(
                  children: [
                    SizedBox(
                      height: screenHeight * 0.21,
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Image.asset('images/loginimage.png',
                            height: double.infinity, fit: BoxFit.fitHeight),
                      ),
                    ),
                    Expanded(
                      child: ClipRect(
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 20.0, sigmaY: 20.0),
                          child: Container(
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
                                  child: Form(
                                    key: formkey,
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text('Enter youre login information',
                                            style: context.dateSmall),
                                        const SizedBox(height: 15),
                                        TextFormField(
                                          controller: usernameController,
                                          validator: (value) {
                                            if (value!.isEmpty) {
                                              return 'Cant be empty';
                                            }
                                            return null;
                                          },
                                          keyboardType:
                                              TextInputType.emailAddress,
                                          textInputAction: TextInputAction.next,
                                          focusNode: usernameNode,
                                          style: const TextStyle(
                                              color: Colors.white),
                                          decoration: InputDecoration(
                                            labelText: 'Username',
                                            prefixIcon: Icon(
                                              Icons.person_4_outlined,
                                              size: 20,
                                              color: usernameNode.hasFocus
                                                  ? CustomColors.brightBlue
                                                  : null,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(height: 15),
                                        TextFormField(
                                          controller: passwordController,
                                          validator: (value) {
                                            if (value!.isEmpty) {
                                              return 'Cant be empty';
                                            }
                                            return null;
                                          },
                                          textInputAction: TextInputAction.done,
                                          keyboardType:
                                              TextInputType.emailAddress,
                                          focusNode: passsNode,
                                          obscureText: true,
                                          style: const TextStyle(
                                              color: Colors.white),
                                          decoration: InputDecoration(
                                            labelText: 'Password',
                                            prefixIcon: Icon(
                                              Icons.lock_outline_rounded,
                                              size: 20,
                                              color: passsNode.hasFocus
                                                  ? CustomColors.brightBlue
                                                  : null,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(height: 20),
                                        BlocConsumer<LoginBloc, LoginState>(
                                          listener: (context, state) {
                                            if (state is LoginLoaded) {
                                              context.pushReplacement(homePage);
                                            }
                                            if (state is LoginError) {
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(SnackBar(
                                                      content: Text(
                                                state.errormsg,
                                                maxLines: 2,
                                              )));
                                            }
                                          },
                                          builder: (context, state) {
                                            return AnimatedContainer(
                                              width: state is LoginLoading
                                                  ? 45
                                                  : MediaQuery.of(context)
                                                          .size
                                                          .width -
                                                      60,
                                              height: 45,
                                              duration: const Duration(
                                                  milliseconds: 200),
                                              curve: Curves.ease,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                              child: ElevatedButton(
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    padding: EdgeInsets.zero,
                                                  ),
                                                  onPressed: () {
                                                    if (formkey.currentState!
                                                        .validate()) {
                                                      BlocProvider.of<
                                                                  LoginBloc>(
                                                              context)
                                                          .add(GetLoginEvent(
                                                              username:
                                                                  usernameController
                                                                      .text,
                                                              password:
                                                                  passwordController
                                                                      .text));
                                                    }
                                                  },
                                                  child: state is LoginLoading
                                                      ? const SizedBox(
                                                          height: 20,
                                                          width: 20,
                                                          child:
                                                              CircularProgressIndicator(
                                                            color: CustomColors
                                                                .brightBlue,
                                                          ))
                                                      : const Text('Singin')),
                                            );
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
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
