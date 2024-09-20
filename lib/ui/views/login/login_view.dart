import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:thuprai_delivery/base/ui_toolkits/logo.dart';
import 'package:thuprai_delivery/base/ui_toolkits/primary_button.dart';
import 'package:thuprai_delivery/base/ui_toolkits/primary_textfield.dart';
import 'package:thuprai_delivery/base/ui_toolkits/title_text.dart';
import 'package:thuprai_delivery/ui/views/login/login_view.form.dart';

import 'login_viewmodel.dart';

@FormView(
    fields: [FormTextField(name: 'email'), FormTextField(name: "password")])
class LoginView extends StackedView<LoginViewModel> with $LoginView {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    LoginViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,
        appBar: AppBar(
          leading: Icon(Icons.arrow_back_ios_new,
              color: Theme.of(context).colorScheme.onPrimary),
          backgroundColor: Theme.of(context).colorScheme.secondary,
          centerTitle: true,
          title: TitleText(
            text: "Login",
            color: Theme.of(context).colorScheme.onPrimary,
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                SizedBox(
                  height: 80.h,
                ),
                Logo(
                  height: 150.h,
                  width: 150.w,
                ),
                PrimaryTextfield(
                  prefix: const Icon(
                    Icons.mail,
                    size: 16,
                  ),
                  controller: emailController,
                  obscure: false,
                  hintText: "Email",
                ),
                PrimaryTextfield(
                  obscure: viewModel.passwordVisible,
                  suffix: GestureDetector(
                    onTap: () {
                      viewModel.suffixIconTap();
                    },
                    child: viewModel.suffixIcon,
                  ),
                  controller: passwordController,
                  hintText: "Password",
                  prefix: const Icon(
                    Icons.lock,
                    size: 16,
                  ),
                ),
                PrimaryButton(
                  text: "Login",
                  onTap: () {},
                ),
              ],
            ),
          ),
        ));
  }

  @override
  void onViewModelReady(LoginViewModel viewModel) => SchedulerBinding.instance
      .addPostFrameCallback((timeStamp) => viewModel.suffixIconTap());
  @override
  LoginViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      LoginViewModel();
}
