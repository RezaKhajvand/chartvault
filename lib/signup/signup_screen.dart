import 'dart:ui';
import 'package:chartvault/const/colors.dart';
import 'package:chartvault/const/gradbackground.dart';
import 'package:chartvault/const/router.dart';
import 'package:chartvault/const/texttheme.dart';
import 'package:chartvault/signup/bloc/signup_bloc.dart';
import 'package:chartvault/widgets/customtextfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  //nativeside
  final formkey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController(text: '');
  final TextEditingController emailController = TextEditingController(text: '');
  final TextEditingController numberController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmpassController = TextEditingController();

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
              onPressed: () => context.go(signinPage),
              child: Text('Have an account? SignIn', style: context.labelSmall),
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
                            child: SingleChildScrollView(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 30, vertical: 20),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Form(
                                    key: formkey,
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text('Enter youre login information',
                                            style: context.dateSmall),
                                        const SizedBox(height: 15),
                                        CustomTextField(
                                          controller: nameController,
                                          labelText: 'Name',
                                          prefixIcon: Icons.person_4_outlined,
                                          keyboardType:
                                              TextInputType.emailAddress,
                                        ),
                                        const SizedBox(height: 15),
                                        CustomTextField(
                                          controller: emailController,
                                          labelText: 'Email',
                                          prefixIcon: Icons.email_outlined,
                                          keyboardType:
                                              TextInputType.emailAddress,
                                        ),
                                        const SizedBox(height: 15),
                                        CustomTextField(
                                          labelText: 'Number',
                                          maxLength: 11,
                                          inputFormatters: [
                                            FilteringTextInputFormatter
                                                .digitsOnly
                                          ],
                                          prefixIcon:
                                              Icons.phone_android_outlined,
                                          controller: numberController,
                                          textInputAction: TextInputAction.next,
                                        ),
                                        const SizedBox(height: 15),
                                        CustomTextField(
                                          labelText: 'Password',
                                          prefixIcon:
                                              Icons.lock_outline_rounded,
                                          controller: passwordController,
                                          textInputAction: TextInputAction.next,
                                          obscureText: true,
                                        ),
                                        const SizedBox(height: 15),
                                        CustomTextField(
                                          labelText: 'Confirm Password',
                                          prefixIcon:
                                              Icons.lock_outline_rounded,
                                          controller: confirmpassController,
                                          textInputAction: TextInputAction.next,
                                          obscureText: true,
                                        ),
                                        const SizedBox(height: 30),
                                        BlocConsumer<SignupBloc, SignupState>(
                                          listener: (context, state) {
                                            if (state is SignupSuccess) {
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(SnackBar(
                                                      content: Text(
                                                state.successmsg,
                                                maxLines: 2,
                                              )));
                                              context.pushReplacement(homePage);
                                            }
                                            if (state is SignupError) {
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(SnackBar(
                                                      content: Text(
                                                state.errormsg,
                                                maxLines: 4,
                                              )));
                                            }
                                          },
                                          builder: (context, state) {
                                            return AnimatedContainer(
                                              width: state is SignupLoading
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
                                                                  SignupBloc>(
                                                              context)
                                                          .add(GetSignupEvent(
                                                        name:
                                                            nameController.text,
                                                        email: emailController
                                                            .text,
                                                        password:
                                                            passwordController
                                                                .text,
                                                        number: numberController
                                                            .text,
                                                        confirmpassword:
                                                            confirmpassController
                                                                .text,
                                                      ));
                                                    }
                                                  },
                                                  child: state is SignupLoading
                                                      ? const SizedBox(
                                                          height: 20,
                                                          width: 20,
                                                          child:
                                                              CircularProgressIndicator(
                                                            color: CustomColors
                                                                .brightBlue,
                                                          ))
                                                      : const Text('Signup')),
                                            );
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
