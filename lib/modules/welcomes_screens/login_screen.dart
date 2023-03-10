import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../modules/welcomes_screens/register_screen.dart';
import '../../layout/shop_layout.dart';
import '../../shared/components/widgets.dart';
import '../../shared/cubit/shop_cubit.dart';
import '../../shared/network/local/cache_helper.dart';
import '../../shared/styles/colors.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var emailcontroller = TextEditingController();
    var passcontroller = TextEditingController();

    return BlocConsumer<ShopCubit, ShopState>(
      listener: (context, state) {
        if (state is ShopSuccessState) {
          if (state.loginModel.status) {
            // print(state.loginModel.message);
            // print(state.loginModel.data!.token);
            CacheHelper.writeData(
              key: 'token',
              value: state.loginModel.data!.token,
            ).then(
              (value) => navigateAndFinish(context, const ShopLayout()),
            );
          } else {
            // print(state.loginModel.message);
            showToast(
              msg: state.loginModel.message,
              state: ToastStates.error,
            );
          }
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Welcome!',
                      style: TextStyle(
                        fontSize: 34,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 4,
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const Text(
                      'Sign in to continue',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.5,
                      ),
                    ),
                    const SizedBox(
                      height: 55,
                    ),
                    defaultTextField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please Enter Your Email Address !';
                        }
                        return null;
                      },
                      controller: emailcontroller,
                      label: 'Email Adress',
                      prefix: Icons.email_outlined,
                      textType: TextInputType.emailAddress,
                    ),
                    const SizedBox(
                      height: 35,
                    ),
                    defaultTextField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Password Is Too Short !';
                        }
                        return null;
                      },
                      controller: passcontroller,
                      label: 'Password',
                      prefix: Icons.lock_outline,
                      suffix: BlocProvider.of<ShopCubit>(context).suffix,
                      isPasswordShow:
                          BlocProvider.of<ShopCubit>(context).isPasswordShow,
                      suffixPressed: () {
                        BlocProvider.of<ShopCubit>(context)
                            .changePasswordVisibility();
                      },
                      textType: TextInputType.visiblePassword,
                      onSubmit: (value) {
                        if (formKey.currentState!.validate()) {
                          BlocProvider.of<ShopCubit>(context).userLogin(
                              email: emailcontroller.text,
                              password: passcontroller.text);
                        }
                      },
                    ),
                    const SizedBox(
                      height: 64,
                    ),
                    Container(
                      width: double.infinity,
                      child: Column(
                        children: [
                          Visibility(
                            visible: state is! ShopLoadingState,
                            replacement: const Center(
                                child: CircularProgressIndicator()),
                            child: defaultButton(
                              title: 'login',
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  BlocProvider.of<ShopCubit>(context).userLogin(
                                      email: emailcontroller.text,
                                      password: passcontroller.text);
                                }
                              },
                              color: defaultColor,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          TextButton(
                            onPressed: () {},
                            child: const Text(
                              'Forget Password?',
                            ),
                          ),
                          const SizedBox(
                            height: 22,
                          ),
                          defaultDivider(context: context),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    socialMediaIconButton(),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Don\'t have account?',
                        ),
                        defaultTextButton(
                          onPressed: () =>
                              navigateTo(context, RegisterScreen()),
                          title: '\t\tSign up',
                        ),
                        // InkWell(
                        //   onTap: () => navigateTo(context, RegisterScreen()),
                        //   child: const Text(
                        //     '\t\tSign up',
                        //     style: TextStyle(
                        //       fontWeight: FontWeight.bold,
                        //     ),
                        //   ),
                        // ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
