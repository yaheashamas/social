import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social/core/components/components.dart';
import 'package:social/layout/Home_page.dart';
import 'package:social/modules/login/login_screen.dart';
import 'package:social/modules/register/cubit/register_cubit.dart';

// ignore: must_be_immutable
class RegisterScreen extends StatelessWidget {
  RegisterScreen({Key? key}) : super(key: key);

  //var
  var formKey = GlobalKey<FormState>();
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(),
      child: BlocConsumer<RegisterCubit, RegisterState>(
        listener: (context, state) {
          if (state is RegisterCreateUserSuccessState) {
            navigateTo(context: context, Widget: LoginScreen());
            defaultToast(
              message: "add user successfully",
              colorsToaster: colorsToast.SUCCESS,
            );
          } else if (state is RegisterErrorState) {
            defaultToast(
              message: state.error.toString(),
              colorsToaster: colorsToast.ERROR,
            );
          } else if (state is RegisterCreateUserErrorState) {
             defaultToast(
              message: state.error.toString(),
              colorsToaster: colorsToast.ERROR,
            );
          }
          // if (state is RegisterSuccessState) {
          //   if (state.loginModel.status) {
          //     defaultToast(
          //       message: state.loginModel.message,
          //       colorsToaster: colorsToast.SUCCESS,
          //     );
          //     navigateToRemove(context: context, Widget: LoginScreen());
          //   } else {
          //     defaultToast(
          //       message: state.loginModel.message,
          //       colorsToaster: colorsToast.ERROR,
          //     );
          //   }
          // }
          // if (state is RegisterErrorState) {
          //   defaultToast(
          //     message: state.error,
          //     colorsToaster: colorsToast.ERROR,
          //   );
          // } else if (state is RegisterUserErrorState) {
          //   defaultToast(
          //     message: state.error,
          //     colorsToaster: colorsToast.ERROR,
          //   );
          // } else if (state is CreateUserSuccessState) {
          //   defaultToast(
          //     message: "Add Success",

          //     colorsToaster: colorsToast.SUCCESS,
          //   );
          //   navigateToRemove(context: context, Widget: HomePage());
          // }
        },
        builder: (context, state) {
          var cubit = RegisterCubit.get(context);
          return Scaffold(
            appBar: AppBar(),
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
                          "Register",
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          "Register now to communicate with friends",
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                        const SizedBox(
                          height: 40.0,
                        ),
                        defaultTextFormField(
                          controller: nameController,
                          text: "Name",
                          iconData: Icons.account_circle_outlined,
                          textInputType: TextInputType.name,
                          validation: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Name is required';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        defaultTextFormField(
                          controller: emailController,
                          text: "Email",
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
                        defaultTextFormField(
                          controller: phoneController,
                          text: "Phone",
                          iconData: Icons.phone,
                          textInputType: TextInputType.phone,
                          validation: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Phone is required';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        state is RegisterLoadingState
                            ? const Center(child: CircularProgressIndicator())
                            : defaultButton(
                                text: "Register",
                                function: () async {
                                  if (formKey.currentState!.validate()) {
                                    RegisterCubit.get(context).userRegister(
                                      email: emailController.text,
                                      password: passwordController.text,
                                      name: nameController.text,
                                      phone: phoneController.text,
                                    );
                                  }
                                },
                              )
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
