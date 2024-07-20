import 'dart:ui';
import 'package:chartvault/const/borderradius.dart';
import 'package:chartvault/const/colors.dart';
import 'package:chartvault/const/gradbackground.dart';
import 'package:chartvault/const/texttheme.dart';
import 'package:chartvault/home/view/home_screen.dart';
import 'package:chartvault/login/bloc/login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //nativeside
  final formkey = GlobalKey<FormState>();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
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
                          height: screenHeight * 0.21,
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Image.asset('images/loginimage.png',
                                height: double.infinity, fit: BoxFit.fitHeight),
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
                                : screenHeight * 0.75,
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
                                              Navigator.of(context)
                                                  .pushReplacement(
                                                      MaterialPageRoute(
                                                builder: (context) =>
                                                    const HomeScreen(),
                                              ));
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
                                                      : const Text('Login')),
                                            );
                                          },
                                        ),
                                        const SizedBox(height: 25),
                                        Text('Or',
                                            style: context.headlineMedium),
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
