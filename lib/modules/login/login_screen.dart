import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social/core/components/components.dart';
import 'package:social/core/network/local/cashe_helper.dart';
import 'package:social/layout/Home_page.dart';
import 'package:social/modules/login/cubit/login_cubit.dart';
import 'package:social/modules/register/register_screen.dart';

class LoginScreen extends StatelessWidget {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is LoginSuccessState) {
            defaultToast(
              message: "login successfully",
              colorsToaster: colorsToast.SUCCESS,
            );
            print("state.uId =>>>>>>>> ${state.uId}");
            CacheHelper.setData(key: "uId", value: state.uId).then((value) {
              navigateToRemove(
                context: context,
                Widget: HomePage(),
              );
            });
          }
          if (state is LoginErrorState) {
            defaultToast(
              message: state.error.toString(),
              colorsToaster: colorsToast.ERROR,
            );
          }
        },
        builder: (context, state) {
          var cubit = LoginCubit.get(context);
          return Scaffold(
            body: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "LOGIN",
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          "login now to communicate with friends",
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                        const SizedBox(
                          height: 40.0,
                        ),
                        defaultTextFormField(
                          controller: emailController,
                          text: "Email Address",
                          iconData: Icons.email_outlined,
                          textInputType: TextInputType.emailAddress,
                          validation: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Email is required';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        defaultTextFormField(
                          controller: passwordController,
                          text: "Password",
                          iconData: Icons.lock_outline_sharp,
                          textInputType: TextInputType.visiblePassword,
                          suffix: cubit.iconSuffix,
                          isSecure: cubit.isSecure,
                          suffixFunction: () {
                            cubit.changeStateSecure();
                          },
                          validation: (value) {
                            if (value == null || value.isEmpty) {
                              return 'password is required';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        const SizedBox(
                          height: 15.0,
                        ),
                        state is LoginLoadingState
                            ? const Center(child: CircularProgressIndicator())
                            : defaultButton(
                                text: "Login",
                                function: () async {
                                  if (formKey.currentState!.validate()) {
                                    LoginCubit.get(context).userLogin(
                                      email: emailController.text,
                                      password: passwordController.text,
                                    );
                                  }
                                },
                              ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Don't have an account?",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                navigateTo(
                                  context: context,
                                  Widget: RegisterScreen(),
                                );
                              },
                              child: const Text(
                                "Register Now!",
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
